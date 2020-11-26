#Построить графики зависимости V5, V6, V7, V8 от V1.

require(ggplot2)

as <- read.csv(file = "as.csv", header = TRUE)

ggplot(data = as, aes(x = V1, y = V5)) + 
  geom_line() 
ggplot(data = as, aes(x = V1, y = V6)) + 
  geom_line(color = "2") 
ggplot(data = as, aes(x = V1, y = V7)) + 
  geom_line(color = "3") 
ggplot(data = as, aes(x = V1, y = V8)) + 
  geom_line(color = "4") 