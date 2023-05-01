\name{add_cases_to_references}
\alias{add_cases_to_references}
\title{Add cases to references}

\usage{
add_cases_to_references(references)
}

\description{
A function for combining data from different datasets. This function adds all variables from the dataset \code{\link{cases}} to the dataset \code{\link{references}}, for example variables on decision date, parties, and areas of law.

Note that the package contains functions that add variables to cases. If you want to add those variables to references, you should run these functions before running \code{add_cases_to_references}: \code{add_party_dummies_to_cases}, \code{\link{add_area_dummies_to_cases}}, and \code{\link{add_interests_involved_to_cases}}.
}

\examples{
references <- references |>
  add_cases_to_references()
}

\author{
Johan Lindholm, Umeå University, \email{johan.lindholm@umu.se}
}

\seealso{
  \code{\link{references}}
}
