\name{add_cases_variables_to_opinions}
\alias{add_cases_variables_to_opinions}
\title{Add cases variables to opinions}

\usage{
add_cases_variables_to_opinions(cases)
}

\description{
A function for combining data from difference tables. This function adds case-level variables from cases, e.g. on
decision date, parties, and areas of law, to opinions.
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
  \code{\link{add_sources_to_opinions}},
  \code{\link{add_method_dimensions_to_opinions}},
  \code{\link{add_interest_impact_to_opinions}}
}
