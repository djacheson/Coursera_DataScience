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
