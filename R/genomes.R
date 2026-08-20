#' Genomes available on gene-list.com
#'
#' The genomes \code{\link{gene_list}} can look identifiers up in, with the
#' common and scientific name of each species and the assembly the gene
#' annotations come from.
#'
#' Either name can be given as \code{genome}: \code{"rat"} and \code{"Rattus
#' norvegicus"} are the same genome. The \code{genome} column is the value the
#' site itself uses, which is a common name for some species and a scientific
#' one for others.
#'
#' @return A data frame with columns \code{genome}, \code{common_name},
#'   \code{scientific_name} and \code{assembly}, ordered as they appear in the
#'   species menu on the site: the commonly used model organisms first, then
#'   the rest by taxonomic group.
#'
#' @examples
#' gene_list_genomes()
#'
#' # Names that can be given to gene_list(genome = )
#' gene_list_genomes()[, c("common_name", "scientific_name")]
#'
#' @seealso \code{\link{gene_list_genome}} to resolve a name to the value the
#'   site expects.
#'
#' @export
gene_list_genomes <- function() {
  data.frame(
    genome = c(
      "human", "mouse", "rattus_norvegicus", "danio_rerio",
      "drosophila_melanogaster", "caenorhabditis_elegans", "yeast",
      "escherichia_coli", "arabidopsis_thaliana", "xenopus_tropicalis",
      "canis_lupus_familiaris", "felis_catus", "oryctolagus_cuniculus",
      "cavia_porcellus", "macaca_mulatta", "macaca_fascicularis",
      "bos_taurus", "sus_scrofa", "ovis_aries", "equus_caballus",
      "gallus_gallus", "oryzias_latipes", "salmo_salar", "apis_mellifera",
      "tribolium_castaneum", "daphnia_pulex", "anopheles_gambiae",
      "aedes_aegypti", "schizosaccharomyces_pombe",
      "dictyostelium_discoideum", "plasmodium_falciparum",
      "trypanosoma_brucei", "oryza_sativa", "zea_mays",
      "triticum_aestivum", "hordeum_vulgare", "glycine_max",
      "solanum_lycopersicum", "solanum_tuberosum",
      "chlamydomonas_reinhardtii"
    ),
    common_name = c(
      "Human", "Mouse", "Rat", "Zebrafish", "Fruit fly", "Roundworm",
      "Baker's yeast", "E. coli", "Thale cress", "Tropical clawed frog",
      "Dog", "Cat", "Rabbit", "Guinea pig", "Rhesus macaque",
      "Cynomolgus macaque", "Cattle", "Pig", "Sheep", "Horse", "Chicken",
      "Medaka", "Atlantic salmon", "Honey bee", "Red flour beetle",
      "Water flea", "Malaria mosquito", "Yellow fever mosquito",
      "Fission yeast", "Slime mould", "Malaria parasite",
      "Sleeping sickness parasite", "Rice", "Maize", "Bread wheat",
      "Barley", "Soybean", "Tomato", "Potato", "Green alga"
    ),
    scientific_name = c(
      "Homo sapiens", "Mus musculus", "Rattus norvegicus", "Danio rerio",
      "Drosophila melanogaster", "Caenorhabditis elegans",
      "Saccharomyces cerevisiae", "Escherichia coli K-12",
      "Arabidopsis thaliana", "Xenopus tropicalis",
      "Canis lupus familiaris", "Felis catus", "Oryctolagus cuniculus",
      "Cavia porcellus", "Macaca mulatta", "Macaca fascicularis",
      "Bos taurus", "Sus scrofa", "Ovis aries", "Equus caballus",
      "Gallus gallus", "Oryzias latipes", "Salmo salar", "Apis mellifera",
      "Tribolium castaneum", "Daphnia pulex", "Anopheles gambiae",
      "Aedes aegypti", "Schizosaccharomyces pombe",
      "Dictyostelium discoideum", "Plasmodium falciparum",
      "Trypanosoma brucei", "Oryza sativa", "Zea mays",
      "Triticum aestivum", "Hordeum vulgare", "Glycine max",
      "Solanum lycopersicum", "Solanum tuberosum",
      "Chlamydomonas reinhardtii"
    ),
    assembly = c(
      "GRCh38", "GRCm39", "GRCr8", "GRCz11", "BDGP6", "WBcel235",
      "R64-1-1", "ASM584v2", "TAIR10", "UCB_Xtro_10.0", "ROS_Cfam_1.0",
      "Fca126_mat1.0", "OryCun2.0", "Cavpor3.0", "Mmul_10",
      "Macaca_fascicularis_6.0", "ARS-UCD2.0", "Sscrofa11.1",
      "ARS-UI_Ramb_v3.0", "EquCab3.0", "GRCg7b", "ASM223467v1",
      "Ssal_v3.1", "Amel_HAv3.1", "icTriCast1.1", "ASM2113471v1", "AgamP4",
      "AaegL5", "ASM294v2", "dicty_2.7", "GCA000002765v3",
      "GCA000002445v1", "IRGSP-1.0", "B73 NAM-5.0", "IWGSC", "MorexV3",
      "Glycine_max_v2.1", "SL4.0", "SolTub_3.0", "v5.5"
    ),
    stringsAsFactors = FALSE
  )
}
