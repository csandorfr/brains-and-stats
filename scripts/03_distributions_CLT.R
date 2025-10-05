# Binomial
barplot(dbinom(0:10, 10, .5), names.arg=0:10, main="Binomial(10,.5)")

# Poisson
barplot(dpois(0:15, 4), names.arg=0:15, main="Poisson(4)")

# Normal
curve(dnorm(x,0,1), -4, 4, lwd=2, main="Normal(0,1)"); abline(v=0,lty=2,col="red")

# CLT from exponential population
set.seed(10); n <- 30
xbar <- replicate(4000, mean(rexp(n,1)))
hist(xbar, breaks=30, col="gray90", main=paste("CLT (n=",n,")"))
curve(dnorm(x,1,1/sqrt(n)), add=TRUE, col="red", lwd=2, lty=2)
