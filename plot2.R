plot2<-function() {
  
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
  
  # create the plot axes and labels
  plot(power_subset$time_code,power_subset$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
  
  #plot the line
  lines(power_subset$time_code,power_subset$Global_active_power)
  
  # copy the active graphics device to a png
  dev.copy(png,'plot2.png')
  dev.off()
  
}