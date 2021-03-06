% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/decorate_graph.R
\name{decorate_graph}
\alias{decorate_graph}
\title{Merge data into popgraph node-wise}
\usage{
decorate_graph(graph, data, stratum = "Population")
}
\arguments{
\item{graph}{An object of type \code{igraph} to populate}

\item{data}{An object of type \code{data.frame} that has a Node column 
that is the same as the \code{V(graph)$name} values.}

\item{stratum}{The column name of node lables to match up with graph.stratum
(default 'Population') to be matched with V(graph)$name attribute}
}
\value{
A populated igraph object with as much of the metadata in 
 the data.frame as possible stitched into the \code{igraph} object
}
\description{
This function takes a data frame and a popgraph object and attempts to add
 the node data (from the data frame) to the graph as vertex attributes.
}
\author{
Rodney J. Dyer <rjdyer@vcu.edu>
}
