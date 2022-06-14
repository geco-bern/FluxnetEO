#' Reads fluxnetEO averaged netcdf data
#'
#' Given a fluxnetEO average file returns
#' a tidy data frame
#'
#' @param file fluxnetEO file
#'
#' @return data frame
#' @export

feo_read_nc <- function(
    file
){

  # grab site from filename
  site <- strsplit(basename(file),"\\.")[[1]][1]

  # convert time (needs attribute read)
  nc <- ncdf4::nc_open(file)

  # Get time vector (convert to seconds since from days since)
  time <- ncdf4::ncvar_get(nc, "time") * 60 * 60 * 24

  # Convert to Y-M-D h-m-s (hack around attribute issues in dates
  # when using bind_cols() or joins)
  time_date <- as.character(as.POSIXct(
      time,
      origin = "1970-01-01"
    )
  )

  # Get variable names
  vars <- names(nc$var)

  # Load variable data
  df <- as.data.frame(
    lapply(vars, function(x) ncdf4::ncvar_get(nc, x))
  )

  # close file
  ncdf4::nc_close(nc)

  # Set names
  colnames(df) <- vars

  # add time column
  df$date <- time_date
  df$site <- site

  # return data frame
  return(df)
}
