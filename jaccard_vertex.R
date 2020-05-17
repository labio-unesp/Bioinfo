jaccard_Vertex <- function(g1,g2){
  vA <- vertex_attr(g1)[[1]]
  vB <- vertex_attr(g2)[[1]]
  
  jV <- length(intersect(vA,vB))/length(union(vA,vB))
  return(jV)
}
