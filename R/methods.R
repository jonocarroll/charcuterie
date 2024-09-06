#' Format a `chars` Object
#'
#' @param x a `chars` object.
#' @param ...  further arguments passed to or from other methods.
#'
#' @return a formatted `chars` object.
#'
#' @export
format.chars <- function(x, ...) {
  rewrap(base::format, x, ...)
}

#' Print a `chars` Object
#'
#' @param x a `chars` object.
#' @param ... further arguments passed to or from other methods.
#'
#' @return `x` (invisibly), used to print to console.
#'
#' @export
print.chars <- function(x, ...) {
  print(string(x), ...)
}

#' Sort a `chars` Object
#'
#' @param x a `chars` object.
#' @param decreasing logical. Should the sort be increasing or decreasing? Not available for partial sorting.
#' @param ... further arguments passed to or from other methods.
#'
#' @return a sorted `chars` object.
#'
#' @export
#' @examples
#' sort(chars("alphabet"))
sort.chars <- function(x, decreasing = FALSE, ...) {
  rewrap(base::sort, x, decreasing = decreasing, ...)
}

#' Reverse Elements of a `chars` Object
#'
#' @param x a `chars` object
#'
#' @return a `chars` object with the elements reversed.
#'
#' @export
#' @examples
#' rev(chars("racecar"))
#'
#' rev(chars("alphabet"))
rev.chars <- function(x) {
  rewrap(base::rev, x)
}

#' Return the First Parts of a `chars` Object
#'
#' @param x a `chars` object.
#' @param ... further arguments passed to or from other methods.
#'
#' @return the first (`n`) elements of a `chars` object as a `chars` object.
#'
#' @importFrom utils head
#' @export
#' @examples
#' head(chars("abcdefhgi"))
#'
#' head(chars("javascript"), 4)
head.chars <- function(x, ...) {
  rewrap(utils::head, x, ...)
}

#' Return the Last Parts of a `chars` Object
#'
#' @param x a `chars` object.
#' @param ... further arguments passed to or from other methods.
#'
#' @return the last (`n`) elements of a `chars` object as a `chars` object.
#'
#' @importFrom utils tail
#' @export
#' @examples
#' tail(chars("javascript"))
#'
#' tail(chars("abcdefghi"))
tail.chars <- function(x, ...) {
  rewrap(utils::tail, x, ...)
}

#' Extract or Replace Parts of a `chars` Object
#'
#' @param x a `chars` object.
#' @param ... further arguments passed to or from other methods.
#'
#' @return the extracted parts of a `chars` object, or a `chars` object with
#'   replacements performed.
#'
#' @export
#' @examples
#' s <- chars("censor")
#' s[2:5]
#' s[2:5] <- "X"
#' s
`[.chars` <- function(x, ...) {
  rewrap(`[`, x, ...)
}

#' Combine `chars` Objects
#'
#' @param ... `chars` objects.
#'
#' @return a larger `chars` object containing the combined elements of `...`.
#'
#' @export
#' @examples
#' c(chars("java"), chars("script"))
c.chars <- function(...) {
  res <- unlist(unclass(list(...)))
  class(res) <- c("chars", "character")
  res
}

#' @importFrom generics setdiff
#' @export
generics::setdiff

#' Setwise Difference Between `chars` Objects
#'
#' @param x a `chars` object.
#' @param y a `chars` object or character vector.
#' @param ... further arguments passed to or from other methods.
#'
#' @return the setwise difference of `x` and `y`.
#'
#' @export
#' @examples
#' setdiff(chars("javascript"), chars("script"))
setdiff.chars <- function(x, y, ...) {
  rewrap_xy(setdiff, x, y, ...)
}

#' @importFrom generics union
#' @export
generics::union

#' Setwise Union of `chars` Objects
#'
#' @param x a `chars` object.
#' @param y a `chars` object or character vector.
#' @param ... further arguments passed to or from other methods.
#'
#' @return the setwise union of `x` and `y`.
#'
#' @export
#' @examples
#' union(chars("java"), chars("script"))
union.chars <- function(x, y, ...) {
  rewrap_xy(union, x, y, ...)
}

#' @importFrom generics intersect
#' @export
generics::intersect

#' Setwise Intersection of `chars` Objects
#'
#' @param x a `chars` object.
#' @param y a `chars` object or character vector.
#' @param ... further arguments passed to or from other methods.
#'
#' @return the setwise intersection of `x` and `y`.
#'
#' @export
#' @examples
#' union(chars("pine"), chars("apple"))
intersect.chars <- function(x, y, ...) {
  rewrap_xy(intersect, x, y, ...)
}

#' Extract Unique Elements of `chars` Objects.
#'
#' @param x a `chars` object.
#' @param ... further arguments passed to or from other methods.
#'
#' @return a `chars` object containing unique elements.
#'
#' @export
#' @examples
#' unique(chars("mississippi"))
unique.chars <- function(x, ...) {
  rewrap(unique, x, ...)
}

