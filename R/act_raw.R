act_raw <- function() {
  board_register_github(repo = "duju211/strava_act")

  df_act <- pin_get("df_act", board = "github")

  board_disconnect("github")

  df_act %>%
    filter(has_heartrate) %>%
    mutate(type = if_else(type == "VirtualRide", "Ride", type)) %>%
    clean_names()
}
