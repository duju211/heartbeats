variable_importance <- function(mod_spec, mod_rec, mod_tune, bpm_train,
                                engine) {
  imp_spec <- mod_spec %>%
    finalize_model(select_best(mod_tune, metric = "rmse")) %>%
    set_engine(engine, importance = "permutation")

  workflow() %>%
    add_recipe(mod_rec) %>%
    add_model(imp_spec) %>%
    fit(bpm_train) %>%
    pull_workflow_fit() %>%
    vi()
}
