args <- commandArgs(trailing=TRUE)
library(tools)
###

library(seqplots)
features<-c(args[1])
tracks<-c(args[2],args[3])
a<-getPlotSetArray(refgenome="sacCer3",rm0 = F,ignore_strand = F,add_heatmap = F,
                        tracks=tracks,
                        features=features,
                        bin=5000,
                        type="mf",
                        xmin=100000, xmax=100000)

cv = c(args[4], args[5])
out = args[6]

pdf(paste0(out, ".pdf")) 
plotAverage(a, plotScale="log2", legend = FALSE, colvec=cv, ylim=range(1,8), ln.v = FALSE, xlab="", ylab="" )
dev.off()

png(paste0(out,".png")) 
plotAverage(a, plotScale="log2", colvec=cv, ylim=range(1,8), ln.v = FALSE)
dev.off()
