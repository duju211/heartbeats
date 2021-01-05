pre_process_act <- function(df_act_raw) {
  df_act_raw %>%
    select(
      id, distance, moving_time, elapsed_time, total_elevation_gain, type,
      start_date, average_heartrate, elev_high, athlete_id,
      elev_low, max_speed, average_speed,
    ) %>%
    mutate(start_date = as_date(start_date)) %>%
    relocate(average_heartrate, id)
}
