\name{geom_popgraph_nodeset}
\alias{geom_popgraph_nodeset}
\title{Plotting of a population graph edge set using ggplot neumonic}
\usage{
  geom_popgraph_nodeset(mapping = NULL, graph = NULL, ...)
}
\arguments{
  \item{mapping}{The aesthetic mapping as an \code{aes()}
  object.  This aesthetic must at least have values for x
  and y but you can also specify color, fill, alpha, label,
  and size.  Color, alpha, and fill may be a single value
  for all nodes or vertex attributes for each node.}

  \item{graph}{The popgraph/igraph object to be plot}

  \item{...}{Largely ignored.}
}
\value{
  A formatted geom_segment object for addition to a
  ggplot()
}
\description{
  This function allows you to layer the edgeset of a
  \code{population_graph} object
}
\examples{
a <- matrix( c(0,1,0,1,1,0,0,1,0,0,0,1,1,1,1,0),nrow=4)
rownames(a) <- colnames(a) <- LETTERS[1:4]
graph <- as.population_graph(a)
V(graph)$x <- runif(4)
V(graph)$y <- runif(4)
require(ggplot2)
ggplot() + geom_popgraph_nodeset( aes(x=x,y=y), graph )
V(graph)$group <- c("A","A","B","B")
ggplot() + geom_popgraph_nodeset( aes(x=x,y=y,color=group), graph, size=4 )
}
\author{
  Rodney J. Dyer <rjdyer@vcu.edu>
}

