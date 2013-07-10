#' Plotting of a population graph edge set using ggplot neumonic
#' 
#' This function allows you to layer the edgeset of a \code{population_graph}
#'  object
#' @param mapping The aesthetic mapping as an \code{aes()} object.  This aesthetic
#'  must at least have values for x and y
#' @param graph The popgraph/igraph object to be plot
#' @param ... Largely ignored.
#' @return A formatted geom_segment object for addition to a ggplot()
#' @author Rodney J. Dyer <rjdyer@@vcu.edu>
#' @export
#' @examples
#' a <- matrix( c(0,1,0,1,1,0,0,1,0,0,0,1,1,1,1,0),nrow=4)
#' rownames(a) <- colnames(a) <- LETTERS[1:4]
#' graph <- as.population_graph(a)
#' V(graph)$x <- runif(4)
#' V(graph)$y <- runif(4)
#' require(ggplot2)
#' ggplot() + geom_popgraph_edgeset( aes(x=x,y=y), graph )
#' ggplot() + geom_popgraph_edgeset( aes(x=x,y=y), graph, color="darkblue" )
geom_popgraph_edgeset<- function( mapping=NULL, graph=NULL, ... ) {
  
  # catch errors with missing 
  if( is.null(mapping))
    stop("You need at least aes(x,y) for aesthetic mapping in this function.")
  if( is.null(graph))
    stop("You cannot plot a graph without a graph...")
  
  # grab mapping labels not in the vertex attributes
  edge.attr <- c(list.edge.attributes(graph),list.vertex.attributes(graph))
  mappingNames <- names(mapping)
  for( name in mappingNames) {
    key <- as.character(mapping[[name]])
    if( !(key %in% edge.attr))
      stop(paste("Aesthetic mapping variable ",key," was not found in the edge attributes of this graph",sep=""))
  }
  if( is.null(mapping$x) | is.null(mapping$y))
    stop("To plot a graph, you need coordinates and they must be attributes of the vertices in the graph.")
  
  X1 <- X2 <- Y1 <- Y2 <- size <- x <- y <- color <- colour <- NULL
  
  x <- get.vertex.attribute(graph,mapping$x)
  y <- get.vertex.attribute(graph,mapping$y)
  if( is.null(get.vertex.attribute(graph,"name")))
    V(graph)$name <- paste("node",1:length(V(graph)), sep="-")
  
  # find the coordinates to all the segments and make into a data.frame
  layout <- matrix(cbind( x, y ), ncol=2)
  colnames(layout) <- c("X1","X2")
  rownames(layout) <- V(graph)$name
  coords <- data.frame(name=V(graph)$name, X1=layout[,1], X2=layout[,2])  
  edgelist <- get.edgelist(graph)
  df <- data.frame( coords[edgelist[,1],2:3], coords[edgelist[,2],2:3] )
  colnames(df) <- c("X1","Y1","X2","Y2")
  
  if( !is.null(mapping$size) ) {
    df$size <- get.edge.attribute(graph,mapping$size)
    ret <- geom_segment( aes(x=X1,y=Y1,xend=X2,yend=Y2,size=size), data=df, show_guide=FALSE, ... )
  }
  else 
    ret <- geom_segment( aes(x=X1,y=Y1,xend=X2,yend=Y2), data=df, show_guide=FALSE, ... )
    
  return( ret )
  
}



