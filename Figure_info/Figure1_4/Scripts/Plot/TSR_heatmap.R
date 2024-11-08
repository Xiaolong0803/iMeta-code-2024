library(ComplexHeatmap)
library(circlize)

mat=read.table("TSR_gene_heatmap.xls",header=TRUE,row.names=1,sep="\t",check.names = F)

A <- as.matrix(mat)

for (i in 1:nrow(A)) A[i, ] <- scale(log(unlist(A[i, ] + 1), 2))

B <- Heatmap(A, name = "gene", col = colorRampPalette(c("#FFFFFF","#F6EEEE", "#C48C8C", "#8B1A1A"))(5),
             show_row_names = F, show_column_names = F, cluster_columns = F, cluster_rows = F, top_annotation = ha1, 
             border = T,  left_annotation = topanno)



go <- read.table("GO_heatmap.xls",header = T)


A <- as.matrix(go)
for (i in 1:nrow(A)) A[i, ] <- scale(log(unlist(A[i, ] + 1), 2))
A <- t(A)

B <- Heatmap(A, name = "gene", col = colorRampPalette(c("#FFFFFF","#DEDEF0", "#ADACD9", "#120D90"))(100),
             show_row_names = T, show_column_names = F, cluster_columns = F, cluster_rows = F, 
             border = T)