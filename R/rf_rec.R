rf_rec <- function(df_act_run) {
  ranger_recipe <-
    recipe(formula = average_heartrate ~ ., data = select(df_act_run, -id)) %>%
    #add_role(id, new_role = "ID") %>%
    step_string2factor(type, athlete_id) %>%
    step_knnimpute(elev_high, elev_low)
}
