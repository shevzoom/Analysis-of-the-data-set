#Переменная V1 - время, V3 - координаты точек (вспомогательная переменная V2 - порядковый номер точки).
#1) написать функцию, которая для заданного момента времени выводит зависимости переменных, начиная с V4, от x (V3)
# или
#2)Второй вариант: для заданного значения x (или, проще, V2 - порядкового номера точки) вывести зависимости переменных V4 и далее от t (V1)

require(ggplot2)
require(dplyr)

bs <- read.csv(file = "bs.csv", header = TRUE)

head(bs)

func <- function(x) {
  var <- bs %>% filter(V3 == x)
  df <- as.data.frame(var)
  
  for(i in 4:9) {
    g <- ggplot(df, aes(df[,1])) +
      geom_line(aes(y = df[,i]), col=rep(i:i, each=1))
    print(g)
  }
}

func(0.1)