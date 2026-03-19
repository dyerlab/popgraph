## Resubmission

This package was previously archived by CRAN (2017). This submission addresses
all outstanding issues:

- Removed duplicate function definition (`popgraph()` appeared in two files)
- Renamed asymmetric variant to `asymmetric_popgraph()` to avoid collision
- Fixed `to_data.frame()` bug (iterated over `length(graph)` instead of `length(cols)`)
- Replaced deprecated `aes_string()` with `aes()` + `.data` pronoun
- Replaced deprecated `size` aesthetic with `linewidth` in `geom_edgeset()`
- Fixed `\itemize` Rd formatting to `\describe` for named items
- Fixed DESCRIPTION: added `Authors@R`, proper Title case, URL/BugReports fields
- Removed development scratch files that used undeclared `library()` calls
- Fixed `.Rbuildignore` merge conflict markers
- Corrected `igraph::graph_from_adjacency()` to `igraph::graph_from_adjacency_matrix()`

## Test environments

- macOS (local), R 4.x

## R CMD check results

0 errors | 0 warnings | 1 note

- NOTE: New submission / Previously archived on CRAN
