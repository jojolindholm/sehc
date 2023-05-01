\name{add_method_dimensions_to_opinions}
\alias{add_method_dimensions_to_opinions}
\title{Add method dimensions to opinions}

\usage{
add_method_dimensions_to_opinions(opinions)
}

\description{
The function generates two variables that seek capture the type of legal reasoning used in legal opinions to the dataset \link{opinion}. Based on the number of references to different types of classes of sources (calculated using the function \code{\link{add_sources_to_opinions}}), the function calculates and adds variables for each opinion on (a) the share of sources cited in the opinion that are extra-legislative in nature (\code{sources_extra_legislative_percent}) and (b) the share of sources cited in the opinion that are extra-national in nature (\code{sources_extra_national_percent}).

Note that this function takes a little bit of time to run.
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
  \code{\link{add_interest_impact_to_opinions}}
}
