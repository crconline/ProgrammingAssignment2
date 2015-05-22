# Carlos Rodriguez Contreras
# Johns Hopkins University - Coursera Data Science Specialization
# R Programming
# Programming Assignment 2
# May 21, 2015

## There are three functions in this script:
## function makeCacheMatrix creates a matrix that can cache its inverse

## Function makeCacheMatrix receives in x a square invertible matrix and return
## a list of functions used as input to cacheSolve
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    get <- function() x
    setinv <- function(inverse) inv <<- inverse
    getinv <- function() inv
    list(set = set, get = get, setinv = setinv, getinv = getinv)
    
}


## Function cacheSolve receives in x the output of makeCacheMatrix and return
## the inverse matrix of x
## If the matrix is already been calculated get it from the cache
cacheSolve <- function(x, ...) {
    inv <- x$getinv()
    if(!is.null(inv)) {
        message("getting cached data")
        #return(inv)  # Uncomment for not to see the inverse matrix but the processing time
    } else{
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        #return(inv) # Uncomment for not to see the inverse matrix but the processing time
    }
    print(inv) # Comment for not to see the inverse matrix but the processing time
}

## Function test is for test the makeCacheMatrix and cacheSolve functions
## It receives a invertible matrix and send it to makeCacheMatrix then it
## calls cacheSolve to compute the inverse twice. Each processing time is
## measured to see the difference when it does not compute the inverse but
## retrieve it from the cache 
test <- function(mat) {
    temp <- makeCacheMatrix(mat)
    
    start.time <- Sys.time()
    cacheSolve(temp)
    total.time <- Sys.time() - start.time
    print(total.time)
    
    start.time <- Sys.time()
    cacheSolve(temp)
    total.time <- Sys.time() - start.time
    print(total.time)
    
}

set.seed(1110201)
values <- rnorm(1000000, 100, 40)
mymatrix <- matrix(values, nrow=1000, ncol=1000)

test(mymatrix)
