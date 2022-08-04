# GeneList

GeneList is a platform that makes it easy to navigate research resources. The GeneList R package lets you export a vector of genes to gene-list.com using the function gene_list().

## Installation

#### Using devtools on our GitHub repository

Using the R package `devtools`, run `devtools::install_github('https://github.com/GeneList/GeneList', build_vignettes = TRUE)`

#### From source on our GitHub repository

Clone the repository, for example using `git clone https://github.com/GeneList/GeneList.git`.

Open R in the directory where you cloned the package and run `install.packages("GeneList", repos = NULL, type "source")`

## Using GeneList

-   See the vignette for more details. Run `browseVignettes(package='GeneList')` in R.

### Example

``` r

library(GeneList)

# Input vector of gene Ids 
genes<-c("TP53","PIK3CA","KRAS","PTEN","BRAF")

# Export list of genes to gene-list.com 
gene_list(genes)
```
