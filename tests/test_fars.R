library('testthat')

expect_that(basename(make_filename(2015)), is_identical_to("accident_2015.csv.bz2"))
