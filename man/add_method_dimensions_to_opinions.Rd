\name{add_method_dimensions_to_opinions}
\alias{add_method_dimensions_to_opinions}
\title{Add method dimensions to opinions}

\usage{
add_method_dimensions_to_opinions(opinions)
}

\description{
The function generates two variables that seek capture the type of legal reasoning used in opinions. Based on the number of references to different types of classes of sources (calculated using \link{add_sources_to_opinions}), the percentage of sources ctied in each opinion that are extra-legislative (\code{sources_extra_legislative_percent}) and extra-national (\code{sources_extra_national_percent}). Note: This is still under development and takes a little bit of time to run.
}

\examples{
opinions <- opinions |>
  add_cases_variables_to_opinions() |>
  add_sources_to_opinions() |>
  add_method_dimensions_to_opinions() |>
  add_interest_impact_to_opinions()
}

\author{
Johan Lindholm, Umeå University, \email{johan.lindholm@umu.se}
}

\seealso{
  \code{\link{opinions}},
  \code{\link{add_cases_variables_to_opinions}},
  \code{\link{add_sources_to_opinions}},
  \code{\link{add_interest_impact_to_opinions}}
}
