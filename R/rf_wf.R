rf_wf <- function(rf_recipe, rf_specification) {
  workflow() %>%
    add_recipe(rf_recipe) %>%
    add_model(rf_specification)
}
