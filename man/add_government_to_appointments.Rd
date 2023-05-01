\name{add_government_to_appointments}
\alias{add_government_to_appointments}
\title{Add government to appointments}

\usage{
add_government_to_appointments(appointments)
}

\description{
A function for adding information on the appointing governments to \link{appointments}. The function downloads up-to-date data from the ParlGov project and for each appointee adds the variables on the party of the Prime Minister of the appointing goverment (\code{appointing_government_pm_party}), the position of the PM's party on a left-right ideological scale (\code{pm_left_right}), and
the share of seats in parliament held by the parties in the appointing government (\code{appointing_cabinet_parliament_share}).
}

\examples{
appointments <- appointments |>
  add_government_to_appointments() |>
  add_background_type_to_appointments()
}

\author{
Johan Lindholm, Umeå University, \email{johan.lindholm@umu.se}
}

\references{
%%
}

\seealso{
  \code{\link{appointments}},
  \code{\link{add_background_type_to_appointments}}
}
