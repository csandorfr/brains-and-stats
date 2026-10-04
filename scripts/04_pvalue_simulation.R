# ===============================================
# What a p-value means, by simulation: the Tasty Beer example
# ===============================================
# These are the SAME ten bottles shown on the lecture slide, so the
# number this script prints should match the number on the screen.
#
#   H0: the machine fills at least 0.500 L on average
#   H1: the machine fills less than 0.500 L on average
#
# One-sided, because overfilling is not an offence. We decide that
# before looking at the data.
# ===============================================

set.seed(123)   # the simulation below uses random numbers

# ------------------------------------------------
# 1. The data
# ------------------------------------------------
fill <- c(0.499, 0.488, 0.478, 0.508, 0.490,
          0.504, 0.488, 0.502, 0.508, 0.506)

mu0 <- 0.500            # the value under H0
n   <- length(fill)     # 10 bottles
obs <- mean(fill)       # 0.4971
s   <- sd(fill)         # 0.0104

cat("Observed mean =", round(obs, 4), "L\n")
cat("Sample SD     =", round(s, 4), "L\n")
cat("Shortfall     =", round((mu0 - obs) * 1000, 1), "mL per bottle\n\n")

# ------------------------------------------------
# 2. Simulate the sampling distribution under H0
# ------------------------------------------------
# If the machine were honest, what sample means would ten bottles give?
# Repeat the inspection 100,000 times on a virtual honest machine.
xbar_H0 <- replicate(100000, mean(rnorm(n, mean = mu0, sd = s)))

# ------------------------------------------------
# 3. The empirical p-value
# ------------------------------------------------
# The proportion of honest-machine inspections that came out as low as
# ours, or lower.
pval <- mean(xbar_H0 <= obs)
cat("Empirical p-value =", round(pval, 3), "\n\n")

# ------------------------------------------------
# 4. The same answer from the formula
# ------------------------------------------------
# t.test() does this analytically. The two agree closely; the small
# difference is because the simulation treats the SD as known while the
# t-test allows for the fact that we estimated it from 10 bottles.
print(t.test(fill, mu = mu0, alternative = "less"))

# The two-sided interval, which is what you would report in a paper:
cat("95% CI:", round(t.test(fill, mu = mu0)$conf.int, 4), "\n")

# ------------------------------------------------
# 5. Picture
# ------------------------------------------------
hist(xbar_H0,
     breaks = 60,
     col = "lightblue",
     border = "white",
     main = paste("Sample means from an HONEST machine (p =", round(pval, 3), ")"),
     xlab = "Mean of 10 bottles (L)",
     ylab = "Frequency")

abline(v = obs, col = "red", lwd = 3)               # what we actually saw
abline(v = mu0, col = "grey40", lwd = 2, lty = 2)   # the advertised 0.500

legend("topright",
       legend = c("Observed mean", "H0: 0.500 L"),
       col = c("red", "grey40"), lwd = c(3, 2), lty = c(1, 2), bty = "n")

# ------------------------------------------------
# 6. The verdict, and why it is not the whole story
# ------------------------------------------------
# p is about 0.20: if the machine were honest, a sample this low would
# turn up about one time in five. Not unusual enough to reject H0, so
# on this evidence Tasty Beer is not convicted.
#
# But "not guilty" is not "innocent". Ask the other question: if the
# machine really were underfilling by 5 mL, would ten bottles have
# caught it?
cat("\n--- How good was this inspection? ---\n")
print(power.t.test(n = 10, delta = 0.005, sd = 0.01, sig.level = 0.05,
                   type = "one.sample", alternative = "one.sided"))

# Power is about 0.43. Even if the machine WERE cheating by 5 mL, this
# inspection would have missed it more often than not.
#
# How many bottles would they have needed?
cat("\n--- How many bottles for an 80% chance? ---\n")
print(power.t.test(delta = 0.005, sd = 0.01, power = 0.8, sig.level = 0.05,
                   type = "one.sample", alternative = "one.sided"))

# About 27. They tested 10.
#
# TRY THIS: in section 1 write fill <- rep(fill, 3) to pretend they
# tested 30 bottles with the same readings, then rerun. The shortfall
# has not changed at all. Watch the p-value, and work out why.
#
# Take-home: absence of evidence is not evidence of absence.
# ===============================================
