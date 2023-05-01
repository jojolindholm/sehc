\name{add_cases_to_opinions_on_claims}
\alias{add_cases_to_opinions_on_claims}
\title{Add cases to opinions_on_claims}

\usage{
add_cases_to_opinions_on_claims(opinions_on_claims)
}

\description{
A function for combining data from different datasets. This function adds all variables from the dataset \link{cases} to the dataset \link{opinions_on_claims}, for example variables on decision date, parties, and areas of law.

Note that the package contains functions that add variables to cases. If you want to add those variables to opinions_on_claims, you should run these functions before running \code{add_cases_to_opinions_on_claims}: \code{add_party_dummies_to_cases}, \code{\link{add_area_dummies_to_cases}}, and \code{\link{add_interests_involved_to_cases}}.
}

\examples{
opinions_on_claims <- opinions_on_claims |>
  standardize_opinions_on_claims() |>
  add_cases_to_opinion_on_claims()
}

\author{
Johan Lindholm, Umeå University, \email{johan.lindholm@umu.se}
}

\seealso{
  \code{\link{opinions_on_claims}},
  \code{\link{standardize_opinions_on_claims}}
}
