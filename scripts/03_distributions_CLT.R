# ===============================================
# Probability Distributions and the Central Limit Theorem (CLT)
# ===============================================
# Goal:
# Learn about common probability distributions used in neuroscience and psychology.
# We’ll cover:
#   1. Binomial distribution – discrete "success/failure" outcomes
#   2. Poisson distribution – counts of rare events
#   3. Normal distribution – continuous bell curve
#   4. Central Limit Theorem (CLT) – why sample means are approximately Normal
# ===============================================


# ------------------------------------------------
# 1. Binomial Distribution
# ------------------------------------------------
# Scenario: 10 independent coin tosses (each with probability p = 0.5 of heads)
# The binomial distribution gives the probability of getting k heads.

k <- 0:10                               # possible outcomes: 0 to 10 heads
p <- dbinom(k, size = 10, prob = 0.5)   # dbinom() gives P(X = k)

barplot(p,
        names.arg = k,
        col = "lightblue",
        border = "black",
        main = "Binomial(10, 0.5): Number of Heads",
        xlab = "Number of successes (heads)",
        ylab = "Probability")

# Interpretation:
# - Symmetric around 5 because p = 0.5.
# - Mean = n * p = 10 * 0.5 = 5
# - Variance = n * p * (1 - p) = 2.5


# ------------------------------------------------
# 2. Poisson Distribution
# ------------------------------------------------
# Scenario: number of spikes a neuron fires in one second, with average λ = 4.
# The Poisson distribution models counts of events over fixed time or space intervals.

k <- 0:15                              # possible spike counts
p <- dpois(k, lambda = 4)              # dpois() gives P(X = k)

barplot(p,
        names.arg = k,
        col = "lightgreen",
        border = "black",
        main = "Poisson(λ = 4): Neuron Spikes per Second",
        xlab = "Number of spikes (k)",
        ylab = "Probability")

# Interpretation:
# - Most likely spike counts are near λ = 4.
# - Mean = Variance = λ.
# - Useful for modeling count data in neuroscience (spikes, events).


# ------------------------------------------------
# 3. Normal Distribution
# ------------------------------------------------
# Continuous bell-shaped curve often found in biological data (e.g., height, IQ, reaction time).

curve(dnorm(x, mean = 0, sd = 1),       # dnorm() = density of Normal(mean, sd)
      from = -4, to = 4, lwd = 2,
      main = "Normal(0, 1): Standard Normal Distribution",
      xlab = "x", ylab = "Density")

abline(v = 0, lty = 2, col = "red")     # add mean line at μ = 0

# Interpretation:
# - Symmetric around mean (μ = 0).
# - 68% of data lie within ±1 SD, 95% within ±2 SD.
# - Theoretical foundation for many parametric tests (e.g., t-tests, ANOVA).


# ------------------------------------------------
# 4. Central Limit Theorem (CLT) Simulation
# ------------------------------------------------
# The CLT states:
#   Even if the population is *not* Normal,
#   the distribution of sample means becomes approximately Normal
#   as the sample size (n) increases.

set.seed(10)
n <- 30                                 # sample size per experiment

# Population: Exponential(1) — very right-skewed
# Simulate 4000 experiments, each with n = 30 samples, and compute their mean.
xbar <- replicate(4000, mean(rexp(n, rate = 1)))

# Plot histogram of the sample means
hist(xbar,
     breaks = 30,
     col = "gray90",
     border = "black",
     main = paste("Central Limit Theorem Demonstration (n =", n, ")"),
     xlab = "Sample mean (x̄)",
     ylab = "Frequency")

# Overlay theoretical Normal curve
curve(dnorm(x, mean = 1, sd = 1 / sqrt(n)),
      add = TRUE,
      col = "red",
      lwd = 2,
      lty = 2)

# Interpretation:
# - The underlying population (Exponential) is *not* Normal (it’s skewed).
# - Yet, the sample means (x̄) form a nearly Normal distribution.
# - This explains why we can use Normal-based tests (like t-tests)
#   even when data are not perfectly Normal, *if n is large enough*.


# ------------------------------------------------
# Summary and Key Concepts
# ------------------------------------------------
# - Binomial: Discrete outcomes (success/failure). Mean = n*p, Var = n*p*(1-p)
# - Poisson: Counts of rare events. Mean = Var = λ
# - Normal: Continuous, symmetric, bell-shaped
# - CLT: The sampling distribution of the mean becomes Normal as n → ∞
#
# Practical takeaway:
#   Many neuroscience and psychology measures are analyzed assuming Normality
#   because of the Central Limit Theorem.
# ===============================================
