complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases


files_list <- list.files(directory, full.names=TRUE) ## Pull all files from dir

size <- length(id)
nobs <- vector("numeric", length = 0)

for (i in 1:size) {
    nobs[i] <- sum(complete.cases(read.csv(files_list[id[i]]))) 
}

data.frame(id=id, nobs = nobs)
}

