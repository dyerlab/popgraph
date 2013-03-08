#' Converts to json representation
#' 
#' This is a nice function that takes a graph structure
#'  and converts it to a json format for use on the web.
#' @param graph An object of type \code{igraph}
#' @return A textual json representation of the graph
#' @author Rodney J. Dyer <rjdyer@@vcu.edu>
#' @export
to_json <- function( graph ) {
  if( !inherits(graph,"population_graph"))
    stop("This function requires a population_graph object to function")
  
  require(RJSONIO)
  
  
  # do the nodes
  l <- list()
  node.attr.names <- list.vertex.attributes( graph )
  if( !("name" %in% node.attr.names) )
    stop("Vertices are indexed by the property 'name' and your graph does not have one...")
  for( attr in node.attr.names )
    l[[attr]] <- get.vertex.attribute( graph, attr )
  d <- data.frame( l )
  if( !("group" %in% names(d)))
    d$group <- "all"
  
  nodes <- split( d, rownames(d))
  names(nodes) <- NULL
  
  edges <- list()
  
  if( "weight" %in% list.edge.attributes(graph))
    graph <- set.edge.attribute(graph,"weight", value=5)
  wts <- get.adjacency(graph, attr="weight")
  idx <- 1
  for( i in 1:length(V(graph))){
    edge.indices <- graph[[i]][[1]]
    
    for(edge in edge.indices ){
      row <-  list("source"=(i-1), "target"=(edge-1), "weight"=wts[i,edge])
      edges[[i]] <- row
      idx <- idx+1
    }
  }
  
  g <- list( "nodes"=nodes,"edges"=edges )
  return( toJSON( g ))
}