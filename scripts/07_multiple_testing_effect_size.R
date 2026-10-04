# ===============================================================
# Multiple Testing & Effect Size: False Positives and Cohen's d
# ===============================================================
# Concepts:
# 1️ Multiple testing problem:
#     - Each test has a false positive rate (α = 0.05).
#     - Running many independent tests increases the chance that
#       *at least one* will be falsely significant by chance.
#       Formula: P(≥1 false positive) = 1 - (1 - α)^n_tests
#
# 2️ Bonferroni correction:
#     - To keep the familywise error rate ≈ 0.05 across n tests,
#       we use a stricter threshold α_adj = α / n_tests.
#
# 3️ Cohen’s d:
#     - A standardized measure of effect size.
#     - d = (mean₂ − mean₁) / SD_pooled
# ===============================================================

# ---------------------------------------------------------------
# 1) Multiple testing inflation
# ---------------------------------------------------------------
alpha <- 0.05
ntests <- 1:100

# Probability of getting at least one false positive
p_any <- 1 - (1 - alpha)^ntests

# Plot the familywise false-positive rate
plot(ntests, p_any, type = "l", lwd = 2, col = "steelblue",
     main = "Probability of ≥1 False Positive",
     xlab = "Number of independent tests",
     ylab = "Probability")

# Add a horizontal line at α = 0.05 for reference
abline(h = 0.05, lty = 2, col = "red")
text(70, 0.06, "α = 0.05 (per test)", col = "red", cex = 0.8)

# ---------------------------------------------------------------
# 2) Bonferroni correction (adjust α)
# ---------------------------------------------------------------
alpha_adj <- alpha / ntests

plot(ntests, alpha_adj, type = "l", lwd = 2, col = "tomato",
     main = "Bonferroni Correction: Adjusted α Threshold",
     xlab = "Number of tests",
     ylab = "Adjusted α = α / n")

# Add a note
text(60, 0.001, "Stricter threshold with more tests", col = "tomato", cex = 0.8)

# ---------------------------------------------------------------
# 3) Effect size: Cohen's d
# ---------------------------------------------------------------
# Define a simple function for Cohen’s d between two independent groups
cohens_d <- function(x, y) {
  s1 <- sd(x); s2 <- sd(y)
  n1 <- length(x); n2 <- length(y)
  sp <- sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2) / (n1 + n2 - 2))  # pooled SD
  (mean(y) - mean(x)) / sp
}

# Simulate two groups: example reaction times (ms)
set.seed(3)
groupA <- rnorm(50, mean = 300, sd = 80)   # control
groupB <- rnorm(50, mean = 270, sd = 80)   # treated group: 30 ms faster

# Compute and print effect size
d <- cohens_d(groupA, groupB)
print(paste("Cohen's d =", round(d, 3)))

# ---------------------------------------------------------------
# 4) Teaching interpretation
# ---------------------------------------------------------------
# - With α = 0.05, a single test has a 5% false positive risk.
# - With 20 independent tests, that risk rises to ~64%.
# - Bonferroni correction reduces the per-test α (e.g., 0.05 / 20 = 0.0025)
#   to maintain overall false positive ≈ 5%.
# - Cohen’s d helps quantify *how large* the observed difference is:
#     |d| ≈ 0.2 → small   |d| ≈ 0.5 → medium   |d| ≈ 0.8 → large
# - A significant p-value doesn’t mean the effect is important —
#   always report and interpret the *effect size*.
# ===============================================================

# ---------------------------------------------------------------
# 5) Doing the correction in R: p.adjust()
# ---------------------------------------------------------------
# You almost never apply Bonferroni by hand. p.adjust() rescales the
# p-values so you can keep comparing them against 0.05.

set.seed(11)

# A realistic screen: 100 tests, 90 of them null, 10 with a real effect.
pvals <- c(
  replicate(90, t.test(rnorm(20, 0, 1), rnorm(20, 0, 1))$p.value),   # nothing there
  replicate(10, t.test(rnorm(20, 1, 1), rnorm(20, 0, 1))$p.value)    # real effect
)
truth <- rep(c(FALSE, TRUE), times = c(90, 10))

bonf <- p.adjust(pvals, method = "bonferroni")   # controls ANY false positive
bh   <- p.adjust(pvals, method = "BH")           # controls the false DISCOVERY rate

report <- function(p, label) {
  hits <- p < 0.05
  cat(sprintf("%-12s  hits %3d   true %2d   false %2d\n",
              label, sum(hits), sum(hits & truth), sum(hits & !truth)))
}

cat("\n100 tests, 10 of which have a real effect:\n\n")
report(pvals, "uncorrected")
report(bonf,  "Bonferroni")
report(bh,    "BH / FDR")

# Read the three rows against each other:
# - Uncorrected picks up real effects but drags in several false ones.
# - Bonferroni almost never admits a false positive, and pays for it by
#   missing real effects. It is the right choice when one false claim
#   would be costly.
# - BH sits in between and is the sensible default for a screen with
#   thousands of tests, where you accept that a known fraction of your
#   hits will be wrong.
#
# None of this helps if you do not count honestly. Every test you ran
# belongs in the correction, including the models you fitted and threw
# away.

# ---------------------------------------------------------------
# 6) Effect size and confidence interval together
# ---------------------------------------------------------------
# A p-value says whether. An effect size says how much. Report the
# difference in its own units, with an interval, every time.

fit  <- t.test(groupA, groupB)          # control minus treated
drop <- mean(groupA) - mean(groupB)     # how much faster the treated group was

cat(sprintf("\nReaction time fell by %.1f ms, 95%% CI %.1f to %.1f ms, d = %.2f, p = %.3f\n",
            drop, fit$conf.int[1], fit$conf.int[2],
            abs(cohens_d(groupA, groupB)), fit$p.value))

if (fit$conf.int[1] < 0 && fit$conf.int[2] > 0) {
  cat("The interval crosses zero, so a reduction of zero is still compatible\n")
  cat("with these data. Report that honestly rather than calling it a null result.\n")
}

# This is the sentence to put in a paper: a difference in the units you
# measured, an interval around it, and only then a p-value. The interval
# tells a reader what the study could and could not rule out, which is
# exactly what a bare p-value hides.
#
# TRY THIS: raise n from 50 to 200 in section 3 and rerun. The effect
# size barely moves; the interval tightens and the p-value collapses.
# That is the difference between how big an effect is and how sure you
# are about it.
# ===============================================================
