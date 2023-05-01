\name{references}
\alias{references}
\docType{data}

\title{
The references dataset
}

\description{
This dataset contains one observation per reference to a source. It identifies which legal sources and which types of legal sources were referred to in each high court judgment and by a Justice or a group of Justices co-authoring an opinion. It can, for example, be used to study references over time and compare references between opinions.
}

\usage{data("references")}

\format{
  A data frame with one observation per reference on the following variables:
  \describe{
    \item{\code{reference_id}}{A unique identifier for each reference to a source.}
    \item{\code{case_num}}{Deciding high court’s case number, e.g. “T4816-12”. See also \link{cases}.}
    \item{\code{opinion_id}}{A unique identifier for each opinion. See also \link{opinions}.}
    \item{\code{paragraph_id}}{The number of the paragraph of the judgment text in which the reference appears.}
    \item{\code{reference}}{Name of the source referenced.}
    \item{\code{reference_class}}{The overarching category to which the legal source or argument belongs.}
    \item{\code{reference_subclass}}{A specific category of legal or other source to which the reference belongs.}
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

}

\seealso{

}

\keyword{datasets}
