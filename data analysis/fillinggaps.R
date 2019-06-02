library(tidyverse)
library(mlogit)
library(nnet)

nat <- read.csv('https://raw.githubusercontent.com/acRnR/Referential-Choice-in-Subordinate-Clauses-in-Native-and-L2-Russian-Speakers/master/data/trynew.csv', sep=';', encoding = 'UTF-8')

str(nat)
names(nat) <- c('conj', 'rd', 'clord', 'choice')

rownames(mydata)
nat$out <- relevel(nat$choice, ref='no')
mymodel <- multinom(out~conj+rd+clord, data=nat)
summary(mymodel)

predict(mymodel, nat, type='prob')
cm <- table(predict(mymodel), nat$choice)
print(cm)
1-sum(diag(cm))/sum(cm)


z <- summary(mymodel)$coefficients/summary(mymodel)$standard.errors
p <- (1 - pnorm(abs(z), 0, 1))*2
p

write.csv(z, file = "C:/Users/ssimo/Desktop/Diplom/data/native_z.csv")
write.csv(p, file = "C:/Users/ssimo/Desktop/Diplom/data/native_p.csv")

library(effects)
plot(Effect("clord", mymodel))
plot(Effect("clord", mymodel),multiline=T)
plot(Effect("clord",mymodel),style="stacked") 
install.packages('effects')

plot(Effect("conj", mymodel))
plot(Effect("conj", mymodel),multiline=T)
plot(Effect("conj",mymodel),style="stacked") 

plot(Effect("rd", mymodel))
plot(Effect("rd", mymodel),multiline=T)
plot(Effect("rd",mymodel),style="stacked") 

