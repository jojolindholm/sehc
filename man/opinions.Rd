\name{opinions}
\alias{opinions}
\docType{data}

\title{
The opinions dataset
}

\description{
The dataset cases contains information about Swedish high court judgments with one observation per opinion. The concept of an “opinion” here refers to a section of a judgment where an individual judge or a group of judges present(s) his/her/their view and reasoning on legal issues in the case before the court. An opinion can for example be a majority opinion, a minority opinion, or a concurring opinion (see \code{opinion_class}). When several judges together issue an opinion, this means that they share a certain opinion or argument concerning the legal issue in a case before the court.
}

\usage{data("opinions")}

\format{
  A data frame with one observation per opinion on the following variables:
  \describe{
    \item{\code{opinion_id}}{A unique identifier for each opinion.}
    \item{\code{case_num}}{Deciding high court’s case number, e.g. “T4816-12”.}
    \item{\code{start_paragraph_id}}{Number of first judgment text paragraph that belong to the opinion.}
    \item{\code{stop_paragraph_id}}{Number of last judgment text paragraph that belong to the opinion.}
    \item{\code{author_appointment_id}}{Comma-separated identifiers of the high court Justices co-authoring the opinion (see \code{appointment_id} in \link{appointments}).}
    \item{\code{author_last_name}}{Surnames of the high court Justices co-authoring the opinion.}
    \item{\code{ref_appointment_id}}{appointment_id of Justice responsible for presenting a suggested judgment.}
    \item{\code{ref_last_name}}{Surnames of Justice responsible for presenting a suggested judgment.}

    \item{\code{institution_name}}{Name of the court to which the opinion belongs.}
    \item{\code{institution_class}}{Hierarchical placement of the court to which the opinion belongs, e.g. "first", "appelate", and "final".}
    \item{\code{opinion_class}}{Type of opinion, e.g. “majority”, "minority", and "concurring".}
    \item{\code{opinion_size}}{Number of high court Justices who co-authored the opinion.}
    \item{\code{panel_size}}{Number of high court Justice partaking in the judgment.}
    \item{\code{adopt_clerk}}{A dummy variable capturing if a high court opinion adopts the clerk’s opinion as its own.}

    \item{\code{intent_deference}}{Relevance of legislative intent for precedent (relative to other sources).}
    \item{\code{interest_positively_affected}}{Legally protected societal interests positively affected by the high court opinion’ holding.}
    \item{\code{interest_negatively_affected}}{Legally protected societal interests negatively affected by the high court opinion’ holding.}
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
opinions <- opinions |>
  add_cases_variables_to_opinions() |>
  add_sources_to_opinions() |>
  add_method_dimensions_to_opinions() |>
  add_interest_impact_to_opinions()
}

\seealso{
  \code{\link{add_cases_variables_to_opinions}},
  \code{\link{add_sources_to_opinions}},
  \code{\link{add_method_dimensions_to_opinions}},
  \code{\link{add_interest_impact_to_opinions}}
}

\keyword{datasets}
