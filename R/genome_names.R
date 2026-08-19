# The genome values the site matches on are inconsistent -- some are common
# names (human, mouse, yeast), others scientific (rattus_norvegicus,
# danio_rerio) -- because they grew up alongside the database rather than being
# chosen as a set. Rather than make people remember which is which, either name
# is accepted for every genome and resolved to the value the site expects.

#' Reduce a genome name to a comparable form
#'
#' Lower case, with anything that is not a letter or digit collapsed to a single
#' underscore, so "Rattus norvegicus", "rattus_norvegicus" and "Rattus
#' Norvegicus" all compare equal. Apostrophes are dropped rather than collapsed,
#' so "Baker's yeast" and "bakers yeast" agree.
#'
#' @param x Character vector.
#' @return Character vector of the same length.
#' @noRd
normalise_genome_name <- function(x) {
  x <- tolower(trimws(as.character(x)))
  # Straight and both curly apostrophes, as \u escapes: R sources have to be
  # ASCII to be portable.
  x <- gsub("['\u2018\u2019]", "", x)
  x <- gsub("[^a-z0-9]+", "_", x)
  gsub("^_+|_+$", "", x)
}

#' The same, with the separators removed as well
#'
#' Lets "ecoli" and "homosapiens" find their genome. Kept as a second pass
#' rather than the only one, so that a name is matched on its exact form first.
#'
#' @param x Character vector.
#' @return Character vector of the same length.
#' @noRd
strip_genome_name <- function(x) {
  gsub("_", "", normalise_genome_name(x))
}

#' Every name that resolves to a genome
#'
#' @return A data frame of \code{name} and the \code{genome} the site expects,
#'   with the site's own value, the common name and the scientific name all
#'   mapping to the same genome, in both normalised and separator-free form.
#' @noRd
genome_aliases <- function() {
  available <- gene_list_genomes()

  names <- c(available$genome, available$common_name, available$scientific_name)
  genomes <- rep(available$genome, times = 3)

  aliases <- data.frame(
    name = c(normalise_genome_name(names), strip_genome_name(names)),
    genome = c(genomes, genomes),
    stringsAsFactors = FALSE
  )

  # A name may appear more than once -- for most species the site's own value is
  # already the common or the scientific name -- but only as the same genome.
  aliases[!duplicated(aliases), ]
}

#' Resolve a genome name to the value gene-list.com expects
#'
#' Accepts the common name, the scientific name, or the value the site itself
#' uses, in any case and with spaces or underscores: \code{"Rat"},
#' \code{"rattus norvegicus"} and \code{"rattus_norvegicus"} are the same
#' genome.
#'
#' @param genome A single genome name.
#'
#' @return The value to send to the site.
#'
#' @examples
#' gene_list_genome("Rat")
#' gene_list_genome("Homo sapiens")
#' gene_list_genome("bakers yeast")
#'
#' @export
gene_list_genome <- function(genome) {
  if (length(genome) != 1 || is.na(genome) || !nzchar(trimws(genome))) {
    stop("`genome` must be a single genome name.", call. = FALSE)
  }

  aliases <- genome_aliases()
  match <- aliases$genome[aliases$name == normalise_genome_name(genome)]

  if (length(match) == 0) {
    match <- aliases$genome[aliases$name == strip_genome_name(genome)]
  }

  if (length(match) == 0) {
    available <- gene_list_genomes()
    stop(
      "Unknown genome: \"", genome, "\".\n",
      "Give the common or the scientific name of any of:\n  ",
      paste(
        paste0(available$common_name, " / ", available$scientific_name),
        collapse = "\n  "
      ),
      call. = FALSE
    )
  }

  match[1]
}
