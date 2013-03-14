#' Reads in a population graph text file 
#' 
#' This function imports a popgraph from the older text format
#' @param file The path to the file that is to be saved.
#' @return A fully created popgraph file (e.g., an igraph object
#'  with an extra class property)
#' @author Rodney J. Dyer <rjdyer@@vcu.edu>
#' @export
read.population_graph <- function( file ) { 
    
  # load in the raw stuff
  raw <- read.table( file, row.names=NULL, header=FALSE, sep=",", stringsAsFactors=FALSE)
  
  params <- as.numeric(strsplit(raw[1,1],split="[[:space:]]")[[1]]) 
  
  # set up the adjacency matrix
  K <- params[1]
  A <- matrix( 0, ncol=K, nrow=K)
  names <- rep("",K)
  sizes <- rep(0,K)
  colors <- rep("#000000",K)
  
  # set up some colors
  color_types <- c( "#9E0142",
                    "#D53E4F",
                    "#F46D43",
                    "#FDAE61",
                    "#FEE08B",
                    "#FFFFBF",
                    "#E6F598",
                    "#ABDDA4",
                    "#66C2A5",
                    "#3288BD",
                    "#5E4FA2")
  
  # iterate through the nodes
  for( i in 1:params[1]) {
    row <- strsplit( raw[i+1,1], split=" ")[[1]]
    if( length( row ) == 3 ){
      names[i] <- row[1]
      sizes[i] <- as.numeric(row[2])
      colors[i] <- color_types[ 1+as.numeric( row[3] ) ]
    }
  }
  
  # go through the edges 
  for( i in 1:params[2]){
    row <- strsplit( raw[i+params[1]+1,1], split="[[:space:]]")[[1]]
    if( length(row) == 3 ) {
      fidx <- which( names == row[1] )
      tidx <- which( names == row[2] )
      wt <- as.numeric( row[3])
      if( length( fidx ) & length( tidx) ) 
        A[fidx,tidx] <- A[tidx,fidx] <- wt
    }
  }
  
  rownames(A) <- colnames(A) <- names
  graph <- graph.adjacency( A, mode="undirected", weighted=TRUE)
  V(graph)$size <- sizes * 50
  V(graph)$color <- colors
  
  class(graph) <- c("igraph","population_graph")
  return( graph )
  
}