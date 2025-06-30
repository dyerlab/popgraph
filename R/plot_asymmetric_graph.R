
plot_asymmeticgraph <- function( graph ) { 

  # Example: assume g_dir is your output from asymmetric_tsne_weights()
  # set.seed(42)
  layout <- layout_with_fr(graph)  # layout for consistency
  
  # Extract edge attributes
  edge_weights <- E(graph)$weight
  edge_widths <- 1 + 5 * edge_weights  # scale visually
  
  # Identify reversed edges
  is_reversed <- function(graph, e) {
    ends <- ends(graph, e)
    rev_id <- get.edge.ids(graph, c(ends[2], ends[1]), directed = TRUE)
    rev_id != 0 && rev_id != e
  }
  
  curvatures <- sapply(seq_along(E(graph)), function(e) {
    if (is_reversed(graph, e)) {
      return(0.3)  # curve this edge if the reverse exists
    } else {
      return(0)  # straight edge
    }
  })
  
  # Plot the graph
  plot(graph,
       layout = layout,
       edge.width = edge_widths,
       edge.arrow.size = 0.5,
       edge.curved = curvatures,
       vertex.label.cex = 1.2,
       vertex.size = 20,
       main = "Asymmetric Population Graph (Directional Edge Weights)")
    
}


