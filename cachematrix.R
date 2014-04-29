## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function



## function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    ss <- NULL
    set <- function(y) {
        x <<- y
        ss <<- NULL
    }
    get <- function() x
    setinverse<- function(inverse) ss <<-inverse
    getinverse <- function() ss
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

## function computes the inverse of the special "matrix" returned by makeCacheMatrix above.

cacheSolve <- function(x, ...) {
       ss <- x$getinverse()
    if (!is.null(ss)) {
        message("getting inverse matrix")
        return(ss)
    } else {
        ss <- solve(x$get())
        x$setinverse(ss)
        return(ss)
    }
}
