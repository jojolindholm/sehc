\name{add_area_dummies_to_cases}
\alias{add_area_dummies_to_cases}
\title{Add area dummies to cases}
\usage{
add_area_dummies_to_cases(cases)
}
\description{
A function for replacing \code{legal_area} in \link{cases} with easily understandable dummy variables on the areas of law affected by the case.
}
\examples{
cases <- cases |>
  add_area_dummies_to_cases() |>
  add_party_dummies_to_cases() |>
  add_interests_involved_to_cases()
}

\author{
Johan Lindholm, Umeå University, \email{johan.lindholm@umu.se}
}

\seealso{
  \code{\link{cases}},
  \code{\link{add_party_dummies_to_cases}},
  \code{\link{add_interests_involved_to_cases}}
}
