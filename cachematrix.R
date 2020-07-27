## Put comments here that give an overall description of what your
## functions do

## Since matrix inversion takes some costly computational effort, this function
## caches the inverse of the matrix rather than computing it several times. 
## THe following functions cache the inverse of a matrix


## Write a short comment describing this function

## The first function, makeCacheMatrix creates a special "vector", 
## which is really a list containing a function to:

## set the value of the matrix
## get the value of the matrix
## set the value of the inverse of the matrix
## get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }

  get <- function() x
  setinverse <- function(solve) m <<-solve
  getinverse <- function() m
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
  
}


## Write a short comment describing this function

## The following function calculates the inverse of the special "vector" created 
## with the above function. However, it first checks to see if the inverse has
## already been calculated. If so, it gets the inverse from the cache and 
## skips the computation. Otherwise, it calculates the inverse 
## and sets the value of the inverse in the cache via the setinverse function.


cacheSolve <- function(x, ...) {
          ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if (!is.null(m)) {
    message("getting cached matrix")
    return(m)
  }
  data <- x$get()
  m<-solve(data, ...)
  x$setinverse(m)
  m
}
