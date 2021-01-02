glm_net_tune_wf <- function(glm_net_workflow, bpm_folds) {
  glmnet_grid <- tidyr::crossing(
    penalty = 10^seq(-6, -1, length.out = 20),
    mixture = c(0.05, 0.2, 0.4, 0.6, 0.8, 1))

  glmnet_tune <-
    tune_grid(glm_net_workflow, resamples = bpm_folds, grid = glmnet_grid)
}
