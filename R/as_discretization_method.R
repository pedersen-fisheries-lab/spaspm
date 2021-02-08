#' Cast into a discretization_method object
#'
#' TODO
#'
#' @export
setGeneric(name = "as_discretization_method",
           def = function(method, ...){
             standardGeneric("as_discretization_method")
           }
)

# Methods -----------------------------------------------------------------

#' @export
#' @describeIn as_discretization_method TODO
setMethod(f = "as_discretization_method",
          signature(method = "character"),
          function(method, ...){

            if(!checkmate::test_choice(method, spm_methods())){
              paste0("Method must be one of: ", paste0(spm_methods(),
                                                       collapse =  ", " ))
            }

            method_object <- new("discretization_method",
                                 name = method,
                                 method = dispatch_method(method))

            return(method_object)
          }
)


# Helpers -----------------------------------------------------------------

#' Get the list of available discretization methods
#'
#' Currently, only one discretization method is supported:
#'     * `"tesselate_voronoi"` Voronoi tessellation using the function
#'       [tesselate_voronoi][tesselate_voronoi].
#'
#' You can create your own method using TODO.
#'
#' @return
#' A `character vector` of all available discretization methods.
#'
#' @export
spm_methods <- function(){
  choices <- c('tesselate_voronoi')
  return(choices)
}

dispatch_method <- function(discretization_method){

  checkmate::assert_character(discretization_method)

  if (discretization_method == "tesselate_voronoi"){
    return(tesselate_voronoi)
  } else {
    stop()
  }
}