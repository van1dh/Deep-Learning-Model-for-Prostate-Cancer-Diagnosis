library("pheatmap")

library("RColorBrewer")


data<-read.table(file='heatmap_test.csv',header=TRUE,row.names= 1,sep=',')
head(data)
pheatmap(data, color = colorRampPalette(c("navy","white","firebrick3"))(100), scale='row') 

