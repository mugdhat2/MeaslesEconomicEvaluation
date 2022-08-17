setwd("/project/biocomplexity/mat3kk/Measles_run/EconEval/")
filelist = list.files(getwd(), recursive = T, full.names = T)
filelist <- grep("nodetrait_cost", filelist, value = T)
df <- rbind(lapply(1:length(filelist), fread))

pt_cost = fread("/project/biocomplexity/mat3kk/pid_homestay_cost_econ_eval.csv")
pt_cost <<- set_names(pt_cost$home_stay_cost_per_day, pt_cost$pid)

df <- df %>% 
  mutate(replicate = str_extract(filename, "replicate_[0-9]{1,}") %>% str_remove("replicate_"),
         tau = str_extract(filename, "tau_0.[0-9]") %>% str_remove("tau_"),
         vhi = str_extract(filename, "vhi_[0-9]{2}") %>% str_remove("vhi_"),
         alpha = str_extract(filename, "vacc_[0-9]{2}") %>% str_remove("vacc_"),
         cost = n_days*pt_cost[pid])
