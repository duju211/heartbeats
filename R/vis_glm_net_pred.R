vis_glm_net_pred <- function(glm_net_fit) {
  collect_predictions(glm_net_fit) %>%
    bind_cols(
      select(testing(first(pull(glm_net_fit, splits))), -average_heartrate)) %>%
    ggplot(aes(x = average_heartrate, y = .pred, color = type)) +
    geom_point() +
    geom_abline(linetype = 2) +
    coord_fixed()
}
