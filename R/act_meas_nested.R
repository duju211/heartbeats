act_meas_nested <- function(df_act_id_rel) {
  board_register_github(repo = "duju211/strava_act")

  df_act_meas_nested <- df_act_id_rel %>%
    mutate(
      github_name = str_glue("act_{id}_{athlete_id}")
    ) %>%
    mutate(meas = map(github_name, pin_get, board = "github"))

  board_disconnect("github")

  df_act_meas_nested
}
