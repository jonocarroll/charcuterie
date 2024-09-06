#' Create a `chars` Object
#'
#' @param x object to convert to `chars`.
#' @param ... other options passed to methods.
#'
#' @return an object of class `chars`.
#'
#' @export
chars <- function(x, ...) {
  UseMethod("chars")
}

#' Create a String From a `chars` Object
#'
#' @param x one or more `chars` objects.
#' @param collapse an optional character string to separate the results. Not NA_character_.
#' @param ... other arguments passed to [paste()]
#'
#' @return a `character` (traditional R string) with the elements of `x` in a single value.
#'
#' @export
string <- function(x, collapse = "", ...) {
  paste(x, collapse = collapse, ...)
}

#' Convert an Object to `chars`
#'
#' @param x object to convert
#' @param ... other options
#' @export
#'
#' @return `.NotYetImplemented()` error
#' @export
chars.default <- function(x, ...) {
  .NotYetImplemented()
}

#' Create a `chars` Object From a String
#'
#' @param x string to convert to a `chars` object (length 1 only).
#' @param ... unused
#'
#' @details
#' `chars` expects a single string as input. To create a list of these,
#' consider `lapply(strings, chars)`
#'
#' @return an object of class `chars`, essentially splitting the string into
#'   individual characters
#'
#' @export
chars.character <- function(x, ...) {
  stopifnot("chars expects a single input; try sapply(x, chars)" = length(x) == 1)
  res <- strsplit(x, "")[[1]]
  class(res) <- c("chars", "character")
  res
}
