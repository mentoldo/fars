% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fars_functions.R
\name{fars_summarize_years}
\alias{fars_summarize_years}
\title{N for year and month}
\usage{
fars_summarize_years(years)
}
\arguments{
\item{years}{List or vector of years}
}
\value{
A summary tibble data frame.
}
\description{
Frecuency table by months for years passed as arguments
}
\examples{

fars_summarize_years(list(2013, 2015))

}
