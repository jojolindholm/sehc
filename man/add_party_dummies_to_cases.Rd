\name{add_party_dummies_to_cases}
\alias{add_party_dummies_to_cases}
\title{Add party dummies to cases}

\usage{
add_party_dummies_to_cases(cases)
}

\description{
A function for generation easily understandable dummy variables to the dataset \link{cases} on the classes of parties involved as applicants and respondents respectively. For more information on party classes, download the code book (\url{https://github.com/jojolindholm/sehc/raw/main/sehc_code_book.pdf}).
}

\examples{
cases <- cases |>
  add_area_dummies_to_cases() |>
  add_party_dummies_to_cases() |>
  add_interests_involved_to_cases()
}

\author{
Johan Lindholm, Umeå University, \email{johan.lindholm@umu.se}
}

\seealso{
  \code{\link{cases}},
  \code{\link{add_area_dummies_to_cases}},
  \code{\link{add_interests_involved_to_cases}}
}
