# Descriptive statistics (base R)
get_mode <- function(x){ tab <- table(round(x)); as.numeric(names(tab)[which.max(tab)]) }

set.seed(1)
iq <- rnorm(1000, 100, 15); reaction <- rexp(1000, rate=1/300); age <- 100 - rexp(1000, 1/10)

print(round(c(Mean=mean(iq), Median=median(iq), Mode=get_mode(iq)), 2))

par(mfrow=c(1,3))
hist(iq, col="lightblue", main="Symmetrical (IQ)");     abline(v=mean(iq), col="red", lty=2)
hist(reaction, col="lightblue", main="Positive skew");  abline(v=mean(reaction), col="red", lty=2)
hist(age, col="lightblue", main="Negative skew");       abline(v=mean(age), col="red", lty=2)
par(mfrow=c(1,1))
