
setwd('~/Documents/datasciencecoursera/r_programming/assignment_4')

outcome <- read.csv('outcome-of-care-measures.csv', 
                    colClasses='character')
read_outcome_data <- function() {
  read.csv(
    'outcome-of-care-measures.csv', 
    colClasses='character'
  )
}

best <- function(state, outcome) {
  outcome <- gsub(' ', '.', outcome)
  ## Read outcome data
  in_data <- read_outcome_data()
  in_data <- in_data[order(in_data[,2]), c(2, 7, 11, 17, 23)]
  names(in_data) <- c('hospital.name', 'state', 'heart.attack', 'heart.failure', 'pneumonia')
  
  ## Check that state and outcome are valid
  validStates <- unique(in_data[, 'state'])
  validOutcomes <- names(in_data[, 3:5])
  if (is.element(state, validStates) == FALSE)
    stop("invalid state")
  if (is.element(outcome, validOutcomes) == FALSE)
    stop("invalid outcome")
  
  ## Return hospital name in that state with lowest
  ## 30-day death rate.
  temp <- in_data[which(in_data$state==state), c('hospital.name', outcome)]
  temp[,outcome] <- suppressWarnings(as.numeric(temp[,outcome]))
  temp <- temp[order(temp[,outcome]),]
  return(temp[1,1])
}

#best('TX', 'heart attack')
#best('TX', 'heart failure')
#best('MD', 'heart attack')
#best('MD', 'pneumonia')
#best('BB', 'heart attack')

