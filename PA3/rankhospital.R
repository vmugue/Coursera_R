source('~/R/R/PA3/init.R')


rankhospital <- function(state, outcome, num = "best") {

    ## Check that state and outcome are valid
    if(!(outcome %in% valid_best_outcome)) stop("invalid outcome")
    if(!(state %in% outcome_data$State)) stop("invalid state")
    
    outcome_best <- outcome_best[complete.cases(outcome_best$State, outcome_best[outcome]),]
    outcome_best_state <- outcome_best[outcome_best$State == state,]
    
    
    if(num == "best") num <- 1
    if(num == "worst") num <- nrow(outcome_best_state)
    
    outcome_best_state <- outcome_best_state[order(outcome_best_state$Hospital.Name),]
    #print(outcome_best_state)
    outcome_best_state <- outcome_best_state[order(outcome_best_state[outcome]),]
    #print(outcome_best_state)
    outcome_best_state$Hospital.Name[num]
    
    
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
}