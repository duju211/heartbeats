source("libraries.R")

dir_ls("R") %>%
  walk(source)

bpm_plan <- drake_plan(
  strange_ids = c("1327213889"),
  complete_rate = 0.9,

  df_act_raw = target(command = act_raw(), trigger = trigger(condition = TRUE)),
  df_act = pre_process_act(df_act_raw, strange_ids),
  df_act_meas_nested = act_meas_nested(df_act),
  df_act_meas = act_meas(df_act_meas_nested, complete_rate),
  gg_eda_act_run = vis_eda_act_run(df_act),
  gg_eda_act_ride = vis_eda_act_ride(df_act),
  gg_eda_act_meas_run = vis_eda_act_meas(df_act_meas, "Run"),
  gg_eda_act_meas_ride = vis_eda_act_meas(df_act_meas, "Ride"),

  bpm_report = target(
    command = {
      rmarkdown::render(knitr_in("heartbeats_report.Rmd"))
      file_out("heartbeats_report.html")
    })
)

drake_config(bpm_plan)
