library(tidyverse)

#Enrichment_muscle


enrich <- read.delim("Enrichment_muscle.xls")

enrich$state <- factor(enrich$state,levels = rev(unique(enrich$state)))

mycol<-c("#219EBC", "#90C9E7", "#E66F51", "#F3A261", "#4EAB90", "#E5E5E5")


ggplot(data=enrich,aes(x= state,y=enrichment,color =state))+
  geom_boxplot(size = 0.8, width = 0.8, alpha = 0)+
  geom_point(data = subset(enrich4, tissue == "Muscle"), aes(x = state, y = enrichment),color = "red",size= 5)+
  theme_classic()+
  scale_color_manual(values = rev(mycol))+
  coord_flip()+
  geom_hline(yintercept = 1, linetype = "dashed",color = "blue",size= 1)+
  xlab("")+ylab("Enrichment fold")+
  theme(axis.text = element_text(size = 20),
        axis.title = element_text(size = 20),
        legend.text = element_text(size = 20),
        legend.title = element_text(size = 20)
  )





#Enrichment_TssA_EnhA


enrich4 <- read.delim("Enrichment_TssA_EnhA.xls")

enrich4$state <- factor(enrich4$state,levels = unique(enrich4$state))
mycol<-c("#219EBC",  "#E66F51")

options(repr.plot.width = 7, repr.plot.height = 4)
ggplot(data=enrich4,aes(x= tissuegene,y=enrichment))+
  geom_boxplot(aes(color = state),position = position_dodge(1),size = 0.8, width = 0.8, alpha = 0)+
  geom_dotplot(data = subset(enrich4, tissuegene == "Cartilage" & tissue == "Cartilage"),
               aes(fill = state, color = state),binaxis='y', stackdir='center', dotsize = 1,position = position_dodge(1))+
  geom_dotplot(data = subset(enrich4, tissuegene == "Cecum" & tissue == "Cecum"),
               aes(fill = state, color = state),binaxis='y', stackdir='center', dotsize = 1,position = position_dodge(1))+
  geom_dotplot(data = subset(enrich4, tissuegene == "Hypophysis" & tissue == "Hypophysis"),
               aes(fill = state, color = state),binaxis='y', stackdir='center', dotsize = 1,position = position_dodge(1))+
  geom_dotplot(data = subset(enrich4, tissuegene == "Hypothalamus" & tissue == "Hypothalamus"),
               aes(fill = state, color = state),binaxis='y', stackdir='center', dotsize = 1,position = position_dodge(1))+
  geom_dotplot(data = subset(enrich4, tissuegene == "Liver" & tissue == "Liver"),
               aes(fill = state, color = state),binaxis='y', stackdir='center', dotsize = 1,position = position_dodge(1))+
  geom_dotplot(data = subset(enrich4, tissuegene == "Muscle" & tissue == "Muscle"),
               aes(fill = state, color = state),binaxis='y', stackdir='center', dotsize = 1,position = position_dodge(1))+
  geom_dotplot(data = subset(enrich4, tissuegene == "Rumen" & tissue == "Rumen"),
               aes(fill = state, color = state),binaxis='y', stackdir='center', dotsize = 1,position = position_dodge(1))+
  geom_dotplot(data = subset(enrich4, tissuegene == "Spleen" & tissue == "Spleen"),
               aes(fill = state, color = state),binaxis='y', stackdir='center', dotsize = 1,position = position_dodge(1))+
  geom_dotplot(data = subset(enrich4, tissuegene == "Tailfat" & tissue == "Tailfat"),
               aes(fill = state, color = state),binaxis='y', stackdir='center', dotsize = 1,position = position_dodge(1))+
  scale_color_manual(values = mycol)+
  scale_fill_manual(values = mycol)+
  theme_classic()+
  coord_flip()+
  geom_hline(yintercept = 1, linetype = "dashed",color = "blue",size= 1)+
  xlab("")+ylab("Enrichment fold")+
  theme(axis.text = element_text(size = 20),
        axis.title = element_text(size = 20),
        legend.text = element_text(size = 20),
        legend.title = element_text(size = 20)
  )



