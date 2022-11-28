#' gene_list Function
#'
#' Export vector of gene identifiers to gene-list.com
#'
#' @importFrom utils browseURL
#'
#' @param genes vector
#'
#' @param genome vector
#'
#' @param search_term vector
#'
#' @return null
#'
#' @export
#'

gene_list <- function(genes, genome="human", search_term="") {
  genome_url<-''
  search_term_url<-''
  genes<-paste(genes,collapse=",")
  url<-paste(c('https://www.gene-list.com/search/',genes),collapse="")
  if(genome!="human"){genome_url<-paste(c('genome=', genome),collapse="")}
  if(search_term!=""){search_term_url<-paste(c('search_term=', search_term),collapse="")}
  if(genome=="human" & search_term!=""){url<-paste(url,collapse="")}
  if(genome!="human" & search_term==""){url<-paste(c(url,'?', genome_url), collapse="")}
  if(genome=="human" & search_term!=""){url<-paste(c(url,'?', search_term_url), collapse="")}
  if(genome!="human" & search_term!=""){url<-paste(c(url,'?',genome_url, '&', search_term_url), collapse="")}
  url<-paste(url,collapse="")
  browseURL(url)
}
