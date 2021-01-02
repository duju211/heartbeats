rf <- function(df_act_meas, bpm_folds) {
  ranger_recipe <-
    recipe(formula = heartrate ~ ., data = df_act_meas) %>%
    step_string2factor(id, type) %>%
    step_knnimpute(altitude)

  ranger_spec <-
    rand_forest(mtry = tune(), min_n = tune(), trees = 1000) %>%
    set_mode("regression") %>%
    set_engine("ranger")

  ranger_workflow <-
    workflow() %>%
    add_recipe(ranger_recipe) %>%
    add_model(ranger_spec)

  set.seed(79891)
  ranger_tune <-
    tune_grid(ranger_workflow, resamples = bpm_folds, grid = 5)
}
