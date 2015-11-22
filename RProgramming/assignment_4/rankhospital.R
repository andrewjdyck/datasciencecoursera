


rankhospital <- function(state, outcome, num) {
  outcome <- gsub(' ', '.', outcome)
  
  ## Read outcome data
  in_data <- read.csv(
    'outcome-of-care-measures.csv', 
    colClasses='character'
  )
  in_data <- in_data[order(in_data[,2]), c(2, 7, 11, 17, 23)]
  names(in_data) <- c('hospital.name', 'state', 'heart.attack', 'heart.failure', 'pneumonia')
  
  ## Check that state and outcome are valid
  validStates <- unique(in_data[, 'state'])
  validOutcomes <- names(in_data[, 3:5])
  if (is.element(state, validStates) == FALSE)
    stop("invalid state")
  if (is.element(outcome, validOutcomes) == FALSE)
    stop("invalid outcome")
  
  ## Return hospital name
  temp <- in_data[which(in_data$state==state), c('hospital.name', outcome)]
  temp[,outcome] <- suppressWarnings(as.numeric(temp[,outcome]))
  temp <- temp[order(temp[,outcome]),]
  temp <- temp[!is.na(temp[,outcome]),]
  
  last <- nrow(temp)
  answer <- if (num == 'best') {
    temp[1,1]
  } else if (num == 'worst') {
    temp[last,1]
  } else if (num > last) {
    NA
  } else {
    temp[num, 1]
  }
  
  return(answer)
}

#rankhospital('TX', 'heart failure', 4)
#rankhospital('MD', 'heart attack', 'worst')
#rankhospital('MN', 'heart failure', 5000)

