#' Returns congruence topology
#' 
#' Takes two graphs and returns topology that is 
#'  the intersection of the edge sets.
#' @param graph1 An object of type \code{population_graph}
#' @param graph2 An object of type \code{population_graph}
#' @param warn.nonoverlap A flag indicating that a warning should be thrown
#'  if the node sets are not equal (default = TRUE )
#' @return An object of type \code{population_graph} where the node and edge 
#'  sets are the intersection of the two.
#' @author Rodney J. Dyer <rjdyer@@vcu.edu>
#' @export
congruence_topology <- function( graph1, graph2, warn.nonoverlap=TRUE ) {
  
  if( !inherits(graph1, "population_graph") | !inherits(graph2, "igraph") )
    stop("congruence.topology() requires that you pass an igraph object.")
  
  if( warn.nonoverlap & length(setdiff( V(graph1)$name, V(graph2)$name )))
    warning("These two topologies have non-overlapping node sets!  Careful on interpretation.")
  cong.nodes <- intersect( V(graph1)$name, V(graph2)$name )
 
  a <- as.matrix( get.adjacency( induced.subgraph( graph1, cong.nodes ) ) )
  nms <- row.names(a)
  b <- as.matrix( get.adjacency( induced.subgraph( graph2, cong.nodes ) ) )
  b <- b[nms,nms]
  cong <- graph.adjacency( a*b, mode="undirected" )
  class(cong) <- c("igraph","population_graph")
  return( cong )
}