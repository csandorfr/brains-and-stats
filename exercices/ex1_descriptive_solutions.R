# 1️⃣ Reaction times
rt <- c(220, 230, 400, 240, 250)
mean(rt)
median(rt)
# The median is more robust to the outlier (400)

# 2️⃣ Expected spikes
p <- 0.2
n <- 10
n * p   # Expected number of spikes = 2

# 3️⃣ Proportion of heads
props <- rbinom(1000, 5, 0.5) / 5
hist(props, main = "Proportion of heads (n = 5)", col = "lightblue", border = "black")
