## Below are two functions that cache the inverse of of a matrix
## 
## The first function (makeCacheMatrix) creates a special matrix object that can
## cache its inverse.
##
## The second functions actually computes the inverse of the special matrix as
## returned by the first function (makeCacheMatrix). However, if the inverse has
## already been calculated, the cachesolve retrieves the inverse from the cache


## makeCacheMatrix is a function that Creates a  special matrix that can cache
## its inverse. It contains the following 4 functions:

# 1: set matrix
# 2: get matrix
# 3: set cache inverse matrix
# 4: get cached matrix
# finally it returns a list with 4 previous functions as the elements

makeCacheMatrix <- function(x = matrix()) {
        #first, we identify the variable that caches the inverse matrix and
        #initially set it to NULL
        cachedmatrix <- NULL
        
        # 1. Set the matrix
        setMatrix <- function(matrix) {
                m <<- matrix
                cachedmatrix <<- NULL
        }
        
        # 2. Get the matrix
        getmatrix <- function() {
                m
        }
        
        # 3. Set cache inverse matrix
        setCache <- function(solve) {
                cachedmatrix <<- solve
        }
        
        # 4. Get cached matrix
        getCache <- function() {
                cachedmatrix
        }
        
        # Return a list with the 4 abovementioned functions as the 4 elements
        list(setMatrix = setMatrix, getMatrix = getMatrix, setCache = setCache,
             getCache = getCache)
}


## This function first checks if there is already a cached inverted matrix
## If there is, this cached value will be returned to the user
## If it doesn't exist yet, it will be computed, stored in the cache and 
## returned to the user

cacheSolve <- function(x, ...) {
        # Get the cached value
        m <- x$getCache()
        
        # If there is a cached value, return it (and let user know it exists)
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        
        # If there is no cached value, get matrix, invert it, and store it
        data <- x$getMatrix()
        m <- solve(data)
                x$setCache(m)
        
        # Return the inverse
        m
}
