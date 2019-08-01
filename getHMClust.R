library(ComplexHeatmap)
library(circlize)


HM_clusters <- Heatmap(matrix = mat)
draw(HM_clusters)

L1 <- row_order(HM_clusters)  #Extract clusters (output is a list)

getHMClust <- function(L1, mat){
  df3 <- NULL
  for(i in 1:length(L1)){
    df1 <- NULL
    tab <- NULL
    for(j in 1:length(L1[[i]])){
      tab <- rownames(mat)[L1[[i]][j]]
      df1 <- rbind(df1,tab)
    }
    df2 <- data.frame(Gene = df1[,1], Cluster = rep(paste("Cluster",i,sep = ""),nrow(df1)))
    df3 <- rbind(df3,df2)
  }
  return(df3)
}


Cluster <- getHMClust(L1 = rcl.list1,
                      mat = mat1)
Cluster %>%
  group_by(Cluster) %>%
  tally()
