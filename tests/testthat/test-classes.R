test_that("classes work", {
  x <- chars("AaZz0 ?")

  expect_identical(names(is_letter(x)), unclass(x))
  expect_equal(is_letter(x), c(rep(TRUE, 4), rep(FALSE, 3)), ignore_attr = TRUE)
  expect_identical(Filter(is_letter, x), chars("AaZz"))
  expect_identical(Filter(Negate(is_letter), x), chars("0 ?"))

  expect_identical(names(is_number(x)), unclass(x))
  expect_equal(is_number(x), c(rep(FALSE, 4), TRUE, rep(FALSE, 2)), ignore_attr = TRUE)
  expect_identical(Filter(is_number, x), chars("0"))
  expect_identical(Filter(Negate(is_number), x), chars("AaZz ?"))

  expect_identical(names(is_alnum(x)), unclass(x))
  expect_equal(is_alnum(x), c(rep(TRUE, 5), rep(FALSE, 2)), ignore_attr = TRUE)
  expect_identical(Filter(is_alnum, x), chars("AaZz0"))
  expect_identical(Filter(Negate(is_alnum), x), chars(" ?"))

  expect_identical(names(is_punct(x)), unclass(x))
  expect_equal(is_punct(x), c(rep(FALSE, 6), TRUE), ignore_attr = TRUE)
  expect_identical(Filter(is_punct, x), chars("?"))
  expect_identical(Filter(Negate(is_punct), x), chars("AaZz0 "))
})
