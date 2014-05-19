complete <- function(directory, id=1:332) {
  allFiles <- list.files(path=paste0("./",directory),pattern="*.csv")
  
  ids <- lapply(id,function(x) allFiles[[x]])
  nobs <- lapply(id, function(x) sum(complete.cases(read.csv(paste0("./",directory,"/",allFiles[[x]])))))
  df_complete <- data.frame(id=unlist(id),nobs=unlist(nobs))
  return(df_complete)
  
}