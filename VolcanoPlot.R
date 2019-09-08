library(dplyr)
library(ggplot2)

#Volcano plot
mutateddf <- mutate(data_c,
                    sig=ifelse((data$P.Value < 0.1) & (logFC > 1), "up - regulados", ifelse((data$P.Value < 0.1) & (logFC < -1), "down regulados","Não significantes"))) #Will have different colors depending on significance
input <- cbind(gene=mutateddf$miRNA_ID, mutateddf ) #convert the rownames to a column
volc = ggplot(input, aes(logFC, -log10(P.Value))) + #volcanoplot with log2Foldchange versus pvalue
  geom_point(aes(col=sig)) + #add points colored by significance
  scale_color_manual(values=c("red", "black","green")) + 
  ggtitle("Volcano plot") + #e.g. 'Volcanoplot DESeq2'
  geom_hline(yintercept = 1,linetype="dotted") +
  geom_vline(xintercept = c(-1,1),linetype="dotted") +
  theme_bw()
volc+geom_text_repel(data=head(input, 20), aes(label=gene)) 
ggsave(filename = "Relatorio/Volcanoplot.png",width = 12,height = 7,dpi = 300)
