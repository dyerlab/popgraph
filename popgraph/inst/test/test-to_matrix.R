context("as_matrix.R")

test_that("testing", {
  file <- "~/Documents/Dropbox/R/popgraph/pkg/data/Lopho.pgraph"
  graph <- read.popgraph( file )
  
  K <- length(V(graph))
  
  m1 <- as.matrix.popgraph( graph, mode="adjacency")
  m2 <- as.matrix.popgraph( graph, mode="shortest path")
  m3 <- as.matrix.popgraph( graph, mode="edge weight")
  
  # type
  expect_that(m1, is_a("matrix"))
  expect_that(m2, is_a("matrix"))
  expect_that(m3, is_a("matrix"))
  
  # size
  expect_that(dim(m1), is_equivalent_to(c(K,K)))
  expect_that(dim(m2), is_equivalent_to(c(K,K)))
  expect_that(dim(m3), is_equivalent_to(c(K,K)))
  
  #diagonal
  expect_that(diag(m1), is_equivalent_to(rep(0,K)))
  expect_that(diag(m2), is_equivalent_to(rep(0,K)))
  expect_that(diag(m3), is_equivalent_to(rep(0,K)))
  
}
)