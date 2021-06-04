library(Hmisc)
library(lme4)
library(xtable)

datat<-read.csv("RQ4.csv")

m=glmer(Self ~ Developer + Times + (1|File) + (1|Project), data=datat,family = 'binomial', control = glmerControl(optimizer = "bobyqa"))
summary(m)

print(m, corr = TRUE)
mod=summary(m)$coefficients
or=exp(mod[,1])

m2=data.frame(OR=or,Estimate=mod[,1],Std.Error=mod[,2],z.value=mod[,3],p.value=mod[,4])
m2




