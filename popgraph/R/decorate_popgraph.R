#' Merge data into popgraph node-wise
#' 
#' This function takes a data frame and a popgraph object and attempts to add
#'  the node data (from the data frame) to the graph as vertex attributes.
#' @param graph An object of type \code{igraph} to populate
#' @param df An object of type \code{data.frame} that has a Node column 
#'  that is the same as the V(graph)$name values.
#' @param stratum.key The name of the column indicating the values found
#'  in V(graph)$name (default="Population")
#' @return A populated igraph object with as much of the metadata in 
#'  the data.frame as possible stitched into the \code{igraph} object
#' @author Rodney J. Dyer <rjdyer@@vcu.edu>
#' @export
decorate_popgraph <- function( graph, df, stratum.key="Population" ) {
  
  if( !(stratum.key %in% list.vertex.attributes(graph)))
    stop("You must indicate which vertex attribute represents node names.")

  node.labels <- V(graph)$name 
  num.nodes <- length( node.labels )
  
  data <- df[ (df[[stratum.key]] %in% node.labels) , ]

  #add null data
  cats <- setdiff( names(df), stratum.key )
  
  # go through the categories and fill them in with null 
  for( cat in cats ){
    vec <- rep( NA, num.nodes )
    for( i in 1:num.nodes ){
      node.name <- node.labels[i]
      
      # only use those 
      if( node.name %in% data[[stratum.key]] ) {
        val <- data[ data[[stratum.key]]==node.labels[i],cat ]
        vec[i] <- val        
      }
    }
    graph <- set.vertex.attribute(graph, cat, value=vec )    
  }  
  
  return( graph )
}