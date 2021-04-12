#' 
#' 
#' This function convers the popgraph object into an object that can be plot using
#'  the leaflet library.
#' 
#' @param x A population graph
#' @returns A \code{data.frame} object suitable for passing to \code{leaflet}.
#' @export
#' @author Rodney J. Dyer <rjdyer@@vcu.edu>

for_leaflet <- function( x ) { 
  
  nodes <- igraph::get.data.frame( x,what = "vertices")
  
  
  }