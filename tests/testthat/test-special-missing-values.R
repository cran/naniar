context("special-missings-single-recode")

df <- tibble::tribble(
  ~wind, ~temp,
  -99,    45,
  68,    NA,
  72,    25
)

test_that("recode_shadow errors when regular dataframe passed",{
  expect_error(recode_shadow(df, temp = .where(wind == -99 ~ "bananas")))
})

dfs <- bind_shadow(df)

dfs_special <- dfs %>%
  recode_shadow(temp = .where(wind == -99 ~ "bananas"))

test_that("special missings levels are updated", {
  expect_equal(levels(dfs_special$wind_NA),
               c("!NA", "NA", "NA_bananas"))
  expect_equal(levels(dfs_special$temp_NA),
              c("!NA", "NA", "NA_bananas"))
})

test_that("special missings are put in the right place", {
  expect_equal(as.character(dfs_special$wind_NA),
               c("!NA", "!NA", "!NA"))
  expect_equal(as.character(dfs_special$temp_NA),
              c("NA_bananas", "NA", "!NA"))
})

context("special-missings-many-recode")

df_many_recode <- df %>%
  bind_shadow() %>%
  recode_shadow(temp = .where(temp == 25 ~ "broken_machine")) %>%
  recode_shadow(wind = .where(wind == -99 ~ "broken_temp"))

new_shade_levels <- c("!NA", "NA", "NA_broken_machine", "NA_broken_temp")

test_that("special missings levels are updated for many recodes", {
  expect_equal(levels(df_many_recode$wind_NA),
               new_shade_levels)
  expect_equal(levels(df_many_recode$temp_NA),
               new_shade_levels)
})

test_that("special missings are put in the right place for many recodes", {
  expect_equal(as.character(df_many_recode$wind_NA),
               c("NA_broken_temp", "!NA", "!NA"))
  expect_equal(as.character(df_many_recode$temp_NA),
               c("!NA", "NA", "NA_broken_machine"))
})

where_one <- .where(temp == 25 ~ "broken_machine")

where_two <- .where(temp == 25 ~ "broken_machine",
                    wind == 26 ~ "broken_wind")

where_three <- .where(temp == 25 ~ "broken_machine",
                      wind == 26 ~ "broken_wind",
                      arbitrary == "values" ~ "are_possible")

test_that(".where captures the right number of expressions", {
  expect_equal(sum(lengths(where_one)), 2)
  expect_equal(sum(lengths(where_two)), 4)
  expect_equal(sum(lengths(where_three)), 6)
})

test_that(".where captures the expressions into condition and suffix", {
  expect_equal(names(where_one), c("condition", "suffix"))
  expect_equal(names(where_two), c("condition", "suffix"))
  expect_equal(names(where_three), c("condition", "suffix"))
})

test_that(".where is a list", {
  expect_is(where_one, "list")
  expect_is(where_two, "list")
  expect_is(where_three, "list")
})

test_that(".where is a list", {
  expect_is(where_one, "list")
  expect_is(where_two, "list")
  expect_is(where_three, "list")
})

class_nest <- function(obj, slot) {
  purrr::pluck(obj, slot) %>% purrr::map_chr(class)
}

test_that(".where returns call class", {
  expect_true(class_nest(where_one, "condition") == "call")
  expect_true(all(class_nest(where_two, "condition") == "call"))
  expect_true(all(class_nest(where_three, "condition") == "call"))
})

test_that(".where returns chr class", {
  expect_true(class_nest(where_one, "suffix") == "character")
  expect_true(all(class_nest(where_two, "suffix") == "character"))
  expect_true(all(class_nest(where_three, "suffix") == "character"))
})

df_mult_where <- df %>%
  bind_shadow() %>%
  recode_shadow(temp = .where(temp == 25 ~ "broken_machine",
                              wind == 68 ~ "wat"))

test_that("recode_shadow returns right values if .where is called many times", {
  expect_equal(as.character(df_mult_where$wind_NA),
               c("!NA", "!NA", "!NA"))
  expect_equal(as.character(df_mult_where$temp_NA),
               c("!NA", "NA_wat", "NA_broken_machine"))
})

test_that("recode_shadow returns right levels if .where is called many times", {
  expect_equal(levels(df_mult_where$wind_NA),
               c("!NA", "NA", "NA_broken_machine", "NA_wat"))
  expect_equal(levels(df_mult_where$temp_NA),
               c("!NA", "NA", "NA_broken_machine", "NA_wat"))
})


context("recode_shadow works on grouped data")

aq_recoded <- airquality %>%
  bind_shadow() %>%
  recode_shadow(Ozone = .where(Wind <= 5 ~ "broken_machine"))

aq_grouped_recoded <- airquality %>%
  bind_shadow() %>%
  dplyr::group_by(Month) %>%
  recode_shadow(Ozone = .where(Wind <= 5 ~ "broken_machine"))

test_that("special missings are the same for grouped and ungrouped data", {
  expect_equal(aq_grouped_recoded$Ozone_NA,
               aq_recoded$Ozone_NA)
})


# these are some old tests that explore how the `is_shadow` family work
#

#
# test_that("special missings return shadow", {
#   expect_true(is_shadow(dfs_special))
# })
#
# test_that("special missings are shadows", {
#   expect_true(is_shadow(dfs_special$wind_NA))
#   expect_true(is_shadow(dfs_special$temp_NA))
# })
#
# test_that("special missings return TRUE for any_shadow", {
#   expect_true(any_shadow(dfs_special))
# })
#
# are_dfs_special <- are_shadow(dfs_special)
#
# test_that("special missings return TRUE for are_shadow", {
#   expect_false(are_dfs_special[["wind"]])
#   expect_false(are_dfs_special[["temp"]])
#   expect_true(are_dfs_special[["wind_NA"]])
#   expect_true(are_dfs_special[["temp_NA"]])
# })
#
# test_that("special missings are shadows", {
#   expect_true(is_shadow(dfs_special$wind_NA))
#   expect_true(is_shadow(dfs_special$temp_NA))
# })
#
# test_shade <- dfs$wind_NA
#
# expanded_vec <- shadow_expand_relevel(test_shade, "weee")
#
# test_that("shadow_expand_relevel returns shadow type data",{
#   expect_is(expanded_vec,
#             "shadow")
# })
#
# releveled_df <- dplyr::mutate(dfs,
#                               temp_NA = shadow_expand_relevel(temp_NA, "weee"))
#
# test_that("shadow_expand_relevel returns shadows inside a data.frame", {
#   expect_is(releveled_df$wind, "numeric")
#   expect_is(releveled_df$temp, "numeric")
#   expect_is(releveled_df$wind_NA, "shadow")
#   expect_is(releveled_df$temp_NA, "shadow")
# })