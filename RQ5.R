library(Hmisc)
library(lme4)
library(xtable)

datat<-read.csv("RQ5.csv")

m=glmer(Self ~ Commit + Day + File + LOC + (1|Developer) + (1|Project), data=datat,family = 'binomial', control = glmerControl(optimizer = "bobyqa"))
summary(m)

mod=summary(m)$coefficients
or=exp(mod[,1])

m2=data.frame(OR=or,Estimate=mod[,1],Std.Error=mod[,2],z.value=mod[,3],p.value=mod[,4])
m2




