library(tidyverse)
library(ggplot2)
library(ggpubr)
library(reshape2)
library(ggthemes)

df <- read.delim("pro_enh_number.xls",header = T,sep = "\t")

df1 <- t(df)
colnames(df1) <- df1[1,]
df1 <- df1[-1,]
df1 <- as.data.frame(df1)  %>% rownames_to_column("group")
df1[, 2:10] <- lapply(df1[, 2:10], as.numeric)

p <- ggradar(
  df1, 
  values.radar = c("0", "30000", "60000"),
  grid.min = 0, grid.mid = 30000, grid.max = 60000,
  # Polygons
  group.line.width = 1, 
  group.point.size = 3,
  group.colours = c("#000086","#CA1717"),
  # Background and grid lines
  background.circle.colour = "white",
  gridline.mid.colour = "grey",
  legend.position = "bottom"
)



















