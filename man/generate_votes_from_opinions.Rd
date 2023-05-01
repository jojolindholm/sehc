\name{generate_votes_from_opinions}
\alias{generate_votes_from_opinions}
\title{Generate votes from opinions}
\usage{
generate_votes_from_opinions(opinions)
}
\description{
This function generates a new dataset. This function splits final-instance observations in the dataset \link{opinions}, which may and often are authored by multiple Justice, into a new dataset, here refered to as \code{votes}. This new dataset contains one observation per participating Justice and opinion. This dataset is for example useful for conducting analysis of the behavior of individual Justices and the behavior of Justices based on their personal characteristics. To do so, it is helpful to subsequently add variables from the dataset \link{appointments} to votes using \code{\link{add_appointments_to_votes}}.

Note that the package contains functions that only apply to opinions. If you want to add those variables to votes, you should run these functions before running \code{generate_votes_from_opinions}: \code{\link{add_sources_to_opinions}}, \code{\link{add_method_dimensions_to_opinions}}, \code{\link{add_cases_to_opinions}}, and \code{\link{add_interest_impact_to_opinions}}.
}
\examples{
votes <- generate_votes_from_opinions(opinions) |>
  add_appointments_to_votes()
}
\author{
Johan Lindholm, Umeå University, \email{johan.lindholm@umu.se}
}
\seealso{
  \code{\link{add_background_type_to_appointments}},
  \code{\link{add_government_to_appointments}}
}
