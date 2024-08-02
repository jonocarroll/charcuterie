test_that("classes can be added and removed", {
  x <- chars("string")
  expect_s3_class(x, "chars")
  expect_vector(x, size = nchar("string"))
  expect_equal(x, c("s", "t", "r", "i", "n", "g"), ignore_attr = TRUE)
  expect_output(print(x), "string")
  z <- unclass(x)
  expect_type(z, "character")
  expect_vector(z, size = nchar("string"))
  expect_equal(z, c("s", "t", "r", "i", "n", "g"), ignore_attr = TRUE)
})

test_that("unimplemented usage fails", {
  expect_error(chars(NULL), regexp = "not implemented yet")
  expect_error(chars(1), regexp = "not implemented yet")
  expect_error(chars(1L), regexp = "not implemented yet")
  expect_error(chars(Sys.Date()), regexp = "not implemented yet")
  expect_error(chars(c(1, 2, 3)), regexp = "not implemented yet")
  expect_error(chars(list(1)), regexp = "not implemented yet")
  expect_error(chars(data.frame), regexp = "not implemented yet")
})

test_that("printing as string works", {
  x <- chars("string")
  expect_output(print(x), "string")
  x <- format(chars("string"))
  expect_output(print(x), "string")
})

test_that("many chars can be produced", {
  many_chars <- lapply(c("foo", "barbaz", "quxquux"), chars)
  expect_equal(lengths(many_chars), c(3, 6, 7))
  expect_equal(unclass(many_chars[[2]]), c("b", "a", "r", "b", "a", "z"))
})

test_that("pasting back together makes a string", {
  x <- string(chars("string"))
  expect_type(x, "character")
  expect_identical(x, "string")
  x <- string(chars("string"), collapse = "|")
  expect_identical(x, "s|t|r|i|n|g")
})

test_that("indexing produces a chars", {
  x <- chars("string")[3]
  expect_s3_class(x, "chars")
  expect_equal(x, "r", ignore_attr = TRUE)
  x <- chars("banana")[seq(2, 6, 2)]
  expect_s3_class(x, "chars")
  expect_equal(x, c("a", "a", "a"), ignore_attr = TRUE)
})

test_that("head and tail produce chars", {
  x <- head(chars("string"), 3)
  expect_s3_class(x, "chars")
  expect_equal(x, c("s", "t", "r"), ignore_attr = TRUE)
  x <- tail(chars("string"), 3)
  expect_s3_class(x, "chars")
  expect_equal(x, c("i", "n", "g"), ignore_attr = TRUE)
})

test_that("table works", {
  x <- table(chars("mississippi"))
  expect_s3_class(x, "table")
  expect_equal(x, c(4, 1, 2, 4), ignore_attr = TRUE)
  expect_identical(names(x), c("i", "m", "p", "s"))
})

test_that("sorting works", {
  x <- sort(chars("string"))
  expect_s3_class(x, "chars")
  expect_equal(x, c("g", "i", "n", "r", "s", "t"), ignore_attr = TRUE)
  x <- sort(chars("string"), decreasing = TRUE)
  expect_s3_class(x, "chars")
  expect_equal(x, rev(c("g", "i", "n", "r", "s", "t")), ignore_attr = TRUE)
})

test_that("reversing works", {
  x <- rev(chars("string"))
  expect_s3_class(x, "chars")
  expect_equal(x, rev(strsplit("string", "")[[1]]), ignore_attr = TRUE)
})

test_that("length works", {
  expect_true(length(chars("string")) == nchar("string"))
})

test_that("membership works", {
  expect_false("i" %in% chars("rhythm"))
  expect_true("y" %in% chars("rhythm"))
  expect_true(is.element("y", chars("rhythm")))
})

test_that("concatenation works", {
  expect_identical(c(chars("butter"), chars("fly")), chars("butterfly"))
})

test_that("set operations work", {
  expect_identical(setdiff(chars("javascript"), chars("script")), chars("jav"))
  expect_identical(union(chars("bunny"), chars("rabbit")), chars("bunyrait"))
  expect_identical(intersect(chars("bob"), chars("rob")), chars("bo"))
  expect_true(setequal(chars("stop"), chars("post")))
  expect_false(setequal(chars("stop"), chars("posit")))
  expect_identical(unique(chars("mississippi")), chars("misp"))

  # don't break other usage
  expect_identical(setdiff(1:3, 2), c(1L, 3L))
  expect_identical(union(1:3, 3:5), 1:5)
  expect_identical(intersect(1:3, 3:5), 3L)
  expect_identical(unique(c(1:5, 3:7)), 1:7)
})

test_that("other vectorised funs work", {
  expect_identical(rev(toupper(chars("string"))), chars("GNIRTS"))
  expect_identical(toString(chars("abc")), "a, b, c")
  x <- Filter(\(x) x != "a", chars("banana"))
  expect_s3_class(x, "chars")
  expect_identical(x, chars("bnn"))
})

test_that("except works", {
  expect_identical(except(chars("javascript"), chars("script")), chars("java"))
  expect_identical(except(chars("carpet"), chars("car")), chars("pet"))
  expect_identical(except(chars("banana"), "a"), chars("bnn"))
  expect_identical(except(chars("banana"), chars("a")), chars("bnn"))
})

test_that("data framing works", {
  x <- data.frame(number = 1:3, letter = chars("abc"))
  expect_true(nrow(x) == 3)
})
