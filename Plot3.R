#Se abre el archivo y se asigna a un objeto de R. Se nombra cada una de sus columnas
SetDatos <- read.table("C:/Users/One/Desktop/Coursera/Curso 4/household_power_consumption.txt",skip=1,sep=";")
names(SetDatos) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1",
                     "Sub_metering_2",
                     "Sub_metering_3")
SetDatos2 <- mutate(SetDatos, Global_active_power=as.numeric(as.character(Global_active_power)), 
                    Sub_metering_1= as.numeric(as.character(Sub_metering_1)),
                    Sub_metering_2= as.numeric(as.character(Sub_metering_2)),
                    Sub_metering_3= as.numeric(as.character(Sub_metering_3)))
SetDatos3 <- mutate(SetDatos2,Global_active_power=as.numeric(Global_active_power),
                    Sub_metering_1= as.numeric(Sub_metering_1),
                    Sub_metering_2= as.numeric(Sub_metering_2),
                    Sub_metering_3= as.numeric(Sub_metering_3))


#Se seleccionan las fechas 2007-02-01 y 2007-02-02
SetDatos3 <- SetDatos3[SetDatos3$Date %in% c("1/2/2007", "2/2/2007"),]

#Se procede a cambiar los formatos y se separa por ambos días considerados
SetDatos3$Date <- as.Date(SetDatos3$Date, format="%d/%m/%Y")
SetDatos3$Time <- strptime(SetDatos3$Time, format="%H:%M:%S")
SetDatos3[1:1440,"Time"] <- format(SetDatos3[1:1440,"Time"],"2007-02-01 %H:%M:%S")
SetDatos3[1441:2880,"Time"] <- format(SetDatos3[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#Se grafican los datos
plot(SetDatos3$Time, SetDatos3$Sub_metering_1, type="l",xlab="",ylab="Energy Submetering")
lines(SetDatos3$Time, SetDatos3$Sub_metering_2, type="l", col="red")
lines(SetDatos3$Time, SetDatos3$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="Plot3.png", width=480, height=480)
dev.off()