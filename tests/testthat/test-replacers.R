# Test replacers for the sake of code coverage

test_that("Replacers work as expected", {

  # SSPM

  expect_match({
    spm_name(discret_method) <- "New_Name"
    spm_name(discret_method)
  }, "New_Name")

  expect_class({
    spm_boundaries(sspm_model) <- boundary_discrete
    spm_boundaries(sspm_model)
  }, "sspm_discrete_boundary")

  expect_class({
    spm_datasets(sspm_model) <- list()
    spm_datasets(sspm_model)
  }, "list")

  # Method

  expect_function({
    method_func(discret_method) <- rnorm
    method_func(discret_method)
  })

  # Formula

  expect_match({
    sspm:::format_formula(raw_formula(sspm_formula) <- as.formula(a ~ b))
  }, "a ~ b")

  expect_match({
    sspm:::format_formula(translated_formula(sspm_formula) <- as.formula(c ~ d))
  }, "c ~ d")

  expect_names({
    formula_vars(sspm_formula) <- list(a = 1, b = 2)
    names(formula_vars(sspm_formula))
  }, identical.to = c("a", "b"))

  # Data

  expect_data_frame({
    spm_data(biomass_dataset) <- mtcars
    spm_data(biomass_dataset)
  })

  expect_match({
    spm_name(biomass_dataset) <- "NewDatasetName_2"
    spm_name(biomass_dataset)
  }, "NewDatasetName_2")

  expect_match({
    spm_coords_col(biomass_dataset) <- c("one_2", "two_2")
    spm_coords_col(biomass_dataset)[1]
  }, c("one_2"))

  expect_match({
    spm_coords_col(biomass_dataset) <- c("one_2", "two_2")
    spm_coords_col(biomass_dataset)[2]
  }, c("two_2"))

  expect_match({
    spm_unique_ID(biomass_dataset) <- "New_ID_2"
    spm_unique_ID(biomass_dataset)
  }, "New_ID_2")

  expect_match({
    spm_time_column(biomass_dataset) <- "new_time_column_2"
    spm_time_column(biomass_dataset)
  }, "new_time_column_2")

})
