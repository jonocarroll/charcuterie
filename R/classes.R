#' Is a Character a Letter?
#'
#' Compares against the values of `letters` (the English alphabet),
#' ignoring case.
#'
#' @param x A vector of characters.
#'
#' @return A boolean vector indicating whether each element of `x` is a
#'   letter (appears in `letters` ignoring case).
#'
#' @export
#'
#' @examples
#' is_letter(chars("Lee7c0deR"))
#'
#' Filter(is_letter, chars("w00t"))
is_letter <- function(x) {
  stats::setNames(tolower(x) %in% letters, x)
}

#' Is a Character a Number?
#'
#' Compares against the values of `0:9` (as a number).
#'
#' @param x A vector of characters.
#'
#' @return A boolean vector indicating whether each element of `x` is a
#'   number (appears in `0:9` as a number)
#'
#' @export
#'
#' @examples
#' is_number(chars("Lee7c0deR"))
#'
#' Filter(is_number, chars("w00t"))
is_number <- function(x) {
  stats::setNames(x %in% as.character(0:9), x)
}

#' Is a Character a Letter OR a Number?
#'
#' A combination of [is_letter()] and [is_number()].
#'
#' @param x A vector of characters.
#'
#' @return A boolean vector indicating whether each element of `x` is a
#'   letter or a number.
#'
#' @export
#'
#' @examples
#' is_alnum(chars("Lee7c0deR 4 L1fe"))
#'
#' Filter(is_alnum, chars("2 B or !2 B"))
is_alnum <- function(x) {
  stats::setNames(is_letter(x) | is_number(x), x)
}

#' Is a Character Punctuation?
#'
#' Compares against the regex group `[[:punct:]]`.
#'
#' @param x A vector of characters.
#'
#' @return A boolean vector indicating whether each element of `x` is
#'   considered as punctuation.
#'
#' @export
#'
#' @examples
#' is_punct(chars("I can haz?"))
#'
#' Filter(Negate(is_punct), chars("abc,123;$*%?"))
is_punct <- function(x) {
  stats::setNames(grepl("[[:punct:]]", x), x)
}
