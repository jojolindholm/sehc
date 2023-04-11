\name{add_interest_impact_to_opinions}
\alias{add_interest_impact_to_opinions}
\title{Add interest impact to opinions}

\usage{
add_interest_impact_to_opinions(opinions)
}

\description{
This function adds variables on how different legally protected societal interests were affected by the high court opinion’s holding. The function reformats the variables \code{interest_positively_affected} and \code{interest_negatively_affected} into one variable per lower-level interest (e.g. \code{interest_crime_prevention}), plus one variable per higher-level interest (e.g. \code{interest_all_private_economic}).

If the opinion affects an interest postively, the value "1" is assigned. If the opinion affects an interest negatively, the value "-1" is assigned. If the opinion affects the interest both negatively and positively or if the opinion has no impact on the interest but another opinion in the same case does, the value "0" is assigned. In all other instances, "NA" is assigned.

These variables can, for example, be used to analyze development of and variance in interest preference and precedental impact.
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
  \code{\link{add_cases_variables_to_opinions}},
  \code{\link{add_sources_to_opinions}},
  \code{\link{add_method_dimensions_to_opinions}}
}
