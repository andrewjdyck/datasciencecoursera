
#outcome <- 'heart attack'
#num <- 20
rankall <- function(outcome, num = "best") {
  ## Read outcome data
  outcome <- gsub(' ', '.', outcome)
  in_data <- read.csv(
    'outcome-of-care-measures.csv', 
    colClasses='character'
  )
  in_data <- in_data[order(in_data[,2]), c(2, 7, 11, 17, 23)]
  names(in_data) <- c('hospital.name', 'state', 'heart.attack', 'heart.failure', 'pneumonia')
  
  ## Check that state and outcome are valid
  validStates <- sort(unique(in_data[, 'state']))
  validOutcomes <- names(in_data[, 3:5])
  if (is.element(outcome, validOutcomes) == FALSE)
    stop("invalid outcome")
  
  ## For each state, find the hospital of the given rank
  return_state_hospital <- function(state, ...) {
    temp <- in_data[in_data$state==state,
                    c('hospital.name', outcome)]
    temp[, outcome] <- suppressWarnings(as.numeric(temp[,outcome]))
    temp <- temp[!is.na(temp[,outcome]),]
    temp <- temp[order(temp[,outcome]),]
    
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
    return( data.frame(
      hospital=answer, 
      state=state
    ))
  }
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  all <- do.call('rbind', lapply(validStates, return_state_hospital))
  return( all )
}

head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)
