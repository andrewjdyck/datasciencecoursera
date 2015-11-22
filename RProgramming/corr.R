corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  temp <- complete(directory)
  ids <- temp$id[temp$nobs>=threshold]
  read_data <- function(directory, id) {
    text_id <- if (nchar(id) == 1) {
      paste('00', id, sep='')
    } else if (nchar(id) == 2) {
      paste('0', id, sep='')
    } else if (nchar(id) ==3) {
      as.character(id)
    }
    d <- read.csv(paste(directory, '/', text_id, '.csv', sep=''))
    return(cor(d$nitrate, d$sulfate, use='p'))
  }
  return( unlist(lapply(ids, function(x) read_data(directory, x))) )
}



