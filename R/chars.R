#' Create a chars object
#'
#' @param x object to convert
#' @param ... other options
#'
#' @export
chars <- function(x, ...) {
  UseMethod("chars")
}

#' Create a string from a chars object
#'
#' @inheritParams base::paste
#' @export
string <- function(..., collapse = "") {
  paste(..., collapse = collapse)
}

#' Convert an object to chars
#' @param x object to convert
#' @param ... other options
#' @export
chars.default <- function(x, ...) {
  .NotYetImplemented()
}

#' Create a chars object from a string
#'
#' @param x string to convert to a chars object (length 1 only)
#' @param ... unused
#'
#' @details
#' `chars` expects a single string as input. To create a list of these,
#' consider `lapply(strings, chars)`
#'
#' @export
chars.character <- function(x, ...) {
  stopifnot("chars expects a single input; try sapply(x, chars)" = length(x) == 1)
  res <- strsplit(x, "")[[1]]
  class(res) <- c("chars", "character")
  res
}
