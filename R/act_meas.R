act_meas <- function(df_act_meas_nested, complete_rate) {
  df_act_meas_nested %>%
    unnest(meas) %>%
    select(where(~ sum(!is.na(.x)) / length(.x) >= complete_rate)) %>%
    select(-c(lat, lng, athlete_id, github_name)) %>%
    relocate(heartrate) %>%
    group_by(id) %>%
    mutate(time = time / max(time)) %>%
    ungroup()
}
