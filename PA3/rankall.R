source('~/R/R/PA3/init.R')

rankall <- function(outcome, num = "best") {
    source('~/R/R/PA3/init.R')
    if(!(outcome %in% valid_best_outcome)) stop("invalid outcome")
    
    result <- data.frame(state = states, hospital = NA)
    
    for(state in states){
        
        result$hospital[result$state == state] = rankhospital(state, outcome, num)
        
    
    }
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    result
}
