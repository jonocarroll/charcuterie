#' Elements of x except those in y
#'
#' Does not treat the operation as a set
#'
#' @param x larger vector
#' @param y smaller vector
#'
#' @export
#' @examples
#' except(c(1:5), 3)
#' except(chars("abcde"), "c")
#' except(chars("abracadabra"), "b")
except <- function(x, y) {
  x[! x %in% y]
}
