rewrap <- function(f, x, ...) {
  res <- f(unclass(x), ...)
  class(res) <- c("chars", "character")
  res
}

rewrap_xy <- function(f, x, y, ...) {
  res <- f(unclass(x), unclass(y), ...)
  class(res) <- c("chars", "character")
  res
}
