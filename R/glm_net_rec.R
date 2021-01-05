glm_net_rec <- function(df_act) {
  glmnet_recipe <-
    recipe(formula = average_heartrate ~ ., data = df_act) %>%
    update_role(id, new_role = "ID") %>%
    step_date(start_date, features = c("year")) %>%
    step_rm(start_date) %>%
    step_string2factor(type, athlete_id) %>%
    step_knnimpute(elev_high, elev_low) %>%
    step_novel(all_nominal() & all_predictors(), -all_outcomes()) %>%
    step_dummy(all_nominal() & all_predictors(), -all_outcomes()) %>%
    step_zv(all_predictors()) %>%
    step_normalize(all_predictors() & all_numeric(), -all_nominal())
}
