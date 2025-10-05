# 4️⃣ Multiple testing problem
alpha <- 0.05
ntests <- 20
1 - (1 - alpha)^ntests
# Probability of ≥1 false positive ≈ 0.64

# 5️⃣ Non-parametric data: number of siblings
siblings <- rpois(30, 1.6)
hist(siblings, main = "Number of siblings", col = "lightgreen", border = "black")
median(siblings)
IQR(siblings)
# Data are discrete and skewed → better for non-parametric tests

# 6️⃣ Paired data: pre- and post-intervention
pre <- rnorm(20, mean = 320, sd = 40)
post <- pre - rnorm(20, mean = 25, sd = 20)
t.test(post, pre, paired = TRUE)
