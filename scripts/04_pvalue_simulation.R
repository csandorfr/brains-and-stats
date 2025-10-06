# ===============================================
# Empirical p-value (no t-test): "Underfilling" example
# ===============================================
# Goal:
# Understand the meaning of a p-value by simulation instead of formulas.
# Scenario:
# A bottling machine is supposed to fill bottles with 0.500 L of liquid.
# We suspect it might be underfilling (true mean = 0.495 L).
#
# Question:
# How extreme is our observed sample mean compared to what we'd expect
# if the machine were working correctly (H0: mean = 0.500)?
#
# We'll simulate the *sampling distribution* of the mean under H0
# and calculate the probability (p-value) of getting an observed mean
# as small or smaller than the one we actually measured.
# ===============================================

set.seed(123)       # ensures reproducibility (same random numbers each run)

# ------------------------------------------------
# 1. Define parameters
# ------------------------------------------------
mu0 <- 0.500        # true mean under the null hypothesis (H0)
mu1 <- 0.495        # actual mean under the alternative (H1, underfilling)
sd  <- 0.01         # standard deviation (10 mL variation per bottle)
n   <- 10           # sample size (we test 10 bottles)

# ------------------------------------------------
# 2. Simulate sampling distribution under H0
# ------------------------------------------------
# Imagine we repeat the bottling experiment 10,000 times under H0 (machine works fine)
# Each time, we take 10 bottles and compute their sample mean.
xbar_H0 <- replicate(10000, mean(rnorm(n, mean = mu0, sd = sd)))

# ------------------------------------------------
# 3. Simulate one "observed" sample under H1
# ------------------------------------------------
# Suppose the machine *is* underfilling slightly (mean = 0.495).
# We take 10 bottles and compute the average fill.
obs <- mean(rnorm(n, mean = mu1, sd = sd))

# ------------------------------------------------
# 4. Compute the empirical p-value
# ------------------------------------------------
# The p-value is the probability, under H0, of getting a mean
# *less than or equal to* our observed mean.
# (We’re doing a one-sided test for underfilling.)
pval <- mean(xbar_H0 <= obs)

# ------------------------------------------------
# 5. Visualize the result
# ------------------------------------------------
# The histogram shows the sampling distribution under H0.
# The red line shows the observed sample mean under H1.
# The shaded area to the left (conceptually) represents the p-value.
hist(xbar_H0,
     breaks = 40,
     col = "lightblue",
     border = "white",
     main = paste("Empirical p-value ≈", round(pval, 4)),
     xlab = "Sample mean (under H₀)",
     ylab = "Frequency")

abline(v = obs, col = "red", lwd = 2)

# ------------------------------------------------
# 6. Interpretation
# ------------------------------------------------
# - The histogram represents all possible sample means if H₀ were true (μ = 0.500).
# - Our observed mean (red line) came from an underfilled batch (μ = 0.495).
# - The p-value (~0.02, for example) tells us how rare such a low mean is
#   *if* the machine were working correctly.
# - A small p-value (e.g., < 0.05) → we reject H₀ → evidence of underfilling.
# ===============================================

# Optional: print summary
cat("Observed mean =", round(obs, 4),
    "\nEmpirical p-value =", round(pval, 4), "\n")
