library(ggplot2)
library(dplyr)

df %>% #Dataframe saída do DavidTools
  ggplot(aes(x = Term, y = Count, fill = FDR)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  theme_bw()
  
