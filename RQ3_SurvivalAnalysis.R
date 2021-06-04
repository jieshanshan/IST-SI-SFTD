library(survival)
library(survminer)
library(dplyr)

fit <- survfit(Surv(Time, Fixed) ~ Self, data = RQ3)
print(fit)
summary(fit)
res.sum <- surv_summary(fit)
head(res.sum)

ggsurvplot(fit,
           conf.int = TRUE,
           break.time.by=1000,
           risk.table.col = "strata", # Change risk table color by groups
           surv.scale="percent",
           ggtheme = theme_gray(), # Change ggplot2 theme
           palette = c("#F8766D", "#00BFC4"),
           risk.table = TRUE,
           risk.table.height =0.35,
           fun = "event")

ggsurvplot(fit,
           conf.int = TRUE,
           break.time.by=7,
           xlim = c(0,30),
           risk.table.col = "strata", # Change risk table color by groups
           surv.scale="percent",
           ggtheme = theme_gray(), # Change ggplot2 theme
           palette = c("#F8766D", "#00BFC4"),
           risk.table = TRUE,
           risk.table.height =0.35,
           fun = "event")
