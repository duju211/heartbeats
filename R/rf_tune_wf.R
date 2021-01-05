rf_tune_wf <- function(ranger_workflow, bpm_folds) {
  set.seed(41210)
  tune_grid(ranger_workflow, resamples = bpm_folds, grid = 11)
}
