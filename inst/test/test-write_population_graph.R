context("write_population_graph.R")

test_that("testing", {

  expect_that( write.population_graph(FALSE), throws_error() )

  a <- matrix( 0,nrow=4,ncol=4)
  a[1,2] <- a[1,3] <- a[2,3] <- a[1,4] <-1
  a <- a + t(a)
  graph <- as.population_graph(a)
  
  expect_that( write.population_graph(graph), throws_error() )
  
  expect_that( write.population_graph(graph, file="~/Desktop", method="bob"), throws_error())
   
}
)
