% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shadow-shifters.R
\name{shadow_shift}
\alias{shadow_shift}
\title{Shift missing values to facilitate missing data exploration/visualisation}
\usage{
shadow_shift(...)
}
\arguments{
\item{...}{arguments to \code{\link[=impute_below]{impute_below()}}.}
}
\description{
\code{shadow_shift} transforms missing values to facilitate visualisation, and has
different behaviour for different types of variables. For numeric
variables, the values are shifted to 10\% below the minimum value for a given
variable plus some jittered noise, to separate repeated values, so that
missing values can be visualised along with the rest of the data.
}
\details{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}
}
\examples{
airquality$Ozone
shadow_shift(airquality$Ozone)
\dontrun{
library(dplyr)
airquality \%>\%
    mutate(Ozone_shift = shadow_shift(Ozone))
}
}
\seealso{
\code{\link[=add_shadow_shift]{add_shadow_shift()}} \code{\link[=cast_shadow_shift]{cast_shadow_shift()}} \code{\link[=cast_shadow_shift_label]{cast_shadow_shift_label()}}
}
