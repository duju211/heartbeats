source("libraries.R")

dir_ls("R") %>%
  walk(source)

bpm_plan <- drake_plan(
  strange_ids = c("1327213889"),
  complete_rate = 0.9,

  df_act_raw = act_raw(),
  df_act = pre_process_act(df_act_raw, complete_rate),
  df_act_run = filter(df_act, type == "Run"),
  df_act_id_rel = distinct(df_act, id, athlete_id, type),
  df_act_meas_nested = act_meas_nested(df_act_id_rel),
  df_act_meas = act_meas(df_act_meas_nested, complete_rate),
  gg_eda_act_run = vis_eda_act_run(df_act),
  gg_eda_act_ride = vis_eda_act_ride(df_act),
  gg_eda_act_meas_run = vis_eda_act_meas(df_act_meas, "Run"),
  gg_eda_act_meas_ride = vis_eda_act_meas(df_act_meas, "Ride"),

  set.seed(123),
  init_split = initial_split(df_act_run, strata = average_heartrate),
  bpm_train = training(init_split),
  bpm_test = testing(init_split),
  set.seed(234),
  bpm_folds = bootstraps(bpm_train, strata = average_heartrate),

  glm_net_recipe = glm_net_rec(df_act_run),
  glm_net_specification = glm_net_spec(),
  glm_net_workflow = glm_net_wf(glm_net_recipe, glm_net_specification),
  glm_net_tune = glm_net_tune_wf(glm_net_workflow, bpm_folds),
  glm_net_fit = glm_net_last_fit(glm_net_workflow, glm_net_tune, init_split),
  gg_glm_net_fit = vis_glm_net_pred(glm_net_fit),

  rf_recipe = rf_rec(df_act_run),
  rf_specification = rf_spec(),
  rf_workflow = rf_wf(rf_recipe, rf_specification),
  rf_tune = rf_tune_wf(rf_workflow, bpm_folds),
  rf_fit = rf_last_fit(rf_workflow, rf_tune, init_split),
  gg_rf_fit = vis_glm_net_pred(rf_fit),

  bpm_report = target(
    command = {
      rmarkdown::render(knitr_in("heartbeats_report.Rmd"))
      file_out("heartbeats_report.html")
    })
)

drake_config(bpm_plan)
