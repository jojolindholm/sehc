\name{add_cases_to_opinions}
\alias{add_cases_to_opinions}
\title{Add cases to opinions}

\usage{
add_cases_to_opinions(opinions)
}

\description{
A function for combining data from different datasets. This function adds all variables from the dataset \link{cases} to the dataset \link{opinions}, for example variables on decision date, parties, and areas of law.

Note that the package contains functions that add variables to \link{cases}. If you want to add those variables to opinions, you should run these functions before running \code{add_cases_to_opinions}: \code{add_party_dummies_to_cases}, \code{\link{add_area_dummies_to_cases}}, and \code{\link{add_interests_involved_to_cases}}.
}

\examples{
opinions <- opinions |>
  add_cases_to_opinions() |>
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
