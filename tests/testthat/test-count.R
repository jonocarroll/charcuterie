test_that("count works", {
  expect_identical(count(strsplit("strawberry", "")[[1]], "r"), 3L)
  expect_identical(count(chars("strawberry"), "r"), 3L)
  expect_identical(count(strsplit("strawberry", "")[[1]], "x"), 0L)
  expect_identical(count(chars("strawberry"), "x"), 0L)

  expect_identical(count(chars("StRaWbErRy"), "r", ignore.case = FALSE), 1L)
  expect_identical(count(chars("StRaWbErRy"), "R", ignore.case = FALSE), 2L)
  expect_identical(count(chars("StRaWbErRy"), "r", ignore.case = TRUE), 3L)
  expect_identical(count(chars("StRaWbErRy"), "R", ignore.case = TRUE), 3L)
  expect_identical(count(chars("StRaWbErRy"), "x", ignore.case = FALSE), 0L)
  expect_identical(count(chars("StRaWbErRy"), "X", ignore.case = FALSE), 0L)
})

