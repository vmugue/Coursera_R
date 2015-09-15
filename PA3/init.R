unzip("rprog-data-ProgAssignment3-data.zip")
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript3.R")

#classes <- class(read.csv("outcome-of-care-measures.csv", nrows = 20))


outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")


valid_best_outcome <- c("heart attack", "heart failure", "pneumonia")
states <- sort(unique(outcome_data$State))

outcome_best <- outcome_data[, 
                             c("State",
                               "Hospital.Name",
                               "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
                               "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
                               "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]

names(outcome_best) <- c("State",
                         "Hospital.Name",
                         valid_best_outcome)

for(i in valid_best_outcome)
    outcome_best[, i] <- as.numeric(outcome_best[, i])