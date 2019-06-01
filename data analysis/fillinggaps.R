library(tidyverse)
library(mlogit)
library(nnet)

nat <- read.csv('https://raw.githubusercontent.com/acRnR/Referential-Choice-in-Subordinate-Clauses-in-Native-and-L2-Russian-Speakers/master/data/nativeg.csv', sep=';', encoding = 'UTF-8')

str(nat)
names(nat) <- c('conj', 'rd', 'clord', 'choice')

output <- mlogit(choice~1|conj+rd+clord, data=nat)
summary(output)

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
