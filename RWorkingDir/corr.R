corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations



files_list <- list.files(directory, full.names=TRUE) ## Pull all files from dir

size <- length(files_list)

p_data <- data.frame()

for (i in 1:size) {
          p_data <- rbind(p_data, read.csv(files_list[i])) 
}

}