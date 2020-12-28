act_meas_nested <- function(df_act) {
  board_register_github(repo = "duju211/strava_act")

  df_act_meas_nested <- df_act %>%
    transmute(
      id, athlete_id, type,
      github_name = str_glue("act_{id}_{athlete_id}")
    ) %>%
    mutate(meas = map(github_name, pin_get, board = "github"))

  board_disconnect("github")

  df_act_meas_nested
}
