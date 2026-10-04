# ===============================================================
# Multiple Testing, Non-Parametric Data, and Paired Comparisons
# ===============================================================


# ---------------------------------------------------------------
# Q2. Multiple testing problem
# ---------------------------------------------------------------
# Each statistical test has a false positive rate α (e.g., 0.05).
# If we run many independent tests, the chance of getting at least
# one false positive increases rapidly.

alpha <- 0.05     # false positive rate per test
ntests <- 20      # number of independent tests

# Probability of at least one false positive:
prob_false <- 1 - (1 - alpha)^ntests
prob_false

# The Bonferroni threshold for 20 tests:
alpha / ntests        # 0.0025

# Interpretation:
# With 20 independent tests at α = 0.05, there is about a 64% chance
# of getting at least one false positive just by chance.
# → This motivates multiple-testing corrections (e.g., Bonferroni).


# ---------------------------------------------------------------
# Q3a. Non-parametric data: number of siblings
# ---------------------------------------------------------------
# The number of siblings in a group of students follows a Poisson distribution.
# These data are discrete and often skewed (many small values, few large).

set.seed(1)
siblings <- rpois(30, lambda = 1.6)

# Plot histogram
hist(siblings,
     main = "Number of siblings",
     xlab = "Count",
     ylab = "Frequency",
     col = "lightgreen", border = "black")

# Summary statistics
median(siblings)
IQR(siblings)

# Interpretation:
# The data are not normally distributed (discrete + skewed).
# → Median and IQR are better measures of central tendency and spread.
# → Use non-parametric tests (e.g., Mann–Whitney, Wilcoxon) instead of t-tests.


# ---------------------------------------------------------------
# Q3b. Paired data: pre- and post-intervention
# ---------------------------------------------------------------
# Reaction times (ms) measured before and after a training intervention
# for the same 20 participants.

set.seed(2)
pre <- rnorm(20, mean = 320, sd = 40)         # before training
post <- pre - rnorm(20, mean = 25, sd = 20)   # faster after training

# Paired t-test: compares means of dependent samples
t.test(post, pre, paired = TRUE)

# Interpretation:
# - The test evaluates whether the average improvement is significantly different from 0.
# - The “paired” structure accounts for within-subject variability.
# - In this simulation, we expect a significant improvement after training.
# ===============================================================

# ---------------------------------------------------------------
# Q3b continued: why paired, and what does unpaired cost you?
# ---------------------------------------------------------------
# Pairing removes the between-participant variation, which is usually
# the largest source of noise. Running an unpaired test on paired data
# throws that away.

cat("\nPaired   :", format.pval(t.test(post, pre, paired = TRUE)$p.value, digits = 3), "\n")
cat("Unpaired :", format.pval(t.test(post, pre)$p.value, digits = 3), "\n")

# Same numbers, same real effect, far weaker evidence from the unpaired
# test. Pairing is a design decision, not an analysis option.
# ===============================================================
