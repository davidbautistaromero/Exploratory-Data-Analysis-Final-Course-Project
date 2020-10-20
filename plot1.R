NEI <- readRDS("summarySCC_PM25.rds")

mean <- tapply(NEI$Emissions, NEI$year, mean)

png("plot1.png")
barplot(mean, xlab="Year", ylab="Emissions",
     main="Average of emissions 1999, 2002, 2005, 2008")
dev.off()