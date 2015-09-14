# library for str_pad - allow to add leadimg zeros
library(stringr)

# unzip source file (downloaded from coursera website)
unzip("rprog-data-specdata.zip")

# returns table cantined all requested files.
readfiles <- function(dir = "specdata", files = 1:332) {
    
    res_table <- c()
    
    for(f in files){
        
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
