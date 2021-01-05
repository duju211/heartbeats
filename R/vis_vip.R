vis_vip <- function(mod_spec, mod_tune, mod_rec, mod_method, bpm_train) {
  imp_spec <- mod_spec %>%
    finalize_model(select_best(mod_tune, metric = "rmse")) %>%
    set_engine(mod_method, importance = "permutation")

  workflow() %>%
    add_recipe(mod_rec) %>%
    add_model(imp_spec) %>%
    fit(bpm_train) %>%
    pull_workflow_fit() %>%
    vip(aesthetics = list(alpha = 0.8, fill = "midnightblue"))
}
