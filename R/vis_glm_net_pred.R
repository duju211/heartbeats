vis_glm_net_pred <- function(glm_net_fit) {
  collect_predictions(glm_net_fit) %>%
    ggplot(aes(x = average_heartrate, y = .pred)) +
    geom_point() +
    geom_abline(linetype = 2) +
    coord_fixed()
}
