\name{write.population_graph}
\alias{write.population_graph}
\title{Convience function for file exports}
\usage{
  write.population_graph(graph, file, format = "pgraph",
    ...)
}
\arguments{
  \item{graph}{An object of type \code{population_graph}.}

  \item{file}{The path to save the graph into.}

  \item{format}{The type of output file to use.  Options
  are: \itemize{ \item{json } { Save as JSON format}
  \item{kml } { Save to KML format to view in GoogleEarth}
  \item{graphml } { Save as Graph Markup Language}
  \item{html } { Save to an interactive html format
  viewable in your browser} \item{pajek } { Save as input
  to Pajek} \item{pgraph } { Save as input for
  GeneticStudio (default)} \item{adjacency } { Saves as an
  adjacency matrix in csv format} \item{paths } { Saves as
  shortest paths matrix in csv format} \item{weights } {
  Saves as weighted adjacency matrix in csv format} }}

  \item{...}{Ignored}
}
\value{
  Nothing
}
\description{
  This function is a chokepoint for exporting
  \code{population_graph} objects to other formats.
}
\author{
  Rodney J. Dyer <rjdyer@vcu.edu>
}

