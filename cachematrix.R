##-----------------------------------------------------##
## makeCacheMatrix and cacheSolve are two functions    ##
## that together cache a matrix, allow you to          ##
## set the inverse of a matrix                         ##
## and then solve for the inverse of a matrix          ##
## by either recalling a cached version, if it exists, ##
## or computing it for the first time, if the cached   ##
## version is not available                            ##
##-----------------------------------------------------##

## This function creates a special "matrix" object that 
## can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    
    # initialize to NULL, as we have not yet 
    # gotten the inverse of matrix x
    mat_inv <- NULL
    
    # set matrix, example call: cache_mat$set(matrix)
    set <- function(my_mat){
        x <<- my_mat
        mat_inv <<-NULL
    }
    # returns matrix x, example call: cache_mat#get()
    get <- function() x
    # set inv of matrix x
    # solve(matrix) function solves for inverse of matrix x
    setinv <- function(solve) mat_inv <<- solve 
    # returns matrix x's inverse, mat_inv
    getinv <- function() mat_inv
    # return a list of the four functions available
    list(set=set, get=get, setinv=setinv, getinv=getinv)

}



## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already 
## been calculated (and the matrix has not changed), then the cachesolve 
## should retrieve the inverse from the cache.
## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    
    # assigns the current value of getinv() to my_inv_mat
    my_inv_mat <- x$getinv()
    # test if cached version exists
    if (!is.null(my_inv_mat)) {
        message("Getting cashed data for inv matrix")
        return(my_inv_mat)
    }
    
    # equivalent to else statement 
    # compute inverse
    my_mat <- x$get()
    my_inv_mat <- solve(my_mat)
    
    # cache inverse into matrix object x
    x$setinv(my_inv_mat)
    
    # and return
    my_inv_mat
    
}
