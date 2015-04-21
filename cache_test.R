## http://cran.r-project.org/doc/manuals/r-release/R-lang.html
# example to understand <<-

# e here is [1,2], i is 1
e<-c(a=1,b=2)
i<-1
local({
    # e here is [10,11], i is 2
    e <- c(A=10,B=11)
    i <-2
    # e[2] from outside local gets
    # e[2] from inside local + 1
    # so [1,2][2nd place] = 11+1
    e[i] <<- e[i]+1
})
e



## Test basic caching
##
n <- 3
mat <- matrix(rnorm(1:(n*n)), nrow=n, ncol=n)
matCached <- makeCacheMatrix(mat)
matSolved1 <- cacheSolve(matCached)
matSolved2 <- cacheSolve(matCached)
if (!identical(matSolved1, matSolved2))
    message("Cached version does not match solved version")


## Use a time test to see if we really save time
##
n <- 128
mat <- matrix(rnorm(1:(n*n)), nrow=n, ncol=n)
matCached <- makeCacheMatrix(mat)
time1 <- system.time(matSolved1 <- cacheSolve(matCached))
time2 <- system.time(matSolved2 <- cacheSolve(matCached))
if (time1["user.self"] < time2["user.self"])
    message("Solve time is less than cache time")