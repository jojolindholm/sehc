\name{add_interest_impact_to_opinions}
\alias{add_interest_impact_to_opinions}
\title{Add interest impact to opinions}

\usage{
add_interest_impact_to_opinions(opinions)
}

\description{
This function adds variables to \link{opinions} on how different legally protected societal interests were affected by the high court opinions’ holdings. More specifically, the function reformats the variables \code{interest_positively_affected} and \code{interest_negatively_affected} into one variable per lower-level interest (e.g. \code{interest_crime_prevention}), plus one variable per higher-level interest (e.g. \code{interest_all_private_economic}).

If the opinion affects an interest postively, the value "1" is assigned to the relevant variable. If the opinion affects an interest negatively, the value "-1" is assigned. If the opinion (a) affects the same interest both negatively and positively or (b) if the opinion has no impact on the interest but antoher opinion in the same case does, the relevant variable is assigned the value "0". In all other instances, "NA" is assigned to the relevant variables.

These variables can, for example, be used to analyze development of and variance in interest preference and precedental impact.
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
  \code{\link{add_cases_to_opinions}},
  \code{\link{add_sources_to_opinions}},
  \code{\link{add_method_dimensions_to_opinions}}
}
