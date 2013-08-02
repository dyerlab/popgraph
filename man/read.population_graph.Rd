\name{read.population_graph}
\alias{read.population_graph}
\title{Reads in a population graph text file}
\usage{
  read.population_graph(file, sep = "\t")
}
\arguments{
  \item{file}{The path to the file that is to be saved.}

  \item{sep}{The column separator in the file. By default
  it is a tab but sometimes a space or other object may be
  used.}
}
\value{
  A fully created popgraph file (e.g., an igraph object
  with an extra class property)
}
\description{
  This function imports a popgraph from the older text
  format
}
\author{
  Rodney J. Dyer <rjdyer@vcu.edu>
}

