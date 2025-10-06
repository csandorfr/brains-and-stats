# ===============================================
# Introduction to Descriptive Statistics (base R)
# ===============================================

# In this exercise, we explore how to describe data using:
# - Mean: average value
# - Median: middle value
# - Mode: most frequent value
# - Range: max - min (spread of data)
# - Variance and SD: average squared deviation from the mean (and its square root)
# - How skewed data affect these measures

# ------------------------------------------------
# 1. Define a simple function to compute the MODE
# ------------------------------------------------
# R does not have a built-in mode() function for numeric data,
# so we create one that finds the most frequent rounded value.
get_mode <- function(x) {
  tab <- table(round(x))                     # Count how often each rounded value appears
  as.numeric(names(tab)[which.max(tab)])     # Return the value with the highest count
}

# ------------------------------------------------
# 2. Simulate three different distributions
# ------------------------------------------------
set.seed(1)  # ensures reproducibility (same random numbers each time)

# (a) Symmetrical distribution (e.g. IQ scores)
# Normally distributed data: mean = 100, SD = 15
iq <- rnorm(1000, mean = 100, sd = 15)

# (b) Positively skewed distribution (e.g. reaction times)
# Exponential: most values are small, few are large → long right tail
reaction <- rexp(1000, rate = 1/300)

# (c) Negatively skewed distribution (e.g. age of onset)
# “Flipped” exponential: most values are large, few are small → long left tail
age <- 100 - rexp(1000, rate = 1/10)

# ------------------------------------------------
# 3. Calculate basic descriptive statistics
# ------------------------------------------------

# Compute for IQ dataset as example
iq_mean <- mean(iq)
iq_median <- median(iq)
iq_mode <- get_mode(iq)
iq_range <- max(iq) - min(iq)
iq_var <- var(iq)
iq_sd <- sd(iq)

# Print nicely
print(round(c(
  Mean = iq_mean,
  Median = iq_median,
  Mode = iq_mode,
  Range = iq_range,
  Variance = iq_var,
  SD = iq_sd
), 2))

# ------------------------------------------------
# 4. Visualize the three distributions
# ------------------------------------------------
# We plot histograms to show how shape affects mean and median

par(mfrow = c(1, 3))  # display 3 plots side by side

# (a) Symmetrical distribution (IQ)
hist(iq, col = "lightblue", main = "Symmetrical (IQ)", xlab = "Value")
abline(v = mean(iq), col = "red", lwd = 2, lty = 2)  # red dashed line = mean

# (b) Positive skew (reaction times)
hist(reaction, col = "lightblue", main = "Positive Skew (Reaction Time)", xlab = "ms")
abline(v = mean(reaction), col = "red", lwd = 2, lty = 2)

# (c) Negative skew (age)
hist(age, col = "lightblue", main = "Negative Skew (Age of Onset)", xlab = "Years")
abline(v = mean(age), col = "red", lwd = 2, lty = 2)

par(mfrow = c(1, 1))  # reset plotting layout

# ------------------------------------------------
# 5. Interpretation and key takeaways
# ------------------------------------------------
# - For symmetrical data (like IQ), mean ≈ median ≈ mode.
# - For positive skew (reaction time), mean > median (outliers pull the mean right).
# - For negative skew (age), mean < median (outliers pull the mean left).
#
# Range gives a simple measure of spread but is sensitive to outliers.
# Variance and standard deviation quantify how variable the data are:
#   variance = average squared deviation from the mean
#   SD = square root of variance (back in original units)
#
# In neuroscience, always check distribution shape before summarising data!
