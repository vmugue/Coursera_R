library(datasets)
data(iris)
data(mtcars)
A01 <- mean(iris$Sepal.Length[iris$Species == "virginica"])
A02 <- apply(iris[, 1:4], 2, mean)
A03 <- tapply(mtcars$mpg, mtcars$cyl, mean)
tmp04 <- tapply(mtcars$hp, mtcars$cyl, mean)
A04 <- tmp04[["8"]] - tmp04[["4"]]

