corr  <- function(directory,threshold = 0) {
  setdir <- paste(getwd(),"/",directory,"/",sep="")
  filename <- rep(NA,332)
  for(i in 1:332){
    filename[i] <- if(nchar(i) == 1) {
      paste(setdir,"00",i,".csv", sep="")
    } else if(nchar(i) == 2) {
      paste(setdir,"0",i,".csv", sep="")
    } else {
      paste(setdir,i,".csv", sep="")
    }
  }
  completedata <- complete("specdata",1:332)
  
  result_temp <- rep(NA,332)
  i <- 1
  for (i in 1:332){
    if(completedata[i,2] >= threshold){
      dataset.RN <- completedata[0,]
      dataset <- na.omit(read.csv(filename[i]))
      result_temp[i] <- cor(dataset$sulfate, dataset$nitrate, use = "everything")
      rm(dataset)
      }
  }
    result <- na.omit(result_temp)
    return(result)
}