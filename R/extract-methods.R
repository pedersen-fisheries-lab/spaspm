#' Extract methods
#'
#' WIP extract variables from sspm objects
#'
#' @param x **\[sspm_...\]** An object from this package.
#' @param name **\[character\]** The name of the column
#'
#' @return
#' The `data.frame` matching the request.
#'
#' @export
#' @rdname extract-methods
setMethod("$",
          "sspm_boundary",
          function(x, name) {
            x@boundaries %>%
              dplyr::select(c(name, spm_boundary_colum(x), "geometry"))
          }
)

#' @export
#' @rdname extract-methods
setMethod("$",
          "sspm_discrete_boundary",
          function(x, name) {
            x@boundaries %>%
              dplyr::select(c(name, spm_boundary_colum(x), "geometry"))
          }
)

#' @export
#' @rdname extract-methods
setMethod("$",
          "sspm_dataset",
          function(x, name) {
            if (is.null(x@smoothed_data)) {
              x@data %>%
                dplyr::select(c(name, spm_time_column(x), "geometry"))
            } else {
              x@smoothed_data %>%
                dplyr::select(c(name, spm_time_column(x), "geometry"))
            }
          }
)

#' @export
#' @rdname extract-methods
setMethod("$",
          "sspm",
          function(x, name) {
            if (is.null(x@smoothed_data)) {
              x@data %>%
                dplyr::select(c(name, spm_time_column(x), "geometry"))
            } else {
              x@smoothed_data %>%
                dplyr::select(c(name, spm_time_column(x), "geometry"))
            }
          }
)

#' @export
#' @rdname extract-methods
setMethod("$",
          "sspm_fit",
          function(x, name) {
            if (is.null(x@smoothed_data)) {
              x@data %>%
                dplyr::select(c(name, spm_time_column(x), "geometry"))
            } else {
              x@smoothed_data %>%
                dplyr::select(c(name, spm_time_column(x), "geometry"))
            }
          }
)
