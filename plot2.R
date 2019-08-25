household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";")
df=household_power_consumption
df$datetime<- paste(df$Date,df$Time)
df$datetime= dmy_hms(df$datetime)
df$Date= dmy(df$Date)
df1= df %>% filter(Date == "2007-02-01" )
df2= df %>% filter(Date == "2007-02-02" )
df= full_join(df1, df2)

png(file="plot2.png",width=480, height=480)
plot (df$datetime, as.numeric(as.character(df$Global_active_power)), type="l", ylab = ("Global Active Power (kilowatts)"), xlab= ("") )
dev.cur()
dev.off()