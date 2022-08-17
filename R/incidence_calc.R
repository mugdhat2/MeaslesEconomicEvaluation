setwd("/project/bii_nssac/COVID-19_USA_EpiHiper/rivanna/20220707-measles/exp1/")
filelist = list.files(getwd(), recursive = T, full.names = T)
filelist <- grep("outputSummary.csv.gz", filelist, value = T)

read_plus_inc <- function(flnm) {
  df <- fread(flnm)
  df <- df %>% 
    mutate(filename = flnm,
           incidence = `Isymp_p[current]` + `Isymp_s[current]` + `Isymp_a[current]`+ `Isymp_o[current]` + `Isymp_g[current]`) %>% 
    select(tick, incidence, filename)
}

rep_df = rbind(lapply(filelist,read_plus_inc))

total_df <- aggregate(rep_df$incidence, by = list(rep_df$filename), sum)