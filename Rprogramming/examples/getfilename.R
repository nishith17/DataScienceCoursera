getfilename <- function(directory,ID=1:132) {
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
  return(filename)
}
