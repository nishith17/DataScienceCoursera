pollutantmean <- function(directory,pollutant,ID=1:332) {
  setdir <- paste(getwd(),"/",directory,"/",sep="")
  filename = ID
  for(i in 1:length(filename)){
   filename[i] <- if(nchar(ID[i]) == 1) {
               paste(setdir,"00",ID[i],".csv", sep="")
             } else if(nchar(ID[i]) == 2) {
               paste(setdir,"0",ID[i],".csv", sep="")
             } else {
               paste(setdir,ID[i],".csv", sep="")
             } 
  temp_data <- read.csv(filename[i])
  if (exists("dataset")){
  dataset <- rbind(dataset, temp_data)}
  else {dataset <- temp_data}
  rm(temp_data)
  }
  
  dataset_xNA <- na.omit(dataset) #remove all NA values
  
  # check polluant value
  headers <- names(dataset_xNA)
  check <- if(pollutant %in% headers) {1} else {warning('Check Polluant')}
  
  # Find Mean
  Mean_Value <- mean(dataset_xNA[,pollutant])
  return(Mean_Value)
}
