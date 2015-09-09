library(utils)
unzip('rprog-data-quiz1_data.zip')
table <- read.csv('hw1_data.csv')
A11 <- names(table)
A12 <- table[1:2,]
A13 <- nrow(table)
A14<- tail(table,n = 2)
A15 <- table$Ozone[47]
A16 <- sum(is.na(table$Ozone))
A17 <- round(mean(table$Ozone[!is.na(table$Ozone)]),1)
A18 <- mean(table$Solar.R[table$Ozone > 31 & table$Temp > 90 & complete.cases(table$Ozone, table$Solar.R, table$Temp)])
A19 <- mean(table$Temp[table$Month == 6 & complete.cases(table$Temp, table$Month)])
A20 <- max(table$Ozone[table$Month ==5 & complete.cases(table$Ozone, table$Month)])
