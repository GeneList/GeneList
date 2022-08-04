#' gene_list Function
#'
#' Link vector of gene identifiers to gene-list.com
#'
#' @importFrom utils browseURL
#'
#' @param x vector
#'
#' @return null
#'
#' @export
#'

gene_list <- function(x) {
  url<-paste(c('https://www.gene-list.com/search/',x),collapse=",")
  browseURL(url)
}
