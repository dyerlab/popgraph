context("decorate.popgraph.R")

test_that("testing", {
  graph_file <- "~/Documents/Dropbox/R/popgraph/pkg/data/Lopho.pgraph"
  graph <- read.popgraph( graph_file )
  data_file <- "~/Documents/Dropbox/R/popgraph/pkg/data/Baja.meta.csv"
  df <- read.csv(data_file,header=TRUE)
  
  graph <- decorate.popgraph( graph, df )
      
  expect_that( graph, is_a("igraph") )
  expect_that( V(graph)$Longitude, is_a("numeric"))  
  expect_that( V(graph)$Latitude, is_a("numeric"))
  expect_that( V(graph)$Bob, is_a("NULL") )
  
  expect_that( V(graph)$Longitude[1], equals(-111.79) )
  expect_that( V(graph)$Latitude[1], equals(26.59) )
  
}
)
