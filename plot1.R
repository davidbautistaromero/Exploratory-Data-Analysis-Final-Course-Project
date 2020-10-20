NEI <- readRDS("summarySCC_PM25.rds")

mean <- tapply(NEI$Emissions, NEI$year, mean)

png("plot1.png")
plot(names(mean), mean, type = "l", xlab="Year", ylab="emissions",
     main="Mean of emissions 1999, 2002, 2005, 2008")
dev.off()