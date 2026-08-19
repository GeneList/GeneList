# GeneList

GeneList is a platform that makes it easy to navigate research resources. The GeneList R package lets you export a vector of gene Ids to gene-list.com using the function gene_list().

## Installation

#### Using devtools on our GitHub repository

Using the R package `devtools`, run `devtools::install_github('https://github.com/GeneList/GeneList', build_vignettes = TRUE)`

#### From source on our GitHub repository

Clone the repository, for example using `git clone https://github.com/GeneList/GeneList.git`.

Open R in the directory where you cloned the package and run `install.packages("GeneList", repos = NULL, type "source")`

## Using GeneList

### Example

``` r

library(GeneList)

# Input vector of gene Ids 
genes<-c("PIK3CA","KRAS","PTEN","BRAF")

# Export list of genes to gene-list.com 
gene_list(genes,genome="mouse",search_term="Cancer")
```

Identifiers can be gene symbols, Ensembl or UniProt accessions, Entrez ids, a
GO term such as `GO:0006281`, or a chromosome range such as
`chr1:10000-5000000`.

## Genomes

Pass any of the following as `genome`. The default is `human`.

``` r
# The full table, with common names, scientific names and assemblies
gene_list_genomes()
```

| `genome` | Species | Assembly |
| --- | --- | --- |
| `human` | Human — *Homo sapiens* | GRCh38 |
| `mouse` | Mouse — *Mus musculus* | GRCm39 |
| `rattus_norvegicus` | Rat — *Rattus norvegicus* | GRCr8 |
| `danio_rerio` | Zebrafish — *Danio rerio* | GRCz11 |
| `drosophila_melanogaster` | Fruit fly — *Drosophila melanogaster* | BDGP6 |
| `caenorhabditis_elegans` | Roundworm — *Caenorhabditis elegans* | WBcel235 |
| `yeast` | Baker's yeast — *Saccharomyces cerevisiae* | R64-1-1 |
| `escherichia_coli` | E. coli — *Escherichia coli* K-12 | ASM584v2 |
| `arabidopsis_thaliana` | Thale cress — *Arabidopsis thaliana* | TAIR10 |
| `xenopus_tropicalis` | Tropical clawed frog — *Xenopus tropicalis* | UCB_Xtro_10.0 |
| `canis_lupus_familiaris` | Dog — *Canis lupus familiaris* | ROS_Cfam_1.0 |
| `felis_catus` | Cat — *Felis catus* | Fca126_mat1.0 |
| `oryctolagus_cuniculus` | Rabbit — *Oryctolagus cuniculus* | OryCun2.0 |
| `cavia_porcellus` | Guinea pig — *Cavia porcellus* | Cavpor3.0 |
| `macaca_mulatta` | Rhesus macaque — *Macaca mulatta* | Mmul_10 |
| `bos_taurus` | Cattle — *Bos taurus* | ARS-UCD2.0 |
| `sus_scrofa` | Pig — *Sus scrofa* | Sscrofa11.1 |
| `ovis_aries` | Sheep — *Ovis aries* | ARS-UI_Ramb_v3.0 |
| `equus_caballus` | Horse — *Equus caballus* | EquCab3.0 |
| `gallus_gallus` | Chicken — *Gallus gallus* | GRCg7b |
| `apis_mellifera` | Honey bee — *Apis mellifera* | Amel_HAv3.1 |
| `oryza_sativa` | Rice — *Oryza sativa* | IRGSP-1.0 |
| `zea_mays` | Maize — *Zea mays* | B73 NAM-5.0 |
| `glycine_max` | Soybean — *Glycine max* | Glycine_max_v2.1 |

``` r
# Rat
gene_list(c("Ccne1", "Trp53"), genome = "rattus_norvegicus")

# Arabidopsis
gene_list(c("AT1G01010", "AT1G01020"), genome = "arabidopsis_thaliana")
```

An unrecognised `genome` raises an error listing the ones available, rather
than opening a page with no genes on it.
