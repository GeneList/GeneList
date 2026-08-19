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

`genome` takes either the common name or the scientific name of any species
below. Case and spacing are ignored, so `"rat"`, `"Rat"`, `"Rattus norvegicus"`
and `"rattus_norvegicus"` are all the same genome. The default is human.

``` r
# The full table, with common names, scientific names and assemblies
gene_list_genomes()
```

| Common name | Scientific name | Assembly |
| --- | --- | --- |
| Human | *Homo sapiens* | GRCh38 |
| Mouse | *Mus musculus* | GRCm39 |
| Rat | *Rattus norvegicus* | GRCr8 |
| Zebrafish | *Danio rerio* | GRCz11 |
| Fruit fly | *Drosophila melanogaster* | BDGP6 |
| Roundworm | *Caenorhabditis elegans* | WBcel235 |
| Baker's yeast | *Saccharomyces cerevisiae* | R64-1-1 |
| E. coli | *Escherichia coli* K-12 | ASM584v2 |
| Thale cress | *Arabidopsis thaliana* | TAIR10 |
| Tropical clawed frog | *Xenopus tropicalis* | UCB_Xtro_10.0 |
| Dog | *Canis lupus familiaris* | ROS_Cfam_1.0 |
| Cat | *Felis catus* | Fca126_mat1.0 |
| Rabbit | *Oryctolagus cuniculus* | OryCun2.0 |
| Guinea pig | *Cavia porcellus* | Cavpor3.0 |
| Rhesus macaque | *Macaca mulatta* | Mmul_10 |
| Cattle | *Bos taurus* | ARS-UCD2.0 |
| Pig | *Sus scrofa* | Sscrofa11.1 |
| Sheep | *Ovis aries* | ARS-UI_Ramb_v3.0 |
| Horse | *Equus caballus* | EquCab3.0 |
| Chicken | *Gallus gallus* | GRCg7b |
| Honey bee | *Apis mellifera* | Amel_HAv3.1 |
| Rice | *Oryza sativa* | IRGSP-1.0 |
| Maize | *Zea mays* | B73 NAM-5.0 |
| Soybean | *Glycine max* | Glycine_max_v2.1 |

``` r
# These are the same request
gene_list(c("Ccne1", "Trp53"), genome = "rat")
gene_list(c("Ccne1", "Trp53"), genome = "Rattus norvegicus")

# As are these
gene_list(c("AT1G01010", "AT1G01020"), genome = "thale cress")
gene_list(c("AT1G01010", "AT1G01020"), genome = "Arabidopsis thaliana")
```

An unrecognised `genome` raises an error listing the species available, rather
than opening a page with no genes on it.

The site itself matches on one name per genome — a common name for some species
and a scientific one for others — which is what `gene_list_genomes()$genome`
holds. `gene_list_genome()` shows what a name resolves to:

``` r
gene_list_genome("Baker's yeast")
#> [1] "yeast"

gene_list_genome("Rat")
#> [1] "rattus_norvegicus"
```
