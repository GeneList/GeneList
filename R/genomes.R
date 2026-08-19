#' Genomes available on gene-list.com
#'
#' The value of \code{genome} accepted by \code{\link{gene_list}}, with the
#' common and scientific name of each species and the assembly the gene
#' annotations come from.
#'
#' @return A data frame with columns \code{genome}, \code{common_name},
#'   \code{scientific_name} and \code{assembly}, ordered as they appear in the
#'   species menu on the site: the commonly used model organisms first, then
#'   the rest by taxonomic group.
#'
#' @examples
#' gene_list_genomes()
#'
#' # The values accepted by gene_list(genome = )
#' gene_list_genomes()$genome
#'
#' @export
gene_list_genomes <- function() {
  data.frame(
    genome = c(
      "human", "mouse", "rattus_norvegicus", "danio_rerio",
      "drosophila_melanogaster", "caenorhabditis_elegans", "yeast",
      "escherichia_coli", "arabidopsis_thaliana", "xenopus_tropicalis",
      "canis_lupus_familiaris", "felis_catus", "oryctolagus_cuniculus",
      "cavia_porcellus", "macaca_mulatta", "bos_taurus", "sus_scrofa",
      "ovis_aries", "equus_caballus", "gallus_gallus", "apis_mellifera",
      "oryza_sativa", "zea_mays", "glycine_max"
    ),
    common_name = c(
      "Human", "Mouse", "Rat", "Zebrafish", "Fruit fly", "Roundworm",
      "Baker's yeast", "E. coli", "Thale cress", "Tropical clawed frog",
      "Dog", "Cat", "Rabbit", "Guinea pig", "Rhesus macaque", "Cattle",
      "Pig", "Sheep", "Horse", "Chicken", "Honey bee", "Rice", "Maize",
      "Soybean"
    ),
    scientific_name = c(
      "Homo sapiens", "Mus musculus", "Rattus norvegicus", "Danio rerio",
      "Drosophila melanogaster", "Caenorhabditis elegans",
      "Saccharomyces cerevisiae", "Escherichia coli K-12",
      "Arabidopsis thaliana", "Xenopus tropicalis", "Canis lupus familiaris",
      "Felis catus", "Oryctolagus cuniculus", "Cavia porcellus",
      "Macaca mulatta", "Bos taurus", "Sus scrofa", "Ovis aries",
      "Equus caballus", "Gallus gallus", "Apis mellifera", "Oryza sativa",
      "Zea mays", "Glycine max"
    ),
    assembly = c(
      "GRCh38", "GRCm39", "GRCr8", "GRCz11", "BDGP6", "WBcel235", "R64-1-1",
      "ASM584v2", "TAIR10", "UCB_Xtro_10.0", "ROS_Cfam_1.0", "Fca126_mat1.0",
      "OryCun2.0", "Cavpor3.0", "Mmul_10", "ARS-UCD2.0", "Sscrofa11.1",
      "ARS-UI_Ramb_v3.0", "EquCab3.0", "GRCg7b", "Amel_HAv3.1", "IRGSP-1.0",
      "B73 NAM-5.0", "Glycine_max_v2.1"
    ),
    stringsAsFactors = FALSE
  )
}
