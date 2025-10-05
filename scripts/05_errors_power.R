# Margin of error and power sketch
sigma<-10; n_seq<-seq(10,400,10); MOE<-1.96*sigma/sqrt(n_seq)
plot(n_seq, MOE, type="l", lwd=2, col="darkgreen", main="MOE vs n", xlab="n", ylab="MOE")

power_two <- function(n,d,alpha=.05){ se<-sqrt(2/n); z<-qnorm(1-alpha/2); pnorm((abs(d)/se)-z) }
n_grid<-5:100
plot(n_grid, sapply(n_grid, power_two, d=.3), type="l", lwd=2, col="orange", ylim=c(0,1),
     xlab="n per group", ylab="Power", main="Power vs n"); 
lines(n_grid, sapply(n_grid, power_two, d=.5), col="blue", lwd=2)
lines(n_grid, sapply(n_grid, power_two, d=.8), col="purple", lwd=2); abline(h=.8, lty=3)
