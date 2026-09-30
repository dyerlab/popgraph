# Deprecation notices for the popgraph package.

.popgraph_env <- new.env(parent = emptyenv())

.deprecation_msg <- paste0(
  "The 'popgraph' package is deprecated and no longer maintained.\n",
  "See https://github.com/dyerlab/popgraph for details."
)

.onAttach <- function(libname, pkgname) {
  packageStartupMessage(.deprecation_msg)
}

# Warn once per session when a main entry point is called.
.warn_deprecated <- function() {
  if (!isTRUE(.popgraph_env$warned)) {
    .popgraph_env$warned <- TRUE
    .Deprecated(msg = .deprecation_msg)
  }
  invisible(NULL)
}
