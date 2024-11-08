library(ggplot2)
library(patchwork)
library(scales)
library(reshape2)

#Figure4E
rich <- read.table('domestication_enrichment_all_state.xls',header = T,sep='\t')




rich$state <- factor(rich$state, levels = unique(rich$state))
rich$erichment <- round(rich$erichment,2)
richs <- ggplot(rich, aes(state,erichment))

color_lines <- readLines("color.txt")
color_values <- unlist(strsplit(color_lines, "\n"))


c <- richs+geom_bar(stat = 'identity',aes(fill=state), width = 0.7)+
  theme(legend.position = "none")+
  ylab("Enrichment")+ xlab("")+
  scale_fill_manual(values = color_values)+
  theme(panel.background = element_rect(fill = "white"),
        axis.text.y = element_text(face = "bold", size = 12),
        axis.text.x = element_text(face = "bold", size = 12),
        axis.line = element_line(color = "black", size = 1),
        axis.title.y = element_text(size = 12,      
                                    face = "bold",
                                    hjust = 0.5))+
  geom_text(aes(label = erichment), vjust = -0.5,fontface = "bold")+
  geom_hline(yintercept = 1, linetype = "dashed", color = "red", size = 1.5)+ 
  coord_cartesian(ylim = c(0, 3))+
  scale_y_continuous(expand = c(0, 0))
c

#Figure4F
tsr <- read.delim('domestication_enrichment_all_tissues.xls',header = T,sep='\t')


tsr$E1 <- round(tsr$TssA, 2)
tsr$E3 <- round(tsr$EnhA, 2)


tsr$tissue <- factor(tsr$tissue, levels = rev(unique(tsr$tissue)))


pro <- ggplot(tsr, aes(tissue,E1))
enh <- ggplot(tsr, aes(tissue,E3))


color_lines <- scan("colorfan.txt",what="chracter")

a <- pro+geom_bar(stat = 'identity',aes(fill= tissue), width = 0.7)+
  theme(legend.position = "none")+
  ylab("TssA Enrichment")+ xlab("")+
  scale_fill_manual(values = color_lines)+
  theme(panel.background = element_rect(fill = "white"),
        axis.text.y = element_text(face = "bold", size = 12),
        axis.text.x = element_text(face = "bold", size = 12),
        axis.line = element_line(color = "black", size = 1),
        axis.title.x = element_text(size = 12,      
                                    face = "bold",
                                    hjust = 0.5))+
  scale_y_continuous(expand = c(0, 0))+
  geom_hline(yintercept = 1, linetype = "dashed", color = "red", size = 1.5)+
  coord_cartesian(ylim = c(0, 3))+ coord_flip()



b <- enh+geom_bar(stat = 'identity',aes(fill= tissue), width = 0.7)+
  theme(legend.position = "none")+
  ylab("EnhA Enrichment")+ xlab("")+
  scale_fill_manual(values = color_lines)+
  theme(panel.background = element_rect(fill = "white"),
        axis.text.y = element_text(face = "bold", size = 12),
        axis.text.x = element_text(face = "bold", size = 12),
        axis.line = element_line(color = "black", size = 1),
        axis.title.x = element_text(size = 12,     
                                    face = "bold",
                                    hjust = 0.5))+
  scale_y_continuous(expand = c(0, 0))+
  geom_hline(yintercept = 1, linetype = "dashed", color = "red", size = 1.5)+
  coord_cartesian(xlim = c(0, 3))+
  coord_flip()

a/b





#Figure4G
df <- read.delim("domestication_enrichment_TssA.xls")

colnames(df)[2:4] <- c("native.import","wild.native","wild.import")

df2 <- melt(df)
df2$tissue <- factor(df2$tissue, levels = unique(df2$tissue))

df2$value <- round(df2$value,2)
color_lines <- scan("colorfan.txt",what="chracter")

a <- ggplot(df2,aes(tissue,value))+
  geom_bar(stat = 'identity',aes(fill= variable), width = 0.7, position = "dodge")+
  scale_fill_manual(values = rev(color_lines[6:9]))+
  ylab("TssA Enrichment")+ xlab("")+
  theme(panel.background = element_rect(fill = "white"),
        axis.text.y = element_text( size = 12),
        axis.text.x = element_text( size = 12),
        axis.line = element_line(color = "black", size = 0.5),
        axis.title.x = element_text(size = 12,      
                                    face = "bold",
                                    hjust = 0.5),
        legend.text = element_text(size = 12))+
  scale_y_continuous(expand = c(0, 0))+
  geom_hline(yintercept = 1, linetype = "dashed", color = "red", size = 1)

a



df <- read.delim("domestication_enrichment_EnhA.xls")

colnames(df)[2:4] <- c("native.import","wild.native","wild.import")

df2 <- melt(df)
df2$tissue <- factor(df2$tissue, levels = unique(df2$tissue))

df2$value <- round(df2$value,2)

b <- ggplot(df2,aes(tissue,value))+
  geom_bar(stat = 'identity',aes(fill= variable), width = 0.7, position = "dodge")+
  scale_fill_manual(values = rev(color_lines[6:9]))+
  ylab("EnhA Enrichment")+ xlab("")+
  theme(panel.background = element_rect(fill = "white"),
        axis.text.y = element_text( size = 12),
        axis.text.x = element_text( size = 12),
        axis.line = element_line(color = "black", size = 0.5),
        axis.title.x = element_text(size = 12,    
                                    face = "bold",
                                    hjust = 0.5),
        legend.text = element_text(size = 12))+
  scale_y_continuous(expand = c(0, 0))+
  geom_hline(yintercept = 1, linetype = "dashed", color = "red", size = 1)


b

a/b















