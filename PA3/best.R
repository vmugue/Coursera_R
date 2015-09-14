source('~/R/R/PA3/init.R')

best <- function(state, outcome) {
    if(!(outcome %in% valid_best_outcome)) stop("invalid outcome")
    
    if(!(state %in% states)) stop("invalid state")
    
    
    outcome_best <- outcome_best[complete.cases(outcome_best$State, outcome_best[outcome]),]
    outcome_best_state <- outcome_best[outcome_best$State == state,]
    
    
    

    outcome_best_hospitals <- outcome_best_state$Hospital.Name[outcome_best_state[outcome] == min(outcome_best_state[outcome])]

    as.character(sort(outcome_best_hospitals)[1])
   
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with lowest 30-day death
    ## rate
}
