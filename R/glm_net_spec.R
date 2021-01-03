glm_net_spec <- function() {
  glmnet_spec <-
    linear_reg(penalty = tune(), mixture = tune()) %>%
    set_mode("regression") %>%
    set_engine("glmnet")
}
