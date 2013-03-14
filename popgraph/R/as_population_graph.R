#' Converts an object of type matrix or igraph into \code{population_graph}
#' 
#' This is a simple conversion routine for \code{matrix} or \code{igraph} 
#'  objects into \code{population_graph} objects
#' @param graph An object of type \code{matrix} or \code{igraph}
#' @return An object of type \code{population_graph}
#' @export
#' @author Rodney J. Dyer <rjdyer@@vcu.edu>
as.population_graph <- function(graph) {
  ret <- NULL
  if( is(graph,"matrix")) {
    ret <- graph.adjacency( graph, mode="undirected",weighted=TRUE) 
    if( is.null(colnames( graph )) )
      V(ret)$name <- as.character(paste("node",seq(1,ncol(graph)), sep="-"))
    else
      V(ret)$name <- colnames( graph )
  }
  
  if( is(graph,"igraph"))
    ret <- graph
  
  if( is.null(ret) )
    stop("Must pass either an igraph or matrix item to this function.")
  
  class(ret) <- c("population_graph","igraph")
  return(ret)
    
}