NEI <- readRDS("summarySCC_PM25.rds")

png("plot1.png")
with(NEI, plot(year, Emissions, pch = 19, col=year, 
               xlab="Year", ylab = "Emissions"))
dev.off()