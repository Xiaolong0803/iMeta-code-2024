library(tidyverse)
library(ggplot2)
library(ggpubr)
library(reshape2)
library(ggthemes)

A <- read.delim("Chromatin_state_variability.xls")

mycol<-c("#219EBC", "#90C9E7", "#E66F51", "#F3A261", "#4EAB90", "#E5E5E5")

p<-ggplot(data = A) +
  geom_smooth(aes(x = Tissues, y = E1, color = "E1"), size = 1.5, method = "loess", se = FALSE) +
  geom_smooth(aes(x = Tissues, y = E2, color = "E2"), size = 1.5, method = "loess", se = FALSE) +
  geom_smooth(aes(x = Tissues, y = E3, color = "E3"), size = 1.5, method = "loess", se = FALSE) +
  geom_smooth(aes(x = Tissues, y = E4, color = "E4"), size = 1.5, method = "loess", se = FALSE) +
  geom_smooth(aes(x = Tissues, y = E5, color = "E5"), size = 1.5, method = "loess", se = FALSE) +
  geom_smooth(aes(x = Tissues, y = E6, color = "E6"), size = 1.5, method = "loess", se = FALSE) +
  scale_color_manual(values = mycol) +
  geom_hline(yintercept = 0.75, linetype = "dashed") +
  theme_bw() +
  theme(
    legend.title = element_blank(),
    axis.title = element_text(face = 'bold', size = 13),
    axis.text.x = element_text(face = "bold", size = 13),
    axis.text.y = element_text(face = "bold", size = 13)
  ) +
  labs(x = "Number of tissues (n)", y = "Cumulative genome coverage")+
  scale_x_continuous(breaks = seq(0, 9, by = 1))