#' @export
format.chars <- function(x, ...) {
  rewrap("base::format", x, ...)
}

#' @export
print.chars <- function(x, ...) {
  print.default(string(x), ...)
}

#' @export
sort.chars <- function(x, decreasing = FALSE, ...) {
  rewrap("sort", x, decreasing = decreasing, ...)
}

#' @export
rev.chars <- function(x) {
  rewrap("rev", x)
}

#' @importFrom utils head
#' @inheritParams utils::head
#' @export
head.chars <- function(x, ...) {
  rewrap("utils::head", x, ...)
}

#' @importFrom utils tail
#' @inheritParams utils::tail
#' @export
tail.chars <- function(x, ...) {
  rewrap("utils::tail", x, ...)
}

#' @inheritParams `[`
#' @export
`[.chars` <- function(x, ...) {
  res <- `[`(unclass(x), ...)
  class(res) <- c("chars", "character")
  res
}

#' @inheritParams base::c
#' @export
c.chars <- function(...) {
  res <- unlist(unclass(list(...)))
  class(res) <- c("chars", "character")
  res
}

#' Set Operations
#' @rdname methods
#' @param x vector
#' @param y vector
#' @export
setdiff <- function(x, y) {
  UseMethod("setdiff")
}

#' @inheritParams base::setdiff
#' @export
setdiff.default <- function(x, y) base::setdiff(x, y)

#' @inheritParams base::setdiff
#' @export
setdiff.chars <- function(x, y) {
  rewrap_xy("setdiff", x, y)
}

#' Set Operations
#' @rdname methods
#' @param x vector
#' @param y vector
#' @export
union <- function(x, y) {
  UseMethod("union")
}

#' @export
union.default <- function(x, y) base::union(x, y)

#' @inheritParams base::union
#' @export
union.chars <- function(x, y) {
  rewrap_xy("union", x, y)
}

#' Set Operations
#' @rdname methods
#' @param x vector
#' @param y vector
#' @export
intersect <- function(x, y) {
  UseMethod("intersect")
}

#' @export
intersect.default <- function(x, y) base::intersect(x, y)

#' @inheritParams base::intersect
#' @export
intersect.chars <- function(x, y) {
  rewrap_xy("intersect", x, y)
}

#' @inheritParams base::unique
#' @export
unique.chars <- function(x, ...) {
  rewrap("unique", x, ...)
}

