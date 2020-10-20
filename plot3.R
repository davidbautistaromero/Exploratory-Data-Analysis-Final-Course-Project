NEI <- readRDS("summarySCC_PM25.rds")
baltimore <- subset(NEI, fips=="24510")


library(Rmisc)
mean <- summarySE(baltimore, measurevar="Emissions", 
                  groupvars=c("type", "year"))

library(ggplot2)

png("plot3.png")
g <- ggplot(mean, aes(x=year, y=Emissions, colour=type), xlab="Year")
g + geom_point() + theme_bw() + geom_line()
dev.off()