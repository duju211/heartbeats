pre_process_act <- function(df_act_raw, strange_ids) {
  df_act_raw %>%
    select(
      id, name, distance, moving_time, elapsed_time, total_elevation_gain, type,
      start_date, average_heartrate, max_heartrate, elev_high, athlete_id,
      elev_low, average_temp, max_speed, average_speed, average_cadence
    ) %>%
    relocate(average_heartrate, id, name)
}
