setwd("/Users/GeniusTang/Desktop")

d2 <- read.table('d2', header=TRUE, sep=',')

d2shepp <- read.table('d2shepp', header=TRUE, sep=',')

d2star <- read.table('d2star', header=TRUE, sep=',')

plot_colors <- c("blue", "red", "forestgreen")

pdf("k3_11.pdf")
par(mfrow=c(3,3))
for(i in 3:11){
  plot(x=d2[, 1], y=d2[, (i-1)], type='o', xlab='dissimilarity', ylab='d2value',
       col=plot_colors[1], ylim=c(0,1),xlim=c(0,1), main=paste('k', as.character(i)))
  lines(x=d2shepp[, 1], y=d2shepp[, (i-1)], type='o', col=plot_colors[2], 
        pch=22, lty=2)
  lines(x=d2star[, 1], y=d2star[, (i-1)], type='o', col=plot_colors[3],
        pch=23, lty=3)
  legend("bottomright", c('d2', 'd2shepp', 'd2star'), cex=0.6, col=plot_colors, 
         pch=21:23, lty=1:3, bty='n')
}
dev.off()

pdf("k3_11_2.pdf")
par(mfrow=c(3,3))
for(i in 2:21){
  plot(x=c(3:11), y=d2[i, 2:10], type='o', xlab='k', ylab='d2value', col=plot_colors[1], 
       xlim=c(3,11), ylim=c(0,1), main=paste('dissimilarity=', as.character(d2[i,1])))
  lines(x=c(3:11), y=d2shepp[i, 2:10], type='o', col=plot_colors[2], 
        pch=22, lty=2)
  lines(x=c(3:11), y=d2star[i, 2:10], type='o', col=plot_colors[3],
        pch=23, lty=3)
  abline(a=d2[i,1], b=0)
  legend("bottomright", c('d2', 'd2shepp', 'd2star'), cex=0.6, col=plot_colors, 
         pch=21:23, lty=1:3, bty='n')
}
dev.off()