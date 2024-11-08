library(magrittr)
library(dplyr)
library(tidyverse)
library(corrplot)
library(pheatmap)

data <- read.table("list_ni.txt", header = FALSE, sep = "\t")
sampleList <- as.character(data$V1)

reprod = c()
fragCount = NULL
for(hist in sampleList){
  
  if(is.null(fragCount)){
    
    fragCount = read.table(paste0(hist, ".bin500.bed"), header = FALSE) 
    colnames(fragCount) = c("chrom", "bin", hist)
    
  }else{
    
    fragCountTmp = read.table(paste0(hist, ".bin500.bed"), header = FALSE)
    colnames(fragCountTmp) = c("chrom", "bin", hist)
    fragCount = full_join(fragCount, fragCountTmp, by = c("chrom", "bin"))
    
  }
}
M = cor(fragCount %>% select(-c("chrom", "bin")) %>% log2(), use = "complete.obs")

M <- as.matrix(M)

annotation_col<-read.table("group_ni.txt",header=T,sep="\t",row.names=1)
annotation_col <- as.data.frame(annotation_col)
annotation_row <- annotation_col

options(repr.plot.width = 5, repr.plot.height = 6)
a <- pheatmap(M, color = colorRampPalette(c("navy", "white", "firebrick3"))(100), 
              border_color = NA, fontsize_row = 12, fontsize_col = 12, 
              cluster_rows = T, cluster_cols = T, 
              show_rownames = FALSE, show_colnames = FALSE, annotation_row = annotation_row,cellwidth = 3, cellheight =3, na_col="white")


















