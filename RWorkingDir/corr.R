corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0

    ## Return a numeric vector of correlations



files_list <- list.files(directory, full.names=TRUE) ## Pull all files from dir

id <- 1:332

source("complete.R")

t_obs <- subset(complete(directory), nobs > threshold) 
    ## All complete oberservations within the threshold 

t_mon <- t_obs$id
    ## Vector of monitors with complete observation

p_data <- data.frame()

for (i in id) {
    p_data <- rbind(p_data, read.csv(files_list[i]))
    
}

size <- length(t_mon) ## Iterations

mon_cor <- data.frame()  ## stores each monitor

c <- vector("numeric") ## stores return value
if(size > 0) {
for (i in 1:size) {
        mon_cor <- subset(p_data, ID == t_mon[i])
        c[i] <- cor(mon_cor$nitrate, mon_cor$sulfate, use = "complete.obs")        
}
}

c

}