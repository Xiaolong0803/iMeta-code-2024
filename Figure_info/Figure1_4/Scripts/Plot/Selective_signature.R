library(tidyverse)

fst <- function(a,b) {
  fstname <- paste0(a,"_fst.xls")
  qpname <- paste0(a,"_θπ.xls")
  xpehhname <- paste0(a,"_xpehh.xls")
  
  fst <- read.delim(fstname,header = F)
  colnames(fst) <- c("section","fst","Chr","BIN_START","BIN_END","N_VARIANTS_fst")
  
  qp <- read.delim(qpname,header = F)
  colnames(qp) <- c("section","qp","Chr","BIN_START","BIN_END","N_VARIANTS1_qp","PI1","N_VARIANTS2_qp","PI2")
  
  xpehh <- read.delim(xpehhname,header = F)
  colnames(xpehh) <- c("section","xpehh","Chr","BIN_START","BIN_END","N_VARIANTS_xpehh")
  
  
  qptop <- quantile(qp$qp, 0.95)
  fsttop <- quantile(fst$fst, 0.95)
  xpehhtop <- quantile(xpehh$xpehh, 0.95)
  
  
  df <- left_join(xpehh,qp,by = "section")
  df <- left_join(df,fst,by = "section")
  
  df1 <- df %>% filter(complete.cases(.))
  
  df1 <- df1[!(df1$fst >= fsttop & df1$qp >= qptop &df1$xpehh < xpehhtop ),]
  
  ggplot(data = df1) + 
    geom_point(mapping = aes(x = fst, y = qp,color = xpehh))+
    geom_hline(yintercept = qptop, linetype = "dashed", color = "black")+
    geom_vline(xintercept = fsttop, linetype = "dashed", color = "black")+
    scale_color_gradientn(colors = c("#7D58A1", "#F4A5AD", "#E6281E"))+
    labs( 
      x = "FST",  
      y = "QP Ratio",  
      color = "XPEHH",
      title = "re.wild") +
    theme_bw()+
    theme(  
      axis.title.x = element_text(size = 16),  # 调整 x 轴标题字体大小  
      axis.title.y = element_text(size = 16),  # 调整 y 轴标题字体大小  
      legend.title = element_text(size = 16),  # 调整图例标题字体大小  
      legend.text = element_text(size = 16),   
      axis.text.x = element_text(size = 16),
      axis.text.y = element_text(size = 16),
      plot.title = element_text(size = 16)    
    )

  ggsave(paste0(b,".fst.pdf"),width = 6,height = 5) 
}

fst("wild.domestic","wild.domestic")