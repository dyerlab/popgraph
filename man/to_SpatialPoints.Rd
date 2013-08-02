\name{to_SpatialPoints}
\alias{to_SpatialPoints}
\title{Extract nodes as SpatialPoints}
\usage{
  to_SpatialPoints(graph, longitude = "Longitude",
    latitude = "Latitude")
}
\arguments{
  \item{graph}{An object of type \code{population_graph}}

  \item{longitude}{The key for the attribute representing
  Longitude (default="Longitude")}

  \item{latitude}{The key for the attribute representing
  Latitude (default="Latitude")}
}
\value{
  An object of type SpatialPoints
}
\description{
  Returns spatial points object representing location of
  the nodes in the graph.
}
\author{
  Rodney J. Dyer <rjdyer@vcu.edu>
}

