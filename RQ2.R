#RQ2: Wilcoxon Rank Sum tests and Cliff's Delta Effect Size
library(effsize)
wilcox.test(RQ2_Wilcoxon$Java.Code,RQ2_Wilcoxon$Python.Code)
cliff.delta(RQ2_Wilcoxon$Java.Code,RQ2_Wilcoxon$Python.Code)

wilcox.test(RQ2_Wilcoxon$Java.Defect,RQ2_Wilcoxon$Python.Defect)
cliff.delta(RQ2_Wilcoxon$Java.Defect,RQ2_Wilcoxon$Python.Defect)

wilcox.test(RQ2_Wilcoxon$Java.Design,RQ2_Wilcoxon$Python.Design)
cliff.delta(RQ2_Wilcoxon$Java.Design,RQ2_Wilcoxon$Python.TestDesign)

wilcox.test(RQ2_Wilcoxon$Java.Documentation,RQ2_Wilcoxon$Python.Documentation)
cliff.delta(RQ2_Wilcoxon$Java.Documentation,RQ2_Wilcoxon$Python.Documentation)

wilcox.test(RQ2_Wilcoxon$Java.Test,RQ2_Wilcoxon$Python.Test)
cliff.delta(RQ2_Wilcoxon$Java.Test,RQ2_Wilcoxon$Python.Test)


#RQ2: Scott-Knott ESD test
library(ScottKnottESD)
sk_esd(RQ2_ScottKnott, version="np")

