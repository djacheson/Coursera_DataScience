setwd("D:\\Classes\\Coursera Data Science\\R Programming\\Assignment1")

#Part 1
#Function to open specific id files in a directory, and report mean of 
#the pollutant, removing NA values
pollutantmean <- function(directory, pollutant, id=1:332) {
  #for loop to make dataframe with all csv files
  for (currID in 1:length(id)) {
    #Create a string wit the filepath and full filename
    #Based on naming, need to put some extra 0's in from of id # 
    if (id[currID] < 10) {
      filePath <- paste0("./",directory,"/00",id[[currID]],".csv")
    } else if (id[currID] < 100) {
      filePath <- paste0("./",directory,"/0",id[[currID]],".csv")
    } else {
      filePath <- paste0("./",directory,"/",id[[currID]],".csv")
    }
    #Read in the current ID
    currData <- read.csv(filePath)
    
    #If it's the first time, through the loop, make new dataframe called allData
    if (currID == 1) {
      allData <- currData
    } else {
      #else bind the current with the fomer
      allData <- rbind(allData,currData)
    }
  }
  
  #return the mean of the given pollutant, removing NA
  return(mean(as.numeric(allData[[pollutant]]),na.rm=T))
  
}

#Part 2
#Open all files in a directory, and create dataframe with complete cases in each

complete <- function(directory, id=1:332) {
  allFiles <- list.files(path=paste0("./",directory),pattern="*.csv")
  
  ids <- lapply(id,function(x) allFiles[[x]])
  nobs <- lapply(id, function(x) sum(complete.cases(read.csv(paste0("./",directory,"/",allFiles[[x]])))))
  df_complete <- data.frame(id=unlist(id),nobs=unlist(nobs))
  return(df_complete)
  
}


#part 3
#Compute correlation between sulfate and nitrate for all files where
#number of observations exceeds a threshold
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

