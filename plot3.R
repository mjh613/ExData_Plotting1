dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
datetime <- paste(dat$Date,dat$Time)
dat$DateTimefixed <- strptime(x=datetime,format="%d/%m/%Y %H:%M:%S")
png("plot3.png",width=480,height=480)
plot(dat$DateTimefixed,dat$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(x=dat$DateTimefixed,y=dat$Sub_metering_1,col="black")
lines(x=dat$DateTimefixed,y=dat$Sub_metering_2,col="red")
lines(x=dat$DateTimefixed,y=dat$Sub_metering_3,col="blue")
legend("topright",lty="solid",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()