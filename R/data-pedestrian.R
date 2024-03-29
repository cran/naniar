#' Pedestrian count information around Melbourne for 2016
#'
#' This dataset contains hourly counts of pedestrians from 4 sensors around
#'   Melbourne: Birrarung Marr, Bourke Street Mall, Flagstaff station, and
#'   Spencer St-Collins St (south), recorded from January 1st 2016 at 00:00:00
#'   to December 31st 2016 at 23:00:00. The data is made free and publicly
#'   available from \url{https://data.melbourne.vic.gov.au/explore/dataset/pedestrian-counting-system-monthly-counts-per-hour/information/}
#'
#' @format A tibble with 37,700 rows and 9 variables:
#' \describe{
#'   \item{hourly_counts}{(integer) the number of pedestrians counted at that sensor
#'   at that time}
#'   \item{date_time}{(POSIXct, POSIXt) The time that the count was taken}
#'   \item{year}{(integer) Year of record}
#'   \item{month}{(factor) Month of record as an ordered factor (1 = January, 12 =
#'     December)}
#'   \item{month_day}{(integer) Full day of the month}
#'   \item{week_day}{(factor) Full day of the week as an ordered factor (1 = Sunday,
#'   7 = Saturday)}
#'   \item{hour}{(integer) The hour of the day in 24 hour format}
#'   \item{sensor_id}{(integer) the id of the sensor}
#'   \item{sensor_name}{(character) the full name of the sensor}
#' }
#' @name pedestrian
#' @docType data
#' @usage data(pedestrian)
#' @source \url{https://data.melbourne.vic.gov.au/explore/dataset/pedestrian-counting-system-monthly-counts-per-hour/information/}
#' @keywords datasets
#'
#' @examples
#' # explore the missingness with vis_miss
#'
#' vis_miss(pedestrian)
#'
#' # Look at the missingness in the variables
#' miss_var_summary(pedestrian)
#'
#' \dontrun{
#' # There is only missingness in hourly_counts
#' # Look at the missingness over a rolling window
#' library(ggplot2)
#' gg_miss_span(pedestrian, hourly_counts, span_every = 3000)
#' }
"pedestrian"
