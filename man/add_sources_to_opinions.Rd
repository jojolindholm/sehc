\name{add_sources_to_opinions}
\alias{add_sources_to_opinions}
\title{Add sources to opinions}

\usage{
add_sources_to_opinions(opinions)
}

\description{
This function counts the number of references to sources cited by opinion and source subclass (see \link{references}). It then adds that information to opinions along with the total number of references per opinion. These variables are for example helpful when comparing legal reasoning.
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
  \code{\link{add_method_dimensions_to_opinions}},
  \code{\link{add_interest_impact_to_opinions}}
}
