## The makeCacheMatrix() has two functions one for getting the inverse of
## matrix passed as arguement and another is for setting it as a global environment.
## The cacheSolve() function checks the existence of the global variable if populated 
## or not else computes a inverse of a separate matrix passed.

## Takes as arguement a matrix and sets the inv locally in the function.For setting the 
## matrix inverse set function is used.

makeCacheMatrix <- function(x = matrix()) {
    inv<-solve(x)
    getmatrix<-function() inv
    setmatrix<-function(y=NULL)inv<<-solve(x)
    list(get = getmatrix, set = setmatrix)
}

## This is a differrent function that checks the value of inv from the previous function.
## if the cache is not stored through the set function of the previous function
## it would set the inverse global for the new arguement variable passed in this 
##function

cacheSolve <- function(cache,x2, ...) {
    cache2 <- cache$get()
    message("Checking cache...")
    if(is.null(cache2)) {
        message("No previously cached value.")
    } else { 
        print(cache2)
    }
    message("Setting new cached value...")
    cache$set(x)
    print(cache$get())
    message("Finished.")'
}
