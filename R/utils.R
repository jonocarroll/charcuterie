rewrap <- function(f, x, ...) {
  arg <- ifelse(length(formals(eval(parse(text=f)))) == 1, "unclass(x)", "unclass(x), ...")
  res <- eval(parse(text = paste0(f, "(", arg ,")")))
  class(res) <- c("chars", "character")
  res
}

rewrap_xy <- function(f, x, y, ...) {
  res <- eval(parse(text = paste0(f, "(unclass(x), unclass(y), ...)")))
  class(res) <- c("chars", "character")
  res
}
