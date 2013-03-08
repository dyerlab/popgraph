context("distance_congruence.R")

test_that("testing", {
  graph_file1 <- "~/Documents/Dropbox/R/popgraph/pkg/data/Lopho.pgraph"
  lopho <- read.popgraph( graph_file1 )
  graph_file2 <- "~/Documents/Dropbox/R/popgraph/pkg/data/Upiga.pgraph"
  upiga <- read.popgraph( graph_file2 )
  
  d.dist <- test.congruence(lopho,upiga,method="distance" ) 
  expect_that( d.dist, is_a("htest"))
  expect_that( d.dist$parameter, is_equivalent_to(118) )
  expect_that( as.numeric( d.dist$estimate), equals( 0.5124149 ))
  
  expect_that( d.comb <- test.congruence(lopho,upiga,method="combinatorial" ), gives_warning())
  expect_that( d.comb, is_a("numeric"))
  expect_that( d.comb, equals( 0.02529026309903295 ))
    
  
}
)
