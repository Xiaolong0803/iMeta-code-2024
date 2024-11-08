
library(ggplot2)
library(ggthemes)
library(reshape2)
df <- read.delim("TssA_conserve.xls",header = T)

df <- melt(df)

df$a <- factor(df$a, levels = rev(c("high","low","sing")))

ggplot(df,aes(x=variable,y=value,fill=a))+
  geom_bar(stat="identity",position="fill",width = 0.6)+
  theme_classic()+
  scale_fill_manual(values = rev(c("#599AD5","#9DC3E6","#BDD7EE")))+
  coord_flip()+
  ylab("")+
  xlab("")+
  theme(axis.text = element_text(size = 20))+
  scale_y_continuous (expand = c (0, 0))



df <- read.delim("EnhA_conserve.xls",header = T)

df <- melt(df)

df$a <- factor(df$a, levels = rev(c("high","low","sing")))

ggplot(df,aes(x=variable,y=value,fill=a))+
  geom_bar(stat="identity",position="fill",width = 0.6)+
  theme_classic()+
  scale_fill_manual(values = rev(c("#FF8585","#FBA89F","#FDD6D3")))+
  coord_flip()+
  ylab("")+
  xlab("")+
  theme(axis.text = element_text(size = 20))+
  scale_y_continuous (expand = c (0, 0))

















