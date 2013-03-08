#' Converts population graph to html file for interactive viewing
#' 
#' This function takes a population graph that has been 'decorated' with
#'  sufficient spatial data to make a html file that uses the D3 visualization
#'  javascript mateirals to view it interactively.
#' @param graph A \code{popgraph} object.
#' @return The text of the html file to be saved or viewed in the appropriate browser.
#' @author Rodney J. Dyer <rjdyer@@vcu.edu>
#' @export
to_html <- function( graph, file ) {
  if( !inherits( graph, "population_graph") )
    stop("Cannot save a kml file from a popgraph that is not made from a popgraph...")
  if( missing( file ))
    stop("Cannot save a html output of a popgraph with no file...")
  
<<<<<<< HEAD
  heading <- system.file("extdata","d3header.html",package="popgraph")
  footing <- system.file("extdata","d3footer.html",package="popgraph")
  
  if( !nchar(heading) | !nchar(footing) )
    stop("Cannot run this until the package is actually installed. ")
=======
  heading <- system.file("inst","extdata","d3header.html",package="popgraph")
  footer <- system.file("inst","extdata","d3footer.html",package="popgraph")
  
  if( !nchar(heading) | !nchar(footer) )
    stop("Cannot run this until the package is actually installed. ")
  
  json <- to_json( graph )
  
  
>>>>>>> 93aef9e9427c3469fa7514bd53781b1128da40fb
  
  
  head <- paste( readLines(heading),collapse="\n" )
  foot <- paste( readLines(footing), collapse="\n" )
  json <- to_json( graph )
  
  htmltext <- paste(head,json,foot,collapse="\n")
  
  write(htmltext,file)
  invisible(NULL)
}