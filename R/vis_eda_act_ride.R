vis_eda_act_ride <- function(df_act) {
  df_act %>%
    select(id, type, where(is.numeric)) %>%
    filter(type == "Ride") %>%
    pivot_longer(
      cols = distance:last_col(), values_to = "value", names_to = "kpi"
    ) %>%
    ggplot(aes(x = value, y = average_heartrate)) +
    geom_point() +
    facet_wrap(~kpi, scales = "free")
}
