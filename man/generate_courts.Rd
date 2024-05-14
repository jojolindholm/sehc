\name{generate_courts}
\alias{generate_courts}
\title{Generate courts}
\usage{
generate_courts()
}
\description{
This function takes information on appointments from the dataset \link{appointments} to generate a new dataset, here refered to as \code{courts}. This new dataset contains one observation per unique composition for each high court with identifying variables on all serving Justices at a particular point in time, as well as on the president and chamber chair (where applicable). This dataset is for example useful for conducting analysis on the composition of the high courts over time . To do so, it is helpful to subsequently add variables from the dataset \link{appointments}.
}
\examples{
courts <- generate_courts()
}
\author{
Johan Lindholm, Umeå University, \email{johan.lindholm@umu.se}
}
\seealso{

}
