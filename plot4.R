household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";")
df=household_power_consumption
df$datetime<- paste(df$Date,df$Time)
df$datetime= dmy_hms(df$datetime)
df$Date= dmy(df$Date)
df1= df %>% filter(Date == "2007-02-01" )
df2= df %>% filter(Date == "2007-02-02" )
df= full_join(df1, df2)

png(file="plot4.png",width=480, height=480)

par(mfrow=c(2,2))

plot (df$datetime, as.numeric(as.character(df$Global_active_power)), type="l", ylab = ("Global Active Power (kilowatts)"), xlab= ("") )

df$Voltage= as.numeric(as.character(df$Voltage))
plot (df$datetime, df$Voltage, type="l", ylab = (" Voltage"), xlab= ("datetime") )

plot (df$datetime, df$Sub_metering_1, type="l", ylab = ("Energy sub metering"), xlab= ("") )
lines(df$datetime, df$Sub_metering_2, col= "red")
lines(df$datetime, df$Sub_metering_3, col= "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), cex= 0.5)

plot (df$datetime, (df$Global_reactive_power), type="l", ylab = ("Global Reactive Power"), xlab= ("datetime"))
df$Global_reactive_power= as.numeric(as.character(df$Global_reactive_power))
dev.cur()
dev.off()