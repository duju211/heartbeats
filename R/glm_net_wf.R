glm_net_wf <- function(glm_net_recipe, glm_net_specification) {
  workflow() %>%
    add_recipe(glm_net_recipe) %>%
    add_model(glm_net_specification)
}
