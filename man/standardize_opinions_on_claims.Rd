\name{standardize_opinions_on_claims}
\alias{standardize_opinions_on_claims}
\title{Standardize opinions_on_claims}

\usage{
standardize_opinions_on_claims(opinions_on_claims)
}

\description{
This function simplifies the dataset \link{opinions_on_claims} by replacing other variables with a new, variable: \code{opinion_outcome_for_applicant}. This new variable captures all claim outcomes, regardless of \code{claim_class}, on the same scale where 0 means complete failure and 1 complete success. Also, instead of measuring outcome for the claimant, who may be either the applicant or the respondent in the first instance (see \code{claim_side} in \link{opinions_on_claims}), this variable measures always reflect outcome for the applicant side in the first instance. This simplifies analysis of claim outcomes, e.g. against variables in \link{cases}.
}

\examples{
opinions_on_claims <- opinions_on_claims |>
  standardize_opinions_on_claims() |>
  add_cases_to_opinion_on_claims()
}

\author{
Johan Lindholm, Umeå University, \email{johan.lindholm@umu.se}
}

\seealso{
  \code{\link{opinions_on_claims}},
  \code{\link{add_cases_to_opinions_on_claims}}
}
