vis_eda_act_meas <- function(df_act_meas, act_type) {
  df_act_meas %>%
    filter(type == act_type) %>%
    pivot_longer(
      velocity_smooth:last_col(),
      values_to = "value", names_to = "kpi"
    ) %>%
    ggplot(aes(x = value, y = heartrate)) +
    geom_hex() +
    facet_wrap(~kpi, scales = "free")
}
