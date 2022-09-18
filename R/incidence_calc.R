require(data.table)
require(tidyverse)
setwd("/project/bii_nssac/COVID-19_USA_EpiHiper/rivanna/20220707-measles/exp1/")
filelist = list.files(getwd(), recursive = T, full.names = T)
filelist <- grep("outputSummary.csv.gz", filelist, value = T)

read_plus_inc <- function(flnm) {
  df <- read.csv(flnm, stringsAsFactors = F)
  df$filename = flnm 
  df$incidence = `Isymp_p[current]` + `Isymp_s[current]` + `Isymp_a[current]`+ `Isymp_o[current]` + `Isymp_g[current]`
  df <- df%>% 
    select(tick, incidence, filename)
}

rep_df = rbind(lapply(filelist,read_plus_inc))
testdf <- bind_rows(rep_df)

total_df <- aggregate(testdf$incidence, by = list(testdf$filename), sum)
total_df <- total_df %>%
  rename(filename = Group.1, incidence = x) %>% 
  mutate(replicate = str_extract(filename, "replicate_[0-9]{1,}") %>% str_remove("replicate_"),
         tau = str_extract(filename, "tau_0.[0-9]") %>% str_remove("tau_"),
         vhi = str_extract(filename, "vhi_[0-9]{2}") %>% str_remove("vhi_"),
         alpha = str_extract(filename, "vacc_[0-9]{2}") %>% str_remove("vacc_"))
write.csv(total_df, "/project/biocomplexity/mat3kk/Measles_run/EconEval/total_incidence_all.csv", row.names = F)

total_df$expt = paste0("tau-",total_df$tau, "-vhi-", total_df$vhi, "-alpha-", total_df$alpha)

boxplot(total_df$incidence~total_df$expt, xlab = "", ylab = "Log of total incidence", log = "y", pars  =  list(xaxt = "n"))
axis(1, at=1:30, labels = F)
text(1:30 -1, 1.2 , labels = unique(total_df$expt), srt = 45, pos = 1, xpd = TRUE, cex = 0.65) 

