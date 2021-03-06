% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/thesis.R
\name{dissertation_gitbook}
\alias{dissertation_gitbook}
\title{Creates an R Markdown gitbook dissertation document}
\usage{
dissertation_gitbook(...)
}
\arguments{
\item{...}{other arguments to bookdown::gitbook}
}
\value{
A gitbook webpage
}
\description{
This is a function called in output in the YAML of the driver Rmd file
to specify the creation of a webpage version of the dissertation.
}
\examples{
\dontrun{
 output: eagledown::dissertation_gitbook
}
}
