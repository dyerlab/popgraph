context("congruence_topology.R")

test_that("testing", {
  graph_file1 <- "~/Documents/Dropbox/R/popgraph/pkg/data/Lopho.pgraph"
  lopho <- read.popgraph( graph_file1 )
  graph_file2 <- "~/Documents/Dropbox/R/popgraph/pkg/data/Upiga.pgraph"
  upiga <- read.popgraph( graph_file2 )
  
  cong <- congruence.topology(lopho, upiga, FALSE)
  
  expect_that( cong, is_a("igraph") ) 
  expect_that( cong, is_a("population_graph") )
  expect_that( length( V(cong)), equals(16) )
  expect_that( length(E(cong)), equals(19) )
  
}
)
