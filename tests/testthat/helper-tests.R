library(testthat)
library(checkmate)
library(dplyr)
library(sf)
library(mgcv)
library(sspm)

# Objects used for tests
borealis_simulated <- sspm:::borealis_simulated
predator_simulated <- sspm:::predator_simulated
sfa_boundaries <- sspm:::sfa_boundaries
borealis_patches <- sspm:::borealis_patches
borealis_points <- sspm:::borealis_points
borealis_spatial <- sspm:::borealis_simulated_spatial
predator_spatial <- sspm:::predator_simulated_spatial

# Method
discret_method <- new("discretization_method",
                      name = "voronoi_method",
                      method = tesselate_voronoi)

# Boundaries
boundary <- new("sspm_boundary",
                boundaries = sfa_boundaries,
                boundary_column = "sfa")

boundary_discrete <- new("sspm_discrete_boundary",
                         boundaries = sfa_boundaries,
                         boundary_column = "sfa",
                         method = discret_method,
                         patches = borealis_patches,
                         points = borealis_points)

# Base objects
biomass_dataset <- new("sspm_dataset",
                       name = "Biomass",
                       data = borealis_spatial,
                       type = "biomass",
                       time_column = "year_f",
                       uniqueID = "uniqueID",
                       coords = c('lon_dec', 'lat_dec'))

predator_dataset <- new("sspm_dataset",
                        name = "Predator",
                        type = "predictor",
                        data = predator_spatial,
                        time_column = "year",
                        uniqueID = "uniqueID",
                        coords = c('lon_dec', 'lat_dec'))

catch_dataset <- new("sspm_dataset",
                     name = "Catch",
                     type = "catch",
                     data = predator_spatial,
                     time_column = "year",
                     uniqueID = "uniqueID",
                     coords = c('lon_dec', 'lat_dec'))

# Formula
sspm_formula <- new("sspm_formula",
                    raw_formula = as.formula("weight_per_km2 ~ smooth_time() +
                                               smooth_space() + smooth_space_time()"),
                    translated_formula = as.formula("weight_per_km2 ~ s(year_f,
                      k = 24L, bs = 're', xt = list(penalty = pen_mat_time)) +
                      s(patch_id, k = 30, bs = 'mrf', xt = list(penalty = pen_mat_space)) +
                      ti(year_f, patch_id, k = c(24, 30), bs = c('re', 'mrf'),
                      xt = list(year_f = list(penalty = pen_mat_time),
                      patch_id = list(penalty = pen_mat_space)))"),
                    vars = list(pen_mat_time = matrix(),
                                pen_mat_space = matrix()),
                    response = "weight_per_km2")

# Smoothed objects
biomass_dataset_smoothed <- new("sspm_dataset",
                                name = "Biomass",
                                data = borealis_spatial,
                                type = "biomass",
                                time_column = "year_f",
                                uniqueID = "uniqueID",
                                coords = c('lon_dec', 'lat_dec'),
                                formulas = list(sspm_formula),
                                smoothed_data = borealis_spatial,
                                smoothed_fit = list(),
                                is_mapped = TRUE)

predator_dataset_smoothed <- new("sspm_dataset",
                                 name = "Predator",
                                 type = "predictor",
                                 data = predator_spatial,
                                 time_column = "year",
                                 uniqueID = "uniqueID",
                                 coords = c('lon_dec', 'lat_dec'),
                                 formulas = list(sspm_formula),
                                 smoothed_data = predator_spatial,
                                 smoothed_fit = list(),
                                 is_mapped = TRUE)
# -------------------------------------------------------------------------

all_data <- list(biomass = biomass_dataset_smoothed,
                 predator = predator_dataset_smoothed,
                 catch = catch_dataset)

sspm_model <- new("sspm",
                  datasets = all_data,
                  time_column = spm_time_column(biomass_dataset_smoothed),
                  uniqueID = "row_ID",
                  boundaries = spm_boundaries(biomass_dataset_smoothed),
                  smoothed_data = borealis_spatial,
                  is_split = FALSE)

sspm_fit <- new("sspm_fit",
                smoothed_data = all_data,
                time_column = spm_time_column(biomass_dataset_smoothed),
                uniqueID = spm_unique_ID(biomass_dataset_smoothed),
                formula = sspm_formula,
                boundaries = spm_boundaries(biomass_dataset_smoothed),
                fit = bam(data = mtcars, mpg ~ wt, family = gaussian))
