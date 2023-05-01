\name{add_appointments_to_votes}
\alias{add_appointments_to_votes}
\title{Add appointments to votes}

\usage{
add_appointments_to_votes(appointments)
}

\description{
A function for combining data from different datasets. This function adds all variables from the dataset \link{appointments} to the dataset \link{votes}, for example variables on voting Justice gender, professional background, and appointing government.

Note that the package contains functions that add variables to \link{appointments}. If you want to add those variables to votes, you should run these functions before running \code{add_appointments_to_votes}: \code{\link{add_government_to_appointments}}, and \code{\link{add_background_type_to_appointments}}.
}

\examples{
appointments <- appointments |>
  add_government_to_appointments() |>
  add_background_type_to_appointments()

votes <- generate_votes_from_opinions() |>
  add_appointments_to_votes(appointments)
}

\author{
Johan Lindholm, Umeå University, \email{johan.lindholm@umu.se}
}

\seealso{
  \code{\link{generate_votes_from_opinions}},
  \code{\link{add_government_to_appointments}},
  \code{\link{add_background_type_to_appointments}}
}
