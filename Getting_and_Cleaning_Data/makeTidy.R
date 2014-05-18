
makeTidy <- function(data) {
  #Function to create a tidy data set using data.table package
  require(data.table)
  data <- data.table(data)
  tidy <- data[, lapply(.SD,mean), by="subject,Activity_Label"]
  return(tidy)
}