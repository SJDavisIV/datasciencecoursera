pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)


    
files_list <- list.files(directory, full.names=TRUE) ## Pull all files from dir

p_data <- data.frame()

for (i in id) {
        p_data <- rbind(p_data, read.csv(files_list[i])) 
    }
  eval_data <- p_data[pollutant]
  bad <- is.na(eval_data)   
  mean(eval_data[!bad])
}