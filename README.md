### Programming Assignment 2
# Caching the Inverse of a Matrix
### Carlos Rodriguez-Contreras

This README file is intended to give help to the peer reviewers in charge 
of review the Programming Assignment 2:

The cachematrix.R script contains three functions:

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then
    `cacheSolve` should retrieve the inverse from the cache.
3. `test`: This function launches the computing process, so it is the only one that
    is used to review the script, simply call the function with a matrix as the only
    parameter, for example `test(mymatrix)`

The script also contains code lines to generate and call the test function:

<!-- -->
    set.seed(1110201)
    values <- rnorm(1000000, 100, 40)
    mymatrix <- matrix(values, nrow=1000, ncol=1000)

    test(mymatrix)

The function cacheSolve is able to measure processing time, and has two lines commented
and a line that prints the inverse matrix, in case you need to supress the inverse matrix
in the output to know only the processing times, it is suggested to uncomment these two lines
and comment the one that prints the inverse matrix.

In case you want to generate another reversible matrix, simply call
test function with the new matrix.

