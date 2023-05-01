\name{opinions_on_claims}
\alias{opinions_on_claims}
\docType{data}

\title{
The opinions on claims dataset
}

\description{
The dataset opinions_on_claims contains information about Swedish high court judgments with one observation per opinion and claim. An “opinion” refers to a section of a judgment where an individual judge or a group of judges present(s) his/her/their view and reasoning on legal issues in the case before the court (see also \link{opinions}). A "claim" refers to a claim for relief brought by one of the party sides. The dataset seeks to capture the outcome in the individual dispute to the involved parties.
}

\usage{data("opinions_on_claims")}

\format{
  A data frame with one observation per opinion and claim on the following variables:
  \describe{
    \item{\code{ooc_id}}{A unique identifier for each opinion on a claim.}
    \item{\code{opinion_id}}{A unique identifier for each opinion. See also \link{opinions}.}
    \item{\code{case_num}}{Deciding high court’s case number, e.g. “T4816-12”. See also \link{cases}}
    \item{\code{claim_id}}{A unique identifier for each opinion claim.}
    \item{\code{claim_side}}{Identifies if the claim was brought by the applicant (1) or the respondent (2).}
    \item{\code{claim_class}}{Identifies whether the claim is monetary (1) or non-monetary (2).}
    \item{\code{claim_money}}{For monetery claims, the amount sought.}
    \item{\code{claim_other}}{For non-monetary claims, the relief sought.}
    \item{\code{outcome_money}}{For monetary claims, the amount the opinion wanted to grant.}
    \item{\code{outcome_other}}{For non-monetary claims, whether the opinion wanted to not grant relief (1), to partially grant releif (2), or to grant full relief (3).}
  }
}
\details{
For more information about the dataset and the variables, download the code book (\url{https://github.com/jojolindholm/sehc/raw/main/sehc_code_book.pdf}).
}
\source{
Based on information extracted from judgments downloaded from the Swedish National Courts Adminstration's (Domstolsverket) public information system "lagrummet.se" (\url{https://lagrummet.se/lagrummet/English}).
}
\author{
Johan Lindholm, Umeå University, \email{johan.lindholm@umu.se}
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
opinions_on_claims <- opinions_on_claims |>
  standardize_opinions_on_claims() |>
  add_cases_to_opinions_on_claims()
}

\seealso{
  \code{\link{standardize_opinions_on_claims}},
  \code{\link{add_cases_to_opinions_on_claims}}
}

\keyword{datasets}
