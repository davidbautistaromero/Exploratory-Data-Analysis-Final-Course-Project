NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicleSCC <- SCC[vehicle,]$SCC
vehicleNEI <- NEI[NEI$SCC %in% vehicleSCC,]

baltimoreVehiclesNEI <- vehicleNEI[vehicleNEI$fips=="24510",]

library(ggplot2)

png("plot5.png")
ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity", fill="navy") +
  theme_bw()+
  labs(x="year", y=expression("Total PM" [2.5]*" Emission (10^5 Tons)"))
dev.off()