plot1<-function() {
  
  # Read the data set into R 
  # yes, I know I should subset when reading in to save space, but I am short on time
  #     and that is not explicitly in the instructions, so TBD
  power<-read.delim('household_power_consumption.txt',sep=";", na.strings="?")
  
  # turn the date and time columns into a time code 
  time_code<-strptime(paste(as.character(power$Date),as.character(power$Time),sep=" "),format="%d/%m/%Y %H:%M:%S")
  
  # append the time code to the data set
  power$time_code<-time_code
  
  
  # subset the data frame
  power_subset=power[power$time_code>=strptime("2007/02/01 00:00:00",format="%Y/%m/%d %H:%M:%S") & power$time_code<strptime("2007/02/03 00:00:00",format="%Y/%m/%d %H:%M:%S"),]
  
  # create the histogram with the required labels and bar color
  hist(pow$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
  
  
  # copy the active graphics device to a png
  dev.copy(png,'plot1.png')
  dev.off()
  
}