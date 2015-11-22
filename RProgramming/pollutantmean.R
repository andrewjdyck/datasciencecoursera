
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)

  read_data <- function(directory, pollutant, id) {
    text_id <- if (nchar(id) == 1) {
      paste('00', id, sep='')
    } else if (nchar(id) == 2) {
      paste('0', id, sep='')
    } else if (nchar(id) ==3) {
      as.character(id)
    }
    d <- read.csv(paste(directory, '/', text_id, '.csv', sep=''))[, pollutant]
    return(d)
  }
  return (
    round(
      mean(
        unlist(lapply(id, function(x) read_data(directory, pollutant, x)))
        , na.rm=T
      )
      , 3
    )
  )
}
