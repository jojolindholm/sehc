\name{standardize_opinions_on_claims}
\alias{standardize_opinions_on_claims}
\title{Standardize opinions_on_claims}

\usage{
standardize_opinions_on_claims(opinions_on_claims)
}

\description{
This function simplifies the dataset \link{opinions_on_claims} in two ways. First, it replaces \code{outcome_money} and  \code{outcome_other} with a single variable that captures claim outcome on the same scale, from complete failure (0) to complete success (1), regardless of \code{claim_class}. Second, it inverts the outcome for the more rare situation that the respondent side in the first instance (see \code{claim_side} in \link{opinions_on_claims}) brings a claim so that claim outcome always reflect outcome for the applicant side in the first instance. By doing so, the function returns a new, standardized variable, \code{opinion_outcome_for_applicant}.
}

\examples{
opinions_on_claims <- opinions_on_claims |>
  standardize_opinions_on_claims()
}

\author{
Johan Lindholm, Umeå University, \email{johan.lindholm@umu.se}
}

\seealso{
  \code{\link{opinions_on_claims}}
}
