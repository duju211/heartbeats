rf_spec <- function() {
  rand_forest(mtry = tune(), min_n = tune(), trees = 1000) %>%
    set_mode("regression") %>%
    set_engine("ranger")
}
