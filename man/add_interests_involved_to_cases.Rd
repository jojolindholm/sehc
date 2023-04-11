\name{add_interests_involved_to_cases}
\alias{add_interests_involved_to_cases}
\title{Add interests involved to cases}

\usage{
add_interests_involved_to_cases(cases)
}

\description{
A function that adds dummy variables to cases that show which legally protected societal interests were at stake in the case. This variable is calculated on the basis of the opinion-level variables interest_positively_affected and interest_negatively_affected (see \code{\link{opinions}}). The variables show whether any opinion affected the interest (1) or not (0). They can be used as an alternative to traditional area of laws.
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
  \code{\link{add_area_dummies_to_cases}},
  \code{\link{add_party_dummies_to_cases}}
}
