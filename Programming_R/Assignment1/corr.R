corr <- function(directory, threshold = 0) {
  source("complete.R")
  
  #This below worked fine, but decided to use the complete code above
  
  #allFiles <- list.files(path=paste0("./",directory),pattern="*.csv")
  #id <- 1:length(allFiles)
  #number of observations in all files
  #nobs <- unlist(lapply(id, function(x) sum(complete.cases(read.csv(paste0("./",directory,"/",allFiles[[x]]))))))
  #list of files passing threshold
  #threshFiles <- allFiles[nobs>threshold]
  
  df_complete <- complete(directory)
  df_thresh <- df_complete[df_complete$nobs >= threshold,]
  
  if (nrow(df_thresh) == 0) {
    return(numeric(0))
  } else { #we have some data
    #make a list to hold correlations
    correls <- list()
    
    for (i in 1:nrow(df_thresh)) {
      #naming has to be corrected to add some 0's in front of ID #
      if (df_thresh$id[[i]] < 10) {
        currCSV <- paste0("00",df_thresh$id[[i]],".csv")
      } else if (df_thresh$id[[i]] < 100) {
        currCSV <- paste0("0",df_thresh$id[[i]],".csv")
      } else {
        currCSV <- paste0(df_thresh$id[[i]],".csv")
      }
      
      #open data, calculate correlation and add it to correls list
      currData <- read.csv(paste0("./",directory,"/",currCSV))
      correls[[i]] <- cor(currData$sulfate,currData$nitrate,use = "pairwise.complete.obs")
      
    }
    return(unlist(correls))
  }
}
