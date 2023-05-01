\name{add_background_type_to_appointments}
\alias{add_background_type_to_appointments}
\title{Add background type to appointments}

\usage{
add_background_type_to_appointments(appointments)
}

\description{
A function for generating a number of helpful variables to \link{appointments} that describe Justices pre-appointment professional backgrounds.

First, the function adds six variables with a value between 0 and 1 that describe how far the appointee progressed along six legal career tracks: academia (\code{experience_academia}), ministries (\code{experience_ministry}), courts (\code{experience_courts}), private practice (\code{experience_private}), politics (\code{experience_politics}), and other public service (\code{experience_public_service}). The value represents whether the appointee had no experience (0); held a training or pre-career postiion (0.25); held an entry-level permanent position (0.5); or held an apex-career position (1).

Second, the function adds variables describing the position that the appointee last held before being appointed (\code{recruited_from_position}) and the legal career track to which that position belongs (\code{recruited_from_track}).

Third, the function adds a variable provided the type of judge that each appointee is (\code{judges_type}). For more information, see the references below.
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
Johan Lindholm, Mattias Derlén, and Daniel Naurin (2022) 'The Ideal Justice: Who Are Selected to Serve and What Does It Say about Swedish High Courts?' Tidsskrift for Rettsvitenskap 135(4):397-431. \url{https://doi.org/10.18261/tfr.135.4.1}
}

\seealso{
  \code{\link{appointments}},
  \code{\link{add_government_to_appointments}}
}
