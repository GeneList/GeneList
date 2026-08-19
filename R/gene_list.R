#' Open a list of genes on gene-list.com
#'
#' Opens the browser on gene-list.com with the given identifiers loaded, which
#' links each one to around forty research resources. Identifiers may be gene
#' symbols, Ensembl or UniProt accessions, Entrez ids, a GO term, or a
#' chromosome range.
#'
#' @importFrom utils browseURL URLencode
#'
#' @param genes Character vector of gene identifiers.
#'
#' @param genome Genome to look the identifiers up in, given as either the
#'   common or the scientific name -- \code{"rat"} and \code{"Rattus
#'   norvegicus"} are the same genome. Case and spacing are ignored. See
#'   \code{\link{gene_list_genomes}}; defaults to \code{"human"}.
#'
#' @param search_term Optional term added to the PubMed, Google and OpenAlex
#'   literature searches on the site, for example \code{"cancer"}.
#'
#' @return The URL that was opened, invisibly.
#'
#' @examples
#' \dontrun{
#' gene_list(c("PIK3CA", "KRAS", "PTEN", "BRAF"))
#'
#' gene_list(c("Ccne1", "Trp53"), genome = "mouse", search_term = "cancer")
#'
#' # Either name works, for every genome
#' gene_list("Ccne1", genome = "rat")
#' gene_list("Ccne1", genome = "Rattus norvegicus")
#'
#' # Rat, frog, E. coli and Arabidopsis are among the genomes added since 1.0.0
#' gene_list(c("AT1G01010", "AT1G01020"), genome = "Arabidopsis thaliana")
#' }
#'
#' @seealso \code{\link{gene_list_genomes}} for the genomes available, and
#'   \code{\link{gene_list_genome}} to resolve a name without opening anything.
#'
#' @export

gene_list <- function(genes, genome = "human", search_term = "") {
  if (missing(genes) || length(genes) == 0 || all(is.na(genes))) {
    stop("`genes` must contain at least one gene identifier.", call. = FALSE)
  }

  genes <- as.character(genes)
  genes <- genes[!is.na(genes) & nzchar(trimws(genes))]

  if (length(genes) == 0) {
    stop("`genes` must contain at least one gene identifier.", call. = FALSE)
  }

  # Resolved here rather than on the site, where an unknown genome silently
  # returns no genes at all. Takes the common or the scientific name.
  genome <- gene_list_genome(genome)

  # Encoded per identifier, then joined: symbols in several of the genomes
  # contain spaces or brackets, which would otherwise cut the URL short.
  path <- paste(
    vapply(trimws(genes), URLencode, character(1), reserved = TRUE, USE.NAMES = FALSE),
    collapse = ","
  )

  url <- paste0("https://www.gene-list.com/search/", path)

  query <- character(0)
  if (genome != "human") {
    query <- c(query, paste0("genome=", genome))
  }
  if (length(search_term) == 1 && !is.na(search_term) && nzchar(search_term)) {
    query <- c(query, paste0("search_term=", URLencode(search_term, reserved = TRUE)))
  }
  if (length(query) > 0) {
    url <- paste0(url, "?", paste(query, collapse = "&"))
  }

  browseURL(url)
  invisible(url)
}
