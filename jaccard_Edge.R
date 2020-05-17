jaccard_Edge <- function(g1,g2){
  eA <- as_edgelist(g1)
  eB <- as_edgelist(g2)
  
  eA <- eA %>%
    as_tibble() %>%
    mutate(EDGE = paste(V1,V2,sep = "_"))
  
  eB <- eB %>%
    as_tibble() %>%
    mutate(EDGE = paste(V1,V2,sep = "_"))
  
  
  jE <- length(intersect(eA$EDGE,eB$EDGE))/length(union(eA$EDGE,eB$EDGE))
  return(jE)
}
