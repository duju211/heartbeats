glm_net_last_fit <- function(glm_net_workflow, glm_net_tune, init_split) {
  final_glm <- glm_net_workflow %>%
    finalize_workflow(select_best(glm_net_tune, metric = "rmse"))

  last_fit(final_glm, init_split)
}
