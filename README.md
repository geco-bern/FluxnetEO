[![R-CMD-check](https://github.com/computationales/FluxnetEO/workflows/R-CMD-check/badge.svg)](https://github.com/computationales/FluxnetEO/actions)

## Purpose

This package provides some functions to read, process or visualize [FluxnetEO data](https://bg.copernicus.org/articles/19/2805/2022/). Crucially, it also provides clean meta-data to aid in further synthesis and re-analysis. This code remains separate from our 'flux data kit' in order to provide people with the
tools to compile their own derivative products more easily.

## Base data & size restrictions

Notes on the datasets. Data is provided as zipped archives and total considerable amounts of data, which requires ample storage space. The MODIS dataset has a compressed size of ~32 GB, which results in an uncompressed size of ~68 GB. The LandSat dataset exceeds 150 GB compressed and exceeds 400 GB uncompressed (estimate as still downloading as of writing). Take this into consideration before proceeding to download and or process the data.

## Installation

### Development release
To install and load the latest version of the rpmodel package (development release, not yet on CRAN) run the following command in your R terminal:

```r
if(!require(devtools)){install.packages(devtools)}
devtools::install_github( "computationales/FluxnetEO", build_vignettes = TRUE )
library(FluxnetEO)
```

## References

Walther, S., Besnard, S., Nelson, J. A., El-Madany, T. S., Migliavacca, M., Weber, U., Carvalhais, N., Ermida, S. L., Brümmer, C., Schrader, F., Prokushkin, A. S., Panov, A. V., and Jung, M.: Technical note: A view from space on global flux towers by MODIS and Landsat: the FluxnetEO data set, Biogeosciences, 19, 2805–2840, https://doi.org/10.5194/bg-19-2805-2022, 2022.

## Acknowledgement

The FluxnetEO is part of the LEMONTREE project and funded by Schmidt Futures and under the umbrella of the Virtual Earth System Research Institute (VESRI).
