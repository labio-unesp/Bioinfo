library(ggplot2)
library(dplyr)

df %>% #Dataframe saída do DavidTools
  ggplot(aes(x = Term, y = Count, fill = FDR)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  xlab("Termos") + #Labels
  ylab("Percentagem de genes (%)") + #Labels
  scale_fill_gradient(low="red", high="purple") + #Escolher cores
  theme_bw()
  
