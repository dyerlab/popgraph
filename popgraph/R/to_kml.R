#' Converts population graph to KML file
#' 
#' This function takes a population graph that has been 'decorated' with
#'  sufficient spatial data to make a KML file from it for viewing in 
#'  GoogleEarth.
#' @param graph A \code{popgraph} object.
#' @return The text of the KML file to be saved or viewed in the appropriate editor.
#' @author Rodney J. Dyer <rjdyer@@vcu.edu>
#' @export
to_kml <- function( graph ) {
  if( !inherits( graph, "population_graph") )
    stop("Cannot save a kml file from a popgraph that is not made from a popgraph...")
  
  return("the graph contents")
}