#' naniar
#'
#' naniar is a package to make it easier to summarise and handle missing values
#' in R. It strives to do this in a way that is as consistent with tidyverse
#' principles as possible.  The work is fully discussed at Tierney & Cook (2023)
#' <doi:10.18637/jss.v105.i07>.
#'
#' @name naniar
#' @docType package
#' @seealso [add_any_miss()] [add_label_missings()] [add_label_shadow()] [add_miss_cluster()] [add_n_miss()] [add_prop_miss()] [add_shadow()] [add_shadow_shift()] [as_shadow()] [bind_shadow()] [cast_shadow()] [cast_shadow_shift()] [cast_shadow_shift_label()] [draw_key_missing_point()] [gather_shadow()] [geom_miss_point()] [gg_miss_case()] [gg_miss_case_cumsum()] [gg_miss_fct()] [gg_miss_span()] [gg_miss_var()] [gg_miss_var_cumsum()] [gg_miss_which()] [label_miss_1d()] [label_miss_2d()] [label_missings()] [pct_miss_case()] [prop_miss_case()] [pct_miss_var()] [prop_miss_var()] [pct_complete_case()] [prop_complete_case()] [pct_complete_var()] [prop_complete_var()] [miss_prop_summary()] [miss_case_summary()] [miss_case_table()] [miss_summary()] [miss_var_prop()] [miss_var_run()] [miss_var_span()] [miss_var_summary()] [miss_var_table()] [n_complete()] [n_complete_row()] [n_miss()] [n_miss_row()] [pct_complete()] [pct_miss()] [prop_complete()] [prop_complete_row()] [prop_miss()] [prop_miss_row()] [replace_to_na()] [replace_with_na()] [replace_with_na_all()] [replace_with_na_at()] [replace_with_na_if()] [shadow_shift()] [stat_miss_point()] [vis_miss()] [where_na()]
"_PACKAGE"

#' @import ggplot2
#' @import rlang
NULL

#' @importFrom stats median
#' @importFrom visdat vis_miss
#' @export
visdat::vis_miss

## usethis namespace: start
#' @importFrom lifecycle deprecated
## usethis namespace: end
NULL


if(getRversion() >= "2.15.1")  utils::globalVariables(c("."))
globalVariables(
  c(
    "median",
    "variable_NA",
    ".temp",
    ".temp_label",
    "rows",
    "..missing..",
    "n_miss",
    "case",
    "variable",
    "value",
    "span_counter",
    "n",
    "n_miss",
    "n_in_span",
    "nheight",
    "pct_miss",
    "n_miss_in_case",
    "values",
    "n_miss_in_case",
    "n_miss_in_var",
    "n_vars",
    "span_every",
    "n_miss_cumsum",
    "as.formula",
    "complete.cases"
    )
  )
