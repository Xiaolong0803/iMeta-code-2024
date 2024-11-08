library(tidyverse)
library(reshape2)
library(reshape2)
library(tidyverse)
library(ggpubr)
library(rstatix)
library(patchwork)

df <- read.delim("wgbs.xls",header = T,sep = "")

df2 <- df[,c(2:ncol(df))] %>% melt()
mycol<-c("#219EBC", "#90C9E7", "#E66F51", "#F3A261", "#4EAB90", "#E5E5E5")
df2$variable <- factor(df2$variable, levels = rev(unique(df2$variable)))


p <- ggplot(df2, mapping = aes(x = variable, y = value, color = variable))+
  geom_boxplot(bxp.errorbar = TRUE, bxp.errorbar.width = 0.25,
               add.params = list(size=3,alpha=0.5,width=0.5),
               outlier.shape = NA) +
  geom_point(size = 1, alpha = 0.5,position = 'jitter',aes(color = variable))+
  scale_fill_manual(values = rev(mycol))+
  scale_color_manual(values = rev(mycol))+
  theme_light()+theme(legend.title = element_blank(),
                      legend.position = 'none',
                      axis.title = element_text(face = 'bold',size=13),
                      axis.text.x = element_text(face = "bold", size = 13),
                      axis.text.y = element_text(face = "bold", size = 13))+
  ylab("Methy. level %")+xlab("")+
  coord_flip()


























