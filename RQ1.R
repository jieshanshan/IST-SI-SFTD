library(Hmisc)
library(lme4)
library(xtable)

datat<-read.csv("RQ1.csv")

metrics1<-c("SLOC","Commits","Developers","FixedIssues","TotalIssues")

datat2<-subset(datat,select=metrics1)

# REDUNDANCY ANALYSIS

dataf=paste(metrics1,sep="+",collapse="+")
dataf2=paste("~",dataf,sep="")
variables=redun(eval(parse(text=dataf2)),data=datat2,r2=0.8)

#excluded metrics
excluded=variables$Out
excluded

#retained metrics
selectedMetrics=variables$In
selectedMetrics
##################################################################################
# MIXED MODEL
##################################################################################

m=glmer(Self ~ SLOC + Commits + Developers + FixedIssues + (1|RuleID) + (1|Project), data=datat, family = 'binomial')

summary(m)
mod=summary(m)$coefficients
or=exp(mod[,1])

m2=data.frame(OR=or,Estimate=mod[,1],Std.Error=mod[,2],z.value=mod[,3],p.value=mod[,4])
m2

