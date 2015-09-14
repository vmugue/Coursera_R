# library for str_pad - allow to add leadimg zeros
library(stringr)

# unzip source file (downloaded from coursera website)
unzip("rprog-data-specdata.zip")

# returns table cantined all requested files.
readfiles <- function(dir = "specdata", id = 1:332) {
    
    res_table <- c()
    
    for(f in id){
        
        # modify number to 3 digits zerofilled character
        f000 <- str_pad(f, 3, side = "left", pad = 0)
        file_name <- paste(dir, "/", f000, ".csv", sep="")
        cur_file <- read.csv(file_name)
        res_table <- rbind(res_table, cur_file)
    }
    res_table
}


pollutantmean <- function(directory, pollutant, id = 1:332){
    pollut_data <- readfiles(directory, id)
    round(mean(pollut_data[,pollutant], na.rm = TRUE), 3)
    
    
}


complete <- function(directory = "specdata", id = 1:332){
    
    
    # create data frame with rigth nimber of rows
    result <- data.frame(id = 1:length(id), nobs=NA)
    
    # k - counter, will help to fill "result" data frame
    k <- 1
    for(i in id){
        
        pollut_data <- readfiles(directory, i)
        #file for this particular id (only required columns)
        pollution_for_i <- pollut_data[, c("sulfate", "nitrate")]
        
        # adding this complete cases for this id to result data frame
        result$nobs[k] <- sum(complete.cases(pollution_for_i))
        
        # counter for following rows
        k <- k+1
    }
    
    result
}


corr <- function(directory = "specdata", threshold = 0){
    com_case <- complete()
    files_for_corr <- com_case$id[com_case$nobs > threshold]
    result <- c()
    class(result) <- "numeric"
    
    for(i in files_for_corr){
        pollut_data <- readfiles(directory, i)
        pollut_data_cc <- pollut_data[
            complete.cases(pollut_data),
                c("sulfate", "nitrate")]
        result <- c(result,
                cor(pollut_data_cc$sulfate, pollut_data_cc$nitrate))
        
    }
    result
}