complete <- function(directory,ID=1:332) {
  setdir <- paste(getwd(),"/",directory,"/",sep="")
  filename = ID
  nobs = ID
  for(i in 1:length(filename)){
    filename[i] <- if(nchar(ID[i]) == 1) {
      paste(setdir,"00",ID[i],".csv", sep="")
    } else if(nchar(ID[i]) == 2) {
      paste(setdir,"0",ID[i],".csv", sep="")
    } else {
      paste(setdir,ID[i],".csv", sep="")
    } 
    dataset <- read.csv(filename[i])
    dataset_xNA <- na.omit(dataset) #remove all NA values
    nobs[i] <- nrow(dataset_xNA)
    rm(dataset)
    rm(dataset_xNA)
  }
  result <- data.frame(ID = ID, nobs = nobs)
  return(result)
  #return(cbind(ID,nobs))
}
