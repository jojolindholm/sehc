\name{generate_votes}
\alias{generate_votes}
\title{Generate one vote per Justice}
\usage{
generate_votes()
}
\description{
A function for splitting Opinions, which often are co-authored by multiple Justices, into a new dataset, Votes, with one observation per voting Justice.
}
\examples{
votes = generate_votes()
}
\author{
Johan Lindholm
}
