act_raw <- function() {
  board_register_github(repo = "duju211/strava_act", branch = "master")

  df_act <- pin_get("df_act", board = "github")

  board_disconnect("github")

  df_act %>%
    filter(has_heartrate) %>%
    clean_names()
}
