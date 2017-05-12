data <- read.csv("US_Surnames.csv")

x <- data$count/1000000

# Uncomment for weird bar graph

# plot(data$pctwhite, x, main="Top 25 US Surnames", xlab="Percentage White", ylab="Total Count (million)", ylim=c(0,2.5), pch=".")
# text(data$pctwhite, x, labels=labels, cex=0.3)

# par(mai=c(2,1,1,1))
# barplot(data$count/1000000, main="Top 25 US Surnames", xlab="", ylab="Total Count (million)", ylim=c(0,2.5), names.arg=labels, las=2, cex.names=0.8)
# mtext("Surnames", side=1, line=6, las=1)

# par(new=TRUE)
# plot(data$pctwhite, col="red", pch=0, ylab="", xlab="", axes=FALSE, ylim=c(0,100))
# axis(4)
# box()
# legend("topright", c("Percentage White"), col=c("red"), pch=0, cex = 0.7)
# mtext("Percentage White", side = 4, line = 3)


# Bar graph with variable bar width depending on value

par(mar=c(8,5,5,9), xpd=TRUE)

labels <- paste0(toupper(substr(tolower(data$name), 1, 1)), substr(tolower(data$name), 2, nchar(tolower(data$name))))
colors <- c("#bfbfbf","#303030", "#4d88ff", "#734d26", "orange", "#990000")
raceCols <- c("White", "Black", "Asian & Pacific Islander", "American Indian & Alaskan", "Two or More Races", "Hispanic")
races <- c(rbind(data$pctwhite, data$pctblack, data$pctapi, data$pctaian, data$pct2prace, data$pcthispanic))
Values <- matrix(races, nrow=6, ncol=25)

barplot(Values, x, main="Top 25 US Surnames By Race", names.arg=labels[0:25], xlab="", ylab="Percent", col=colors, las=2, border=NA, cex.names=0.7)
legend("topleft", raceCols, cex=0.7, fill=colors, inset=c(1,0))
mtext("Surnames (Left To Right By Total Count)", side=1, line=6, las=1)