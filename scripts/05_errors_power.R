# =====================================================
# Margin of Error and Statistical Power: simple sketches
# =====================================================
# Concepts:
# - The *margin of error* (MOE) tells us how precisely we can estimate a mean.
#   It shrinks as sample size (n) increases.
#   Formula: MOE = Z * σ / √n   (for 95% confidence, Z ≈ 1.96)
#
# - Statistical *power* is the probability of detecting a true effect
#   (i.e., correctly rejecting H₀ when H₁ is true).
#   It increases with larger effect sizes (d) and larger sample sizes (n).
# =====================================================

# -----------------------------------------------------
# 1. Margin of error (MOE) vs sample size
# -----------------------------------------------------
sigma <- 10                            # standard deviation of measurements
n_seq <- seq(10, 400, by = 10)         # sample sizes from 10 to 400
MOE <- 1.96 * sigma / sqrt(n_seq)      # 95% margin of error formula

# Plot how MOE decreases as n increases
plot(n_seq, MOE,
     type = "l",                       # line plot
     lwd = 2,                          # line width
     col = "darkgreen",
     main = "Margin of Error vs. Sample Size",
     xlab = "Sample size (n)",
     ylab = "Margin of Error (95% CI)")

# Add teaching notes directly on the plot
text(200, 6, "Doubling n → MOE / √2", col = "darkgreen", cex = 0.9)

# -----------------------------------------------------
# 2. Power vs sample size (for different effect sizes)
# -----------------------------------------------------
# R has this built in. power.t.test() is the function you will actually
# use; it is exact, it handles one-sample, two-sample and paired designs,
# and it solves for whichever quantity you leave out.
#
#   power.t.test(n = 20, delta = 0.5, sd = 1)          -> power
#   power.t.test(delta = 0.5, sd = 1, power = 0.8)     -> n

power_two <- function(n, d, alpha = 0.05) {
  power.t.test(n = n, delta = d, sd = 1, sig.level = alpha,
               type = "two.sample")$power
}

# Create a grid of sample sizes
n_grid <- 5:100

# Plot power curves for small (d = 0.3), medium (d = 0.5), and large (d = 0.8) effects
plot(n_grid, sapply(n_grid, power_two, d = 0.3),
     type = "l", lwd = 2, col = "orange",
     ylim = c(0, 1),
     xlab = "Sample size per group (n)",
     ylab = "Power (1 - beta)",
     main = "Power vs. Sample Size")

# Add more lines for other effect sizes
lines(n_grid, sapply(n_grid, power_two, d = 0.5), col = "blue", lwd = 2)
lines(n_grid, sapply(n_grid, power_two, d = 0.8), col = "purple", lwd = 2)

# Add a dashed reference line at 80% power
abline(h = 0.8, lty = 3)

# Add a legend for clarity
legend("bottomright",
       legend = c("Small (d=0.3)", "Medium (d=0.5)", "Large (d=0.8)"),
       col = c("orange", "blue", "purple"),
       lwd = 2, bty = "n")

# -----------------------------------------------------
# 3. Teaching takeaway
# -----------------------------------------------------
# - The green plot shows that estimation precision improves with n:
#     → Doubling n shrinks the MOE by √2.
# - The power plot shows that:
#     → Larger samples make it easier to detect real effects.
#     → Big effects (d=0.8) need fewer participants.
#     → Small effects (d=0.3) require much larger samples.
# - Common goal: 80% power (dashed line).
# =====================================================

# -----------------------------------------------------
# 4. The question you actually ask when planning a study
# -----------------------------------------------------
# "How many animals per group do I need?" Give power.t.test everything
# except n, and it solves for n.

for (d in c(0.3, 0.5, 0.8)) {
  res <- power.t.test(delta = d, sd = 1, power = 0.8,
                      sig.level = 0.05, type = "two.sample")
  cat(sprintf("d = %.1f  ->  %3.0f per group for 80%% power\n", d, ceiling(res$n)))
}

# Halving the effect size roughly QUADRUPLES the sample you need.
# Small effects are not cheaper to study, they are far more expensive.

# -----------------------------------------------------
# 5. A warning about post-hoc power
# -----------------------------------------------------
# Do NOT compute power after a null result using your own observed
# effect size. "Observed power" is a deterministic function of the
# p-value, so it adds no information at all: a non-significant result
# always gives low observed power, by construction.
#
# Power is a planning tool. The honest thing to report after a null
# result is the confidence interval, which says what effect sizes your
# study could and could not rule out.
# =====================================================
