library(tidyverse)
library(mlogit)
library(nnet)

alien <- read.csv('https://raw.githubusercontent.com/acRnR/Referential-Choice-in-Subordinate-Clauses-in-Native-and-L2-Russian-Speakers/master/data/nonstandgo.csv', sep=';', encoding = 'UTF-8')

str(alien)
names(alien) <- c('status', 'level','conj', 'rd', 'clord', 'choice')

rownames(mydata)
alien$out <- relevel(alien$choice, ref='pr')
mymodel <- multinom(out~status+level+conj+rd+clord, data=alien)
summary(mymodel)

predict(mymodel, alien, type='prob')
cm <- table(predict(mymodel), alien$choice)
print(cm)
1-sum(diag(cm))/sum(cm)


z <- summary(mymodel)$coefficients/summary(mymodel)$standard.errors
p <- (1 - pnorm(abs(z), 0, 1))*2
p

write.csv(z, file = "C:/Users/ssimo/Desktop/Diplom/data/native_z.csv")
write.csv(p, file = "C:/Users/ssimo/Desktop/Diplom/data/native_p.csv")

library(effects)
plot(Effect("level", mymodel))
plot(Effect("level", mymodel),multiline=T)
plot(Effect("level",mymodel),style="stacked") 

plot(Effect("status", mymodel))
plot(Effect("status", mymodel),multiline=T)
plot(Effect("status",mymodel),style="stacked")

plot(Effect("clord", mymodel))
plot(Effect("clord", mymodel),multiline=T)
plot(Effect("clord",mymodel),style="stacked")

plot(Effect("conj", mymodel))
plot(Effect("conj", mymodel),multiline=T)
plot(Effect("conj",mymodel),style="stacked") 

plot(Effect("rd", mymodel))
plot(Effect("rd", mymodel),multiline=T)
plot(Effect("rd",mymodel),style="stacked") 

