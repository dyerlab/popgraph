\name{theme_empty}
\alias{theme_empty}
\title{A blank theme for plotting networks}
\usage{
theme_empty(base_size = 12, base_family = "Helvetica")
}
\arguments{
  \item{base_size}{The base size of the font}

  \item{base_family}{The font family to use}
}
\value{
A ggplot theme blank and transpatent for plotting in
another program.
}
\description{
This function defines a blank theme for plotting graph
objects in ggplot.
}
\examples{
data(lopho)
require(ggplot2)
require(igraph)
layout <- layout.fruchterman.reingold( lopho )
V(lopho)$x <- layout[,1]
V(lopho)$y <- layout[,2]
p <- ggplot() + geom_edgeset( aes(x,y), lopho)
p <- p + geom_nodeset( aes(x,y), lopho )
p
p + theme_empty()
p <- ggplot() + geom_edgeset( aes(x,y,color=weight), lopho)
p
}
\author{
Rodney J. Dyer <rjdyer@vcu.edu>
}

