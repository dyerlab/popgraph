#' Extract nodes as SpatialPoints
#' 
#' Returns spatial points object representing location of the 
#'  nodes in the graph.
#' @param graph An object of type \code{population_graph}
#' @param longitude The key for the attribute representing Longitude (default="Longitude")
#' @param latitude The key for the attribute representing Latitude (default="Latitude")
#' @return An object of type SpatialPoints
#' @author Rodney J. Dyer <rjdyer@@vcu.edu>
#' @export
to_SpatialPoints <- function( graph, longitude="Longitude", latitude="Latitude") {
  if( !inherits(graph,"population_graph"))
    stop("This function requires a population_graph object to function")
  
  require( sp )
  
  vertex.attr <- list.vertex.attributes( graph )
  if( !(latitude %in% vertex.attr ) | !(longitude %in% vertex.attr) )
    stop("Your graph should have Latitude and Longitude in it before we can make it a Spatial* object.")
  
  coords <- cbind( x=get.vertex.attribute( graph, longitude ),
                   y=get.vertex.attribute( graph, latitude) )
  rownames( coords ) <- V(graph)$name 
  pts <- SpatialPoints(coords)
  
  return( pts )
}