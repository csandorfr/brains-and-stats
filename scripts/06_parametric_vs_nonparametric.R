# ============================================================
# Parametric (t-test) vs non-parametric (Mann-Whitney)
# ============================================================
# The question people actually want answered is "which test is more
# likely to find a real effect?" You cannot answer that by comparing
# two p-values from one dataset: p-values are random, and whichever
# happens to be smaller today tells you nothing.
#
# The honest comparison is a POWER comparison: simulate the experiment
# many times and count how often each test rejects H0.
# ============================================================

set.seed(4)

n_per_group <- 30        # animals per group
n_sim       <- 2000      # simulated experiments
alpha       <- 0.05

# ------------------------------------------------------------
# 1. One experiment, so you can see the data first
# ------------------------------------------------------------
# A) Roughly normal (e.g. heights in cm), means 170 vs 175
normA <- rnorm(n_per_group, mean = 170, sd = 8)
normB <- rnorm(n_per_group, mean = 175, sd = 8)

# B) Strongly right-skewed (e.g. reaction times), B shifted up
skewA <- rlnorm(n_per_group, meanlog = 0.0, sdlog = 0.7)
skewB <- rlnorm(n_per_group, meanlog = 0.3, sdlog = 0.7)

par(mfrow = c(1, 2))
boxplot(list(A = normA, B = normB), col = "lightblue",
        main = "Roughly normal", ylab = "cm")
boxplot(list(A = skewA, B = skewB), col = "lightgreen",
        main = "Strongly skewed", ylab = "value")
par(mfrow = c(1, 1))

# ALWAYS look at the data before choosing a test. A QQ plot is the
# quickest check of how normal a sample is:
qqnorm(skewA, main = "QQ plot: skewed sample"); qqline(skewA, col = "red")

# ------------------------------------------------------------
# 2. Power comparison: repeat the experiment 2000 times
# ------------------------------------------------------------
# Note: t.test() defaults to the Welch version, which does NOT assume
# equal variances. That is the better default - leave it alone. Do not
# set var.equal = TRUE out of habit.

power_compare <- function(gen_A, gen_B, label) {
  t_hits  <- 0
  mw_hits <- 0
  for (i in 1:n_sim) {
    a <- gen_A(); b <- gen_B()
    if (t.test(b, a)$p.value          < alpha) t_hits  <- t_hits  + 1
    if (suppressWarnings(wilcox.test(b, a)$p.value) < alpha) mw_hits <- mw_hits + 1
  }
  cat(sprintf("%-22s  t-test %.3f   Mann-Whitney %.3f\n",
              label, t_hits / n_sim, mw_hits / n_sim))
}

cat("Proportion of experiments in which each test rejected H0\n")
cat("(higher is better when there IS a real difference)\n\n")

power_compare(function() rnorm(n_per_group, 170, 8),
              function() rnorm(n_per_group, 175, 8),
              "Normal data")

power_compare(function() rlnorm(n_per_group, 0.0, 0.7),
              function() rlnorm(n_per_group, 0.3, 0.7),
              "Skewed data")

# ------------------------------------------------------------
# 3. False positive rate: no real difference at all
# ------------------------------------------------------------
# Both tests should reject about 5% of the time. If one rejects far
# more often, it is not controlling its error rate on this kind of data.
cat("\nWith NO real difference, both should sit near 0.05:\n\n")

power_compare(function() rnorm(n_per_group, 170, 8),
              function() rnorm(n_per_group, 170, 8),
              "Normal, no effect")

power_compare(function() rlnorm(n_per_group, 0.0, 0.7),
              function() rlnorm(n_per_group, 0.0, 0.7),
              "Skewed, no effect")

# ------------------------------------------------------------
# 4. What to take from this
# ------------------------------------------------------------
# - On normal data the t-test is slightly more powerful. The gap is
#   small, which is why "always use the t-test" is weak advice.
# - On strongly skewed data Mann-Whitney is clearly more powerful,
#   because the t-test's signal is a mean that the outliers drag around.
# - Non-parametric is NOT assumption-free. It trades an assumption
#   about shape for a loss of power, and it tests a different thing:
#   ranks, not means. "Significant" from Mann-Whitney does not license
#   a statement about means.
# - With n below about 10 per group you cannot check normality
#   meaningfully and a rank test has very little power. Say so in the
#   paper rather than pretending otherwise.
# - TRY THIS: set n_per_group to 8 and rerun. Both columns collapse.
#   That is what an underpowered study looks like.
# ============================================================
