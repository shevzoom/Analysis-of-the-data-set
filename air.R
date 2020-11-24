require(ggplot2)
require(dplyr)

aq <- data.frame(airquality)

aq3 <- filter(aq, !is.na(Solar.R), !is.na(Ozone))
aq2 <- mutate(aq3,
       st = Solar.R / Temp)

colnames(aq2)
head(aq2)

# Распределение Озона.
aq$Month <- factor(aq$Month, levels=5:9, labels=month.abb[5:9], ordered=TRUE)
summary(aq2)
aq2$Ozone.sqrt <- sqrt(aq2$Ozone)
ggplot(data=aq2) + geom_histogram(mapping=aes(Ozone.sqrt))

# Влияние новой переменной на Озон.
aq2.st <- lm(aq2$st ~ aq2$Ozone)
summary(aq2.st)
confint(aq2.st)
plot(aq2$Ozone, aq2$st)
lines(aq2$Ozone, predict(aq2.st), col='red')

# Проверка модели.
shapiro.test(aq2$st)

# Взаимосвязь.
cor(aq2$Ozone, aq2$st)
cor.test(aq2$Ozone, aq2$st)
cor.l <- cor(aq2$Ozone, aq2$st)

ggplot(aq2, aes(x = (Month * 100 + Day), y = Ozone)) + geom_line() + geom_point()
aq2$date <- as.Date(paste("1973", aq2$Month, aq2$Day, sep="-"))
ggplot(aq2, aes(x= date, y = Ozone)) + geom_line(color = "green") + geom_point()

aq2 <- subset(aq2, select = c(-Month, -Day, -date))
pairs(aq2, panel = panel.smooth, main = "Соотношения воздуха")


