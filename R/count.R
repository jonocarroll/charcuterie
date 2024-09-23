#' Count Characters in a Chars Object
#'
#' @param x A vector of characters.
#' @param value character (length 1) to count
#' @param ignore.case should the letter case be ignored?
#'
#' @return integer, count of instances of `value` in `x`
#' @export
#'
#' @examples
#' count(chars("strawberry"), 3)
count <- function(x, value, ignore.case = FALSE) {
  if (ignore.case) {
    x <- tolower(x)
    value <- tolower(value)
  }
  sum(x == value, na.rm = TRUE)
}
