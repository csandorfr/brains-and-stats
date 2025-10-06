# ===============================================================
# Basic Statistical Concepts for Neuroscientists (Base R)
# ===============================================================
# Topics:
# 1. Mean vs Median: Robustness to outliers
# 2. Expected value in a Binomial process
# 3. Sampling variability and the Law of Large Numbers
# ===============================================================


# ---------------------------------------------------------------
# 1. Reaction times: Mean vs Median
# ---------------------------------------------------------------
# Suppose we record reaction times (in milliseconds) for 5 participants.
# One participant was unusually slow (400 ms), creating an outlier.

rt <- c(220, 230, 400, 240, 250)

# Compute the mean (average) and median (middle value)
mean(rt)
median(rt)

# Interpretation:
# - The mean is around 268 ms and is pulled upward by the outlier.
# - The median is 240 ms and better represents the "typical" value.
# - The median is more robust to outliers than the mean.
# In practice, median values are often used for skewed data
# such as reaction times or spike counts.


# ---------------------------------------------------------------
# 2. Expected spikes: Simple Binomial expectation
# ---------------------------------------------------------------
# Suppose a neuron fires with probability p = 0.2 per trial,
# and we observe it for n = 10 independent trials.

p <- 0.2
n <- 10

# Expected number of spikes = n × p
n * p   # Theoretical mean = 2 spikes

# Concept:
# - Each trial follows a Bernoulli(p) process.
# - The total number of spikes across n trials follows a Binomial(n, p) distribution.
# - The expected value E[X] = n * p represents the average number of spikes
#   if the experiment were repeated many times.


# ---------------------------------------------------------------
# 3. Proportion of heads: Sampling variability
# ---------------------------------------------------------------
# Example of random sampling: flipping a fair coin (p = 0.5) 5 times.
# We simulate 1000 experiments of 5 flips each and calculate the
# proportion of heads in each experiment.

set.seed(1)  # ensures reproducibility
props <- rbinom(1000, size = 5, prob = 0.5) / 5  # proportion of heads

# Plot histogram of proportions
hist(props,
     main = "Proportion of Heads (n = 5)",
     xlab = "Proportion of heads",
     col = "lightblue", border = "black")

# Interpretation:
# - With only 5 flips, results vary widely (0, 0.2, 0.4, 0.6, 0.8, 1.0).
# - As the number of flips increases, the distribution becomes narrower around 0.5.
# - This demonstrates sampling variability and the law of large numbers:
#   as sample size increases, the sample mean approaches the true mean (p).
# ===============================================================
