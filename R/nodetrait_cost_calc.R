require(purrr)
require(tidyverse)
require(data.table)

setwd("/project/bii_nssac/COVID-19_USA_EpiHiper/rivanna/20220707-measles/exp1/")
filelist = list.files(getwd(), recursive = T, full.names = T)
filelist <<- grep("nodeTrait.log", filelist, value = T)
# pt_cost = fread("/project/biocomplexity/mat3kk/pid_homestay_cost_econ_eval.csv")
# pt_cost <<- set_names(pt_cost$home_stay_cost_per_day, pt_cost$pid)

read_plus <- function(flnm) {
  df <- fread(flnm, stringsAsFactors = F, colClasses = c("integer", "character", "character")) 
  if(nrow(df)>0){
    df<- df %>% 
      dplyr::mutate(filename = flnm) %>% 
      filter(nodeTrait != "stayhome:selected_for_isolation", nodeTrait != "stayhome:selected_for_quarantine")
    test_df <- table(df$pid, df$nodeTrait) %>% as.data.frame(stringsAsFactors = F) %>% 
      rename(pid = Var1, nodeTrait = Var2)
    test_df <- test_df %>% 
      pivot_wider(names_from = nodeTrait, values_from = Freq) 
    test_df$x = apply(test_df[,3:ncol(test_df)],1,sum) 
    test_df$x = test_df$x - test_df$`stayhome:false`
    if(sum(test_df$x) > 0){
      n = sum(test_df$x)
      tempdf <- data.frame(tick = rep(365, n), pid = rep(test_df$pid[which(test_df$x > 0)], test_df$x[which(test_df$x > 0)] ), nodeTrait = rep("stayhome:false", n), filename = rep(flnm, n))
   df <- df %>% 
     bind_rows(tempdf)
    }
    return(df)
  }
  
}

experiment_nodetrait <- function(n, j){
  
  tbl_with_sources <-
    bind_rows(lapply(((n-1)*10+1+(j-1)*10):((10*n)+(j-1)*10), function(i){read_plus(filelist[i])}))
  
 # tbl_with_sources <-
  #  bind_rows(lapply(((n-1)*300+1):((n-1)*300+10), function(i){read_plus(filelist[i])}))
  
  print(n)
  
  test <- tbl_with_sources %>% 
    group_by(filename, pid) %>% 
    pivot_wider(names_from = nodeTrait, values_from = tick, values_fn = list)
  
  test$t_out = sapply(test$`stayhome:false`, sum)
  test$`stayhome:in_isolation` = sapply(test$`stayhome:in_isolation`, sum)
  test$`stayhome:in_quarantine` = sapply(test$`stayhome:in_quarantine`, sum)  
  test$t_in = test$`stayhome:in_isolation` + test$`stayhome:in_quarantine`
  
  test<- test %>% 
    ungroup() %>% 
    mutate(n_days = t_out - t_in) %>% 
    select(pid, n_days, filename)
  
  return(test)
}

for(i in 239:240 ){
  gc()
  for(j in 1:3){
  test <- experiment_nodetrait(i,j) 
  write.csv(test,paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, "_", j, ".csv"), row.names = F)
  rm(test)
  print(paste(i,j)) }
}

