rf_last_fit <- function(rf_workflow, rf_tune, init_split) {
  rf_final_wf <- finalize_workflow(
    rf_workflow, select_best(rf_tune, metric = "rmse"))

  rf_final_fit <- last_fit(rf_final_wf, init_split)
}
