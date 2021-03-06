#' Accessing OR replacing `sspm_dataset` model elements
#'
#' All methods described here allow to access the elements of contained in
#' objects of class [sspm_dataset][sspm_dataset-class].
#'
#' @param sspm_object **\[sspm_dataset\]** An object of class
#'     [sspm_dataset][sspm_dataset-class].
#' @inheritParams base::Extract
#'
#' @rdname accessors-methods-sspm_dataset

# Data --------------------------------------------------------------------
# Accessors ---------------------------------------------------------------

#' @export
setGeneric(name = "spm_data",
           def = function(sspm_object) standardGeneric("spm_data")
)

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("spm_data", signature("sspm_object" = "sspm_dataset"),
          function(sspm_object) sspm_object@data
)

# Replacers ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setGeneric(name = "spm_data<-",
           def = function(object, value) standardGeneric("spm_data<-")
)

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("spm_data<-",
          signature("object" = "sspm_dataset"),
          function(object, value) {
            object@data <- value
            validObject(object)
            return(object)
          }
)

# Name --------------------------------------------------------------------
# Accessors ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("spm_name", signature("sspm_object" = "sspm_dataset"),
          function(sspm_object) sspm_object@name
)

# Replacers ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("spm_name<-",
          signature("object" = "sspm_dataset"),
          function(object, value) {
            object@name <- value
            validObject(object)
            return(object)
          }
)

# Unique ID ---------------------------------------------------------------
# Accessors ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("spm_unique_ID",
          signature("sspm_object" = "sspm_dataset"),
          function(sspm_object) sspm_object@uniqueID
)

# Replacers ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("spm_unique_ID<-",
          signature("object" = "sspm_dataset"),
          function(object, value) {
            object@uniqueID <- value
            validObject(object)
            return(object)
          }
)

# Coords ------------------------------------------------------------------
# Accessors ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setGeneric(name = "spm_coords_col",
           def = function(sspm_object) standardGeneric("spm_coords_col")
)

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("spm_coords_col",
          signature("sspm_object" = "sspm_dataset"),
          function(sspm_object) sspm_object@coords
)

# Replacers ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setGeneric(name = "spm_coords_col<-",
           def = function(object, value) standardGeneric("spm_coords_col<-")
)

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("spm_coords_col<-",
          signature("object" = "sspm_dataset"),
          function(object, value) {
            object@coords <- value
            validObject(object)
            return(object)
          }
)

# Time col ----------------------------------------------------------------
# Accessors ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("spm_time_column",
          signature("sspm_object" = "sspm_dataset"),
          function(sspm_object) sspm_object@time_column
)

# Replacers ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("spm_time_column<-",
          signature("object" = "sspm_dataset"),
          function(object, value) {
            object@time_column <- value
            validObject(object)
            return(object)
          }
)

# Formulas ----------------------------------------------------------------
# Accessors ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("spm_formulas",
          signature("sspm_object" = "sspm_dataset"),
          function(sspm_object) sspm_object@formulas
)

# Replacers ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("spm_formulas<-",
          signature("object" = "sspm_dataset"),
          function(object, value) {
            object@formulas <- value
            validObject(object)
            return(object)
          }
)

# Type --------------------------------------------------------------------
# Accessors ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setGeneric(name = "spm_type",
           def = function(sspm_object) standardGeneric("spm_type")
)

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("spm_type",
          signature("sspm_object" = "sspm_dataset"),
          function(sspm_object) sspm_object@type
)

# Replacers ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setGeneric(name = "spm_type<-",
           def = function(object, value) standardGeneric("spm_type<-")
)

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("spm_type<-",
          signature("object" = "sspm_dataset"),
          function(object, value) {
            object@type <- value
            validObject(object)
            return(object)
          }
)

# Smoothed data -----------------------------------------------------------
# Accessors ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("spm_smoothed_data",
          signature("sspm_object" = "sspm_dataset"),
          function(sspm_object) sspm_object@smoothed_data
)

# Replacers ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("spm_smoothed_data<-",
          signature("object" = "sspm_dataset"),
          function(object, value) {
            object@smoothed_data <- value
            validObject(object)
            return(object)
          }
)

# Smoothed fit ------------------------------------------------------------
# Accessors ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setGeneric(name = "spm_smoothed_fit",
           def = function(sspm_object) standardGeneric("spm_smoothed_fit")
)

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("spm_smoothed_fit",
          signature("sspm_object" = "sspm_dataset"),
          function(sspm_object) sspm_object@smoothed_fit
)

# Replacers ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setGeneric(name = "spm_smoothed_fit<-",
           def = function(object, value) standardGeneric("spm_smoothed_fit<-")
)

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("spm_smoothed_fit<-",
          signature("object" = "sspm_dataset"),
          function(object, value) {
            object@smoothed_fit <- value
            validObject(object)
            return(object)
          }
)

# Is mapped ---------------------------------------------------------------
# Accessors ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setGeneric(name = "is_mapped",
           def = function(sspm_object) standardGeneric("is_mapped")
)

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("is_mapped",
          signature("sspm_object" = "sspm_dataset"),
          function(sspm_object) sspm_object@is_mapped
)

# Replacers ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setGeneric(name = "is_mapped<-",
           def = function(object, value) standardGeneric("is_mapped<-")
)

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("is_mapped<-",
          signature("object" = "sspm_dataset"),
          function(object, value) {
            object@is_mapped <- value
            validObject(object)
            return(object)
          }
)

# Boundaries --------------------------------------------------------------
# Accessors ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("spm_boundaries", signature("sspm_object" = "sspm_dataset"),
          function(sspm_object) sspm_object@boundaries
)

# Replacers ---------------------------------------------------------------

#' @rdname accessors-methods-sspm_dataset
#' @export
setMethod("spm_boundaries<-",
          signature("object" = "sspm_dataset"),
          function(object, value) {
            object@boundaries <- value
            validObject(object)
            return(object)
          }
)
