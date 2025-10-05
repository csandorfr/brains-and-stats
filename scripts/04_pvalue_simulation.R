# Empirical p-value (no t-test): underfilling example
set.seed(123); mu0<-0.500; mu1<-0.495; sd<-0.01; n<-10
xbar_H0 <- replicate(1e4, mean(rnorm(n, mu0, sd)))
obs     <- mean(rnorm(n, mu1, sd))
pval    <- mean(xbar_H0 <= obs)
hist(xbar_H0, breaks=40, col="lightblue", main=paste("p ≈", round(pval,4))); abline(v=obs,col="red",lwd=2)
