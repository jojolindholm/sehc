\name{cases}
\alias{cases}
\docType{data}
\title{
Cases
}
\description{
The dataset cases contains information about Swedish high court judgments with one observation per case and variables that describe the case and are the same across all courts. It includes for example information on the subject matter of the case, as well as information about the parties (applicant and respondent), and the decision date.
}
\usage{data("cases")}
\format{
  A data frame with one observation per judgment on the following variables:
  \describe{
    \item{\code{case_num}}{Deciding high court’s case number, e.g. “T4816-12”.}
    \item{\code{publication_num}}{Publication identifier, e.g. “NJA 2016 s. 288”.}
    \item{\code{decision_date}}{Date of the high court’s judgment, e.g.	“2016-12-31”.}
    \item{\code{court_provided_header}}{A short, court-provided description of the case and/or the main precedential question.}
    \item{\code{court_provided_keywords}}{Court-provided unstructured keywords.}
    \item{\code{court_provided_class}}{Court-provided procedural classification. e.g. “T”.}
    \item{\code{legal_area}}{Areas of law affected by the case.}
    \item{\code{applicant_names}}{Comma-separated names of applicants.}
    \item{\code{applicant_class}}{Comma-separated classes of applicants.}
    \item{\code{respondent_names}}{Comma-separated names of respondents.}
    \item{\code{respondent_class}}{Comma-separated classes of respondents.}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
Based on information extracted from judgments downloaded from the Swedish Naitonal Courts Adminstration's (Domstolsverket) public information system "lagrummet.se" (\url{https://lagrummet.se/lagrummet/English}).
}
\author{
Johan Lindholm, Umeå University, \email{johan.lindholm@umu.se}
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{

}

\seealso{
  \code{\link{add_area_dummies_to_cases}},
  \code{\link{add_party_dummies_to_cases}},
  \code{\link{add_interests_involved_to_cases}}
}

\keyword{datasets}
