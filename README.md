# Code for OdonTraits Europe

This repository contains code to format and plot data for the following data paper:

> De Knijf, G., Bried, J., Engel, T., Jeanmougin, M., Fontaine, C., Schmucki, R. & Nicvert, L. OdonTraits Europe. A comprehensive traits dataset for European dragonflies and damselflies. (in prep.).

## Content

-   `analyses/` contains the code to format the data and plot the trait coverage.
    -   `01_make_csvs.R` converts the data from an Excel file to CSV format (the CSVs correspond to the [data](https://doi.org/10.5281/zenodo.17248815) published on Zenodo).
    -   `02_plot_traits.qmd` plots the two figures for trait coverage from the data paper (`02_plot_traits.html` shows the result of this analysis).
-   `data/` contains:
    -   a copy of the OdonTraits Europe database (De Knijf et al., 2026) (in `csv-files/`)
    -   trait data in Excel format (`OdonTraits_Europe.xlsx`)
    -   silhouettes images downloaded from Phylopic (in `phylopic/`; see attribution in subfolder).
-   `figures/` contains figures produced with the analyses.

## File overview

`data/csv-files` contains the following files:

- imago.csv: morphological traits related to imago stage
- larvae_exuvia.csvcsv: morphological traits related to larva or exuvia stage
- ecological.csv: traits related to species ecology
- protection_endemism.csv: traits related to protection and endemism
- conservation.csv: traits related to conservation status
- taxonomic.csv: taxonomic information for species
- sources.csv: sources table for each species and trait
- references.csv: complete reference for the sources
- column_description.csv: description of each column from thez previous tables

For more information, refer to the dataset published on Zenodo or the complete publication.

Missing values are coded as "NA".

## Installation

This repository uses a DESCRIPTION file to manage dependencies. 
To load packages required for the analyses, scripts use the following code:

``` r
devtools::install_deps(upgrade = "never")
devtools::load_all()
```

## License

The code is released under the [MIT license](LICENSE.md). 
The [data](https://doi.org/10.5281/zenodo.17248815) are released on Zenodo under a [CC-BY license](https://creativecommons.org/licenses/by/4.0/).

## References
De Knijf, G., Bried, J., Engel, T., Jeanmougin, M., Fontaine, C., Schmucki, R. & Nicvert, L. OdonTraits Europe. A comprehensive traits dataset for European dragonflies and damselflies. (in prep.).
De Knijf, G., Bried, J., Engel, T., Jeanmougin, M., Fontaine, C., Schmucki, R. & Nicvert, L. OdonTraits Europe. A comprehensive traits dataset for European dragonflies and damselflies. _Zenodo_ https://doi.org/10.5281/zenodo.17248815 (2026).
