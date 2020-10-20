NEI <- readRDS("summarySCC_PM25.rds")
baltimore <- subset(NEI, fips=="24510") 

mean <- tapply(baltimore$Emissions, baltimore$year, mean)

png("plot2.png")
barplot(mean, xlab="Year", ylab="Emissions",
        main="Average of emissions in Baltimore City 1999, 2002, 2005, 2008")
dev.off()