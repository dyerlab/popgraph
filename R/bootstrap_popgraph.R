#' Bootstraps indiviudals to see stability of graph topology.
#'
#' This function uses a permutation test to look at edge stability.  What we 
#'  do is resample individuals and re-estimate the topology several times. This
#'  provides an estimate of edge stability.
#' @param data The raw multivariate data as submitted to \code{popgraph}
#' @param groups The grouping of the data into nodes as submitted to \code{popgraph}
#' @param nboot The nubmer of times to bootstrap the individuals per group (default=50)
#' @param ... Other arguments to be passed to \code{popgraph}
#' @return A weighted graph where edge weights represent the proportion of times the 
#'  edge was found in the perumuted data sets.
#' @export
#' 
bootstrap_popgraph <- function( data, groups, nboot=50){
  if( !is(data,"matrix"))
    stop("Cannot use non-matrix data to make a graph, let alone bootstrap it...")
  if( nrow(data) != length(groups))
    stop("You need to have data of the same size to use this function.")
  
  A <- NULL
  df <- data.frame(data)
  df$Stratum <- as.numeric(as.factor(groups))
  nc <- ncol(df)-1
  for( rep in 1:nboot){
    ndata <- df[strata( df, stratanames = "Pop",size=c(10,10),method="srswr")$ID_unit,1:nc]  
    graph <- popgraph(ndata,groups,...)
    B <- to_matrix(graph,mode = "adjacency")
    B[ B!=0 ] <- 1
    A <- A+B
  }
  
  A <- A/nboot
  graph <- graph.adjacency(A,mode = "undirected")
  return(graph)
}