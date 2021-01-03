pre_process_act <- function(df_act_raw, complete_rate) {
  df_act_raw %>%
    select(
      id, distance, moving_time, elapsed_time, total_elevation_gain, type,
      start_date, average_heartrate, elev_high, athlete_id,
      elev_low, average_temp, max_speed, average_speed, average_cadence
    ) %>%
    select(where(~ sum(!is.na(.x)) / length(.x) >= complete_rate)) %>%
    relocate(average_heartrate, id)
}
