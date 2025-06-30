# Install if needed:
# install.packages(c("ggraph", "tidygraph"))


tidygraph_assymetric_graph <- function( graph ) { 

  library(igraph)
  library(tidygraph)
  library(ggraph)
  
  # Assume g_dir is a directed igraph from asymmetric_tsne_weights()
  # Create a layout (you can use any from igraph)
  
  lay <- layout_with_fr(graph)
  
  # Convert to tidygraph
  tg <- as_tbl_graph(graph)
  
  # Add layout positions to nodes
  V(graph)$x <- lay[,1]
  V(graph)$y <- lay[,2]
  
  # Plot with ggraph
  ggraph(tg, layout = "manual", x = V(graph)$x, y = V(graph)$y) +
    geom_edge_fan(aes(width = weight), arrow = arrow(length = unit(3, 'mm')),
                  end_cap = circle(4, 'mm'), start_cap = circle(4, 'mm'),
                  color = "steelblue") +
    geom_node_point(size = 5, color = "darkred") +
    geom_node_text(aes(label = name), vjust = -1.5, size = 4) +
    scale_edge_width(range = c(0.5, 3)) +
    theme_graph() +
    labs(title = "Asymmetric Population Graph (ggraph)",
         edge_width = "Directional Weight")  
  
  
}

