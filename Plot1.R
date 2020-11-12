#Se abre el archivo y se asigna a un objeto de R. Se nombra cada una de sus columnas
SetDatos <- read.table("C:/Users/One/Desktop/Coursera/Curso 4/household_power_consumption.txt",skip=1,sep=";")
names(SetDatos) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3")
SetDatos2 <- mutate(SetDatos,Global_active_power=as.numeric(as.character(Global_active_power)))
SetDatos3 <- mutate(SetDatos2,Global_active_power=as.numeric(Global_active_power))


#Se seleccionan las fechas 2007-02-01 y 2007-02-02
SetDatos3 <- SetDatos3[SetDatos3$Date %in% c("1/2/2007", "2/2/2007"),]


#Se grafican los datos en Plot1
Plot1 <- hist(SetDatos3$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="Plot1.png", width=480, height=480)
dev.off()
