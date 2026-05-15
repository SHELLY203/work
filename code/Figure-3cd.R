library(data.table)
library(ggpointdensity)
library(ggplot2)

library(lessR)
library(treemapify)

test <- fread("../data/terrene_type_importance.csv")
test <- setorder(test, IncNodePurity)
test$var_name[-c(52,59,61)] <- test$var_name[-c(52,59,61)] |>stringr::str_extract("(?<=converted).*")
test$var_name[c(52,59,61)] <- c("latitude","longitude","ai")
test$var_class <- factor(test$var_class,levels = c("Climatic variables",
                                                   "Soil properties",
                                                   "Human activities","Others"))
test <- test[,"group_total":=sum(`IncNodePurity`),by = c("var_class")]
test$group_per <- test$group_total/sum(test$`IncNodePurity`)

test1 <- test[,c(4,6)]|>unique()
test2 <- test1$group_per
names(test2) <- test1$var_class
test1$label <- paste0(test1$group_per|>round(3)*100,"%")

test$label <- paste(test$var_class," (",test$group_per|>round(3)*100,"%",")",sep = "")
p3_3<- ggplot(test, aes(area = IncNodePurity, fill = var_class,label = var_name,
                    subgroup = label)) +
  geom_treemap(alpha = 0.8) +
  geom_treemap_subgroup_border(colour = "white",size = 5) +
  geom_treemap_subgroup_text(place = "top",size = 4,
                             alpha = 1, colour = "black", reflow = T) +
  
  geom_treemap_text(colour = "white",
                    place = "centre",
                    size = 3,
                    min.size = 1,
                    grow = FALSE,
                    reflow = T) +
  scale_fill_manual(values = c("#42a5f5","#ffa726","#d95b70","grey60"))+
  theme_bw(base_size = 6,base_line_size = 0.5, base_rect_size = 0.5)+
  theme(legend.position = "none",
        plot.tag = element_text(size = 10,face = "bold"))

test_top30 <- test[order(test$IncNodePurity, decreasing = TRUE), ] 
test_top30 <- test_top30[test_top30$var_class!= "Others",]
test_top30 <- test_top30[c(1:30),]

annotation <- readxl::read_xlsx("../data/Supplementary Dataset 5.xlsx")
annotation <- as.data.table(annotation[,c(1:3)])

colnames(annotation)[2] <- "var_name"
test_top30 <- annotation[test_top30,on =c("var_name"),]
test_top30$`Variable names` <- paste("[",test_top30$var_name,"] ",test_top30$`Variable names`,sep = "")



p3_4 = ggplot(test_top30, 
              aes(x = reorder(`Variable names`,IncNodePurity),
                  y = IncNodePurity,fill = var_class,color = var_class)) +
  geom_segment(aes(x = reorder(`Variable names`,IncNodePurity), y = 0, yend = IncNodePurity))+ 
  geom_point(size = 3/.pt, pch = 21,color = "white")+ 
  scale_fill_manual(values = c("#42a5f5","#ffa726","#d95b70","grey60"))+
  scale_color_manual(values = c("#42a5f5","#ffa726","#d95b70","grey60"))+
  coord_flip()+
  scale_x_discrete(position ="top")+
  scale_y_reverse(expand = c(0,0),limits = c(0.81,0))+
  labs(y = "Importance (IncNodePurity)")+
  theme_bw(base_size = 6,base_line_size = 0.5, base_rect_size = 0.5)+
  theme(panel.grid=element_blank(),
        panel.background = element_blank(),
        axis.title.y = element_blank(),
        legend.position = "none"
  )

require(patchwork)


p3_all_2 <- p3_3+p3_4+
  plot_annotation(tag_levels = list(c("c","d")))&
  theme(plot.tag = element_text(size = 10,face = "bold"))
p3_all_2

ggsave(p3_all_2,file="../results/Figure_3_cd.pdf",width = 180,height = 60,units = "mm")
ggsave(p3_all_2,file="../results/Figure_3_cd.tif",width = 180,height = 60,units = "mm", dpi = 600)

print(p2a)




