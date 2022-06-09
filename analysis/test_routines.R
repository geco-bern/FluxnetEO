library(dplyr)
source("R/feo_read.R")

path <- "/data/FluxnetEO/MODIS/"

# list all files
files <- list.files(
  path,
  utils::glob2rx("*_cutout.nc"),
  full.names = TRUE,
  recursive = TRUE
)

data <- lapply(files, function(file){
  feo_read_nc(
    file = file
  )
})

data <- do.call("bind_rows", data)

saveRDS(data, "data/average_cutout.rds", compress = "xz")
