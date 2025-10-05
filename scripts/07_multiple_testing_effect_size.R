lpha<-0.05; ntests<-1:100; p_any<-1-(1-alpha)^ntests
plot(ntests,p_any,type="l",lwd=2,col="steelblue",main="P(≥1 false positive)",xlab="Tests",ylab="Prob")
alpha_adj<-alpha/ntests; plot(ntests,alpha_adj,type="l",lwd=2,col="tomato",main="Bonferroni α/n")

cohens_d <- function(x,y){ s1<-sd(x); s2<-sd(y); n1<-length(x); n2<-length(y)
  sp<-sqrt(((n1-1)*s1^2+(n2-1)*s2^2)/(n1+n2-2)); (mean(y)-mean(x))/sp }
set.seed(3); a<-rnorm(50,300,80); b<-rnorm(50,270,80); print(cohens_d(a,b))
