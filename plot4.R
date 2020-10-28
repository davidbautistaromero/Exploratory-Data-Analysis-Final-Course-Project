NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

library(ggplot2)

png("plot4.png")
ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity", fill="navy") +
  theme_bw()+
  labs(x="year", y=expression("Total PM" [2.5]*" Emission (10^5 Tons)"), 
       title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))
dev.off()