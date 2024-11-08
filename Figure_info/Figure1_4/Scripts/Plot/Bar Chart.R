library(ggplot2)
library(ggthemes)
library(reshape2)
df <- read.delim("new_know.xls",header = T)

df <- melt(df)


p <- ggplot(df,aes(x=variable,y=value,fill=a))+
  geom_bar(stat="identity",position="fill",width = 0.5)+
  theme_classic()+
  scale_fill_manual(values = c("#F4B183","#8FAADC"))+
  coord_flip()+
  ylab("")+
  xlab("")+
  theme(axis.text = element_text(size = 20))+
  scale_y_continuous (expand = c (0, 0))



