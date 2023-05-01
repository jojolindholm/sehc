\name{add_interests_involved_to_cases}
\alias{add_interests_involved_to_cases}
\title{Add interests involved to cases}

\usage{
add_interests_involved_to_cases(cases)
}

\description{
A function that adds dummy variables to the dataset \link{cases} that capture whether differnt, legally-protected societal interests were at stake in the case. This variable is calculated on the basis of the variables \code{interest_positively_affected} and \code{interest_negatively_affected} in the dataset link{opinions}. The variables show whether any high-court opinion in the case affected the relevant interest postively or negatively (1) or not at all (0). These variables can e.g. be used as an alternative to traditional area of laws to understand.
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
