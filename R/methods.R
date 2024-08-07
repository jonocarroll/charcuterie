#' @export
format.chars <- function(x, ...) {
  rewrap(base::format, x, ...)
}

#' @export
print.chars <- function(x, ...) {
  print(string(x), ...)
}

#' @export
sort.chars <- function(x, decreasing = FALSE, ...) {
  rewrap(sort, x, decreasing = decreasing, ...)
}

#' @export
rev.chars <- function(x) {
  rewrap(rev, x)
}

#' @importFrom utils head
#' @inheritParams utils::head
#' @export
head.chars <- function(x, ...) {
  rewrap(utils::head, x, ...)
}

#' @importFrom utils tail
#' @inheritParams utils::tail
#' @export
tail.chars <- function(x, ...) {
  rewrap(utils::tail, x, ...)
}

#' @inheritParams `[`
#' @export
`[.chars` <- function(x, ...) {
  rewrap(`[`, x, ...)
}

#' @inheritParams base::c
#' @export
c.chars <- function(...) {
  res <- unlist(unclass(list(...)))
  class(res) <- c("chars", "character")
  res
}

#' @inheritParams base::setdiff
#' @importFrom generics setdiff
#' @export
setdiff.chars <- function(x, y, ...) {
  rewrap_xy(setdiff, x, y, ...)
}

#' @inheritParams base::union
#' @importFrom generics union
#' @export
union.chars <- function(x, y, ...) {
  rewrap_xy(union, x, y, ...)
}

#' @inheritParams base::intersect
#' @importFrom generics intersect
#' @export
intersect.chars <- function(x, y, ...) {
  rewrap_xy(intersect, x, y, ...)
}

#' @inheritParams base::unique
#' @export
unique.chars <- function(x, ...) {
  rewrap(unique, x, ...)
}

