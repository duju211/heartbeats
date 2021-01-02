glm_net_wf <- function(df_act) {
  glmnet_recipe <-
    recipe(formula = average_heartrate ~ ., data = select(df_act, -c(start_date))) %>%
    update_role(id, new_role = "ID") %>%
    step_string2factor(type, athlete_id) %>%
    step_knnimpute(elev_high, elev_low) %>%
    step_novel(all_nominal() & all_predictors(), -all_outcomes()) %>%
    step_dummy(all_nominal() & all_predictors(), -all_outcomes()) %>%
    step_zv(all_predictors()) %>%
    step_normalize(all_predictors() & all_numeric(), -all_nominal())

  glmnet_spec <-
    linear_reg(penalty = tune(), mixture = tune()) %>%
    set_mode("regression") %>%
    set_engine("glmnet")

  workflow() %>%
    add_recipe(glmnet_recipe) %>%
    add_model(glmnet_spec)
}
