\name{add_panel_split_to_cases}
\alias{add_panel_split_to_cases}
\title{Add Panel Split to Cases}

\usage{
add_panel_split_to_cases(cases)
}

\description{
A function that adds three variables on the panel division to the dataset \link{cases}. This includes integer variables on the size of the majority, \code{majority_size}, and the minority, \code{minority_size}, as number of Justices, as well as a dummy variable, \code{unanimous_decision}, on whether the panel was unanimous (1) or not (0). These variables can be used to easily identify cases where Justices tend to disagree on the outcomes.
}

\examples{
cases <- cases |>
  add_panel_split_to_cases()
}

\author{
Johan Lindholm, Umeå University, \email{johan.lindholm@umu.se}
}

\seealso{
  \code{\link{cases}}
}
