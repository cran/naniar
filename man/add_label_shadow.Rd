% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add-cols.R
\name{add_label_shadow}
\alias{add_label_shadow}
\title{Add a column describing whether there is a shadow}
\usage{
add_label_shadow(data)
}
\arguments{
\item{data}{data.frame}
}
\value{
data.frame with a column, "any_missing", which describes whether or
not there are any rows that have a shadow value.
}
\description{
Instead of focussing on labelling whether there are missings, we instead
focus on whether there have been any shadows created. This can be useful
when data has been imputed and you need to determine which rows contained
missing values when the shadow was bound to the dataset.
}
\examples{

airquality \%>\%
  add_shadow(Ozone, Solar.R) \%>\%
  add_label_shadow()

}