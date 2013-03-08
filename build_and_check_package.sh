#!/usr/bin/env bash

# This is a series of commands that I've found work together
#	to create a fully documented and ready R package.
# R.J. Dyer <rjdyer@vcu.edu>
#

# remove all the old documentation
rm -rf ./popgraph/man/*.Rd


# build the documentation using ROxygen
echo "require(roxygen2);roxygenize('./popgraph');q(save='no')" | R --vanilla --silent

# Correce the documentation for operator overloads
perl -pi -e 's/\"}/}/g' ./popgraph/man/*.Rd
perl -pi -e 's/{\"/{/g' ./popgraph/man/*.Rd


# build the package with compacted vignettes
R CMD build ./popgraph --compact-vignettes --resave-data


# cleanup any stuff in the vignette document folder
rm -rf ./popgraph/inst/doc/*.log
rm -rf ./popgraph/inst/doc/*.tex
rm -rf ./popgraph/inst/doc/*.pdf
rm -rf ./popgraph/inst/doc/*.gz
rm -rf ./popgraph/inst/doc/*.toc


# check the package against CRAN
R CMD check popgraph_1.0.tar.gz --as-cran


