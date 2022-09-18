require(data.table)
require(rlang)
require(tidyverse)
pt_cost = fread("/project/biocomplexity/mat3kk/pid_homestay_cost_econ_eval.csv")
pt_cost <<- set_names(pt_cost$home_stay_cost_per_day, pt_cost$pid)

df_all = data.frame()

df <- bind_rows(lapply(1:10, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])

df_all = bind_rows(df_all, aggregate(df$cost, by = list(dirname(df$filename)), "sum"))

df2 <- bind_rows(lapply(11:20, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df2$cost, by = list(dirname(df2$filename)), "sum"))


df3 <- bind_rows(lapply(21:30, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df3$cost, by = list(dirname(df3$filename)), "sum"))


df4 <- bind_rows(lapply(31:40, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df4$cost, by = list(dirname(df4$filename)), "sum"))


df5 <- bind_rows(lapply(41:50, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df5$cost, by = list(dirname(df5$filename)), "sum"))


df6 <- bind_rows(lapply(51:60, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df6$cost, by = list(dirname(df6$filename)), "sum"))


df7 <- bind_rows(lapply(61:70, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df7$cost, by = list(dirname(df7$filename)), "sum"))


df8 <- bind_rows(lapply(71:80, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df8$cost, by = list(dirname(df8$filename)), "sum"))


df9 <- bind_rows(lapply(81:90, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df9$cost, by = list(dirname(df9$filename)), "sum"))


df10 <- bind_rows(lapply(91:100, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df10$cost, by = list(dirname(df10$filename)), "sum"))


df11 <- bind_rows(lapply(101:110, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df11$cost, by = list(dirname(df11$filename)), "sum"))


df12 <- bind_rows(lapply(111:120, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df12$cost, by = list(dirname(df12$filename)), "sum"))

df13 <- bind_rows(lapply(121:130, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df13$cost, by = list(dirname(df13$filename)), "sum"))


df14 <- bind_rows(lapply(131:140, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df14$cost, by = list(dirname(df14$filename)), "sum"))


df15 <- bind_rows(lapply(141:150, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df15$cost, by = list(dirname(df15$filename)), "sum"))

df16 <- bind_rows(lapply(151:160, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df16$cost, by = list(dirname(df16$filename)), "sum"))


df17 <- bind_rows(lapply(161:170, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df17$cost, by = list(dirname(df17$filename)), "sum"))


df18 <- bind_rows(lapply(171:180, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df18$cost, by = list(dirname(df18$filename)), "sum"))

df19 <- bind_rows(lapply(181:190, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df19$cost, by = list(dirname(df19$filename)), "sum"))


df20 <- bind_rows(lapply(191:200, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df20$cost, by = list(dirname(df20$filename)), "sum"))


df21 <- bind_rows(lapply(201:210, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df21$cost, by = list(dirname(df21$filename)), "sum"))


df22 <- bind_rows(lapply(211:220, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df22$cost, by = list(dirname(df22$filename)), "sum"))


df23 <- bind_rows(lapply(221:230, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df23$cost, by = list(dirname(df23$filename)), "sum"))


df24 <- bind_rows(lapply(c(231:238, "239_1", "239_2", "239_3", "240_1", "240_2", "240_3"), function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df24$cost, by = list(dirname(df24$filename)), "sum"))


df25 <- bind_rows(lapply(241:250, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df25$cost, by = list(dirname(df25$filename)), "sum"))


df26 <- bind_rows(lapply(251:260, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df26$cost, by = list(dirname(df26$filename)), "sum"))


df27 <- bind_rows(lapply(c(261:263, paste0(rep(264:270, each = 3), "_", 1:3)), function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df27$cost, by = list(dirname(df27$filename)), "sum"))


df28 <- bind_rows(lapply(271:280, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df28$cost, by = list(dirname(df28$filename)), "sum"))


df29 <- bind_rows(lapply(281:290, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df29$cost, by = list(dirname(df29$filename)), "sum"))


df30 <- bind_rows(lapply(291:300, function(i){fread(paste0("/project/biocomplexity/mat3kk/Measles_run/EconEval/splitup_nodeTrait/nodetrait_cost_", i, ".csv"))}))%>% 
  mutate(cost = n_days*pt_cost[pid])
df_all = bind_rows(df_all, aggregate(df30$cost, by = list(dirname(df30$filename)), "sum"))

df_all_new = aggregate(df_all$x, by = list(df_all$Group.1), "sum")

names(df_all_new) <- c("filename", "cost")

# df_all <- df_all %>% 
#   mutate(replicate = str_extract(filename, "replicate_[0-9]{1,}") %>% str_remove("replicate_"),
#          tau = str_extract(filename, "tau_0.[0-9]") %>% str_remove("tau_"),
#          vhi = str_extract(filename, "vhi_[0-9]{2}") %>% str_remove("vhi_"),
#          alpha = str_extract(filename, "vacc_[0-9]{2}") %>% str_remove("vacc_"),
#          cost = n_days*pt_cost[pid])

inci_df <- fread("/project/biocomplexity/mat3kk/Measles_run/EconEval/total_incidence_all.csv")
inci_df$filename = dirname(inci_df$filename)
inci_df$expt = basename(dirname(inci_df$filename))

# df_agg <- aggregate(df_agg$x, by = list(df_agg$Group.2), "mean")
# inci_agg <- aggregate(inci_df$incidence, by = list(inci_df$folder), "mean")

df_agg <- full_join(df_all_new, inci_df, by = c("filename"))

write.csv(df_agg, "/project/biocomplexity/mat3kk/Measles_run/EconEval/cost_inci_by_rep_expt.csv", row.names = F)

require(ggplot2)
ggplot(df_agg, aes(x = incidence, y = cost, color = factor(vhi))) + geom_point(aes(shape=factor(tau))) + facet_wrap(~factor(alpha))

