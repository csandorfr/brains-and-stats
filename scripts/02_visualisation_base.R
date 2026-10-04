# ===============================================
# Basic Data Visualization in Base R
# ===============================================
# Goal: learn how to create and interpret simple plots
# using R's built-in plotting functions (no libraries needed).
#
# We’ll cover:
#   1. Histogram – shows distribution of numeric data
#   2. Bar chart – compares category frequencies
#   3. Pie chart – shows proportions of categories
#   4. Boxplot – summarises variability and outliers
# ===============================================

# ------------------------------------------------
# 1. Histogram: Distribution of exam scores
# ------------------------------------------------
# A histogram shows how often values fall into specific ranges (bins).
# Useful for continuous data (e.g., test scores, reaction times).

set.seed(123)  # make random numbers reproducible
scores <- round(rnorm(200, mean = 70, sd = 10))  # 200 exam scores, mean 70, SD 10

# Plot histogram
hist(scores,
     col = "lightblue",        # bar color
     border = "black",         # border color for bars
     main = "Histogram of Exam Scores",  # plot title
     xlab = "Score",           # x-axis label
     ylab = "Frequency")       # y-axis label

# Interpretation:
# - The shape tells you if data are symmetric, skewed, or bimodal.
# - The spread gives a sense of variability.
# - Most students scored around 70, with few low or high scores.


# ------------------------------------------------
# 2. Bar chart: Comparing study methods
# ------------------------------------------------
# Bar charts display counts or averages for categories.
# Ideal for categorical data (not continuous).

methods <- c("Flashcards", "Group", "Solo", "Online")  # category labels
counts <- c(25, 15, 40, 20)                            # corresponding counts

barplot(counts,
        names.arg = methods,      # label bars with method names
        las = 2,                  # rotate labels vertically for readability
        col = "lightgreen",       # bar color
        border = "black",
        main = "Study Methods Used by Students",
        xlab = "Study Method",
        ylab = "Number of Students")

# Interpretation:
# - "Solo" study is most popular, followed by "Flashcards".
# - Bar height represents frequency, so it’s easy to compare categories.


# ------------------------------------------------
# 3. Pie chart: proportion of cell types in a sample
# ------------------------------------------------
# Pie charts show how each category contributes to a whole.
# Best when the total (100%) is meaningful and there are few categories.

pie_counts <- c(62, 18, 12, 8)
cell_types <- c("Pyramidal", "Astrocyte", "Interneuron", "Microglia")

# Calculate % for each category
labels <- paste(cell_types, " (", round(100 * pie_counts / sum(pie_counts)), "%)", sep = "")

# Draw pie chart
pie(pie_counts,
    labels = labels,
    col = c("#4C72B0", "#DD8452", "#55A868", "#C44E52"),
    main = "Cell types recovered from one cortical sample")

# The same data as a bar chart, for comparison:
barplot(pie_counts,
        names.arg = cell_types,
        las = 2,
        col = "#4C72B0",
        main = "The same counts as bars",
        ylab = "Number of cells")

# Interpretation:
# - Both plots contain exactly the same information.
# - The eye compares LENGTHS far more accurately than ANGLES, so the bar
#   chart lets you read off the smaller categories and rank them. On the
#   pie, astrocytes and interneurons are hard to tell apart.
# - Use a pie only when the "part of a whole" story is the point and
#   there are three or four categories. Otherwise use bars.


# ------------------------------------------------
# 4. Boxplot: Comparing reaction times between conditions
# ------------------------------------------------
# Boxplots summarize distribution using five-number summary:
#   - Minimum, 1st quartile (Q1), Median (Q2), 3rd quartile (Q3), Maximum
#   - Whiskers show data spread
#   - Dots show outliers beyond 1.5×IQR

set.seed(456)
placebo <- rnorm(50, mean = 300, sd = 40)  # reaction times (ms) under placebo
drug <- rnorm(50, mean = 270, sd = 35)     # faster reaction under drug condition

# Combine both groups and label them
group <- rep(c("Placebo", "Drug"), each = 50)
reaction_time <- c(placebo, drug)

boxplot(reaction_time ~ group,
        col = c("coral", "skyblue"),       # colors per group
        border = "black",
        main = "Reaction Times by Condition",
        xlab = "Condition",
        ylab = "Reaction Time (ms)")

# Interpretation:
# - Median (bold line in box) is lower for the drug → faster responses.
# - Boxes show interquartile range (middle 50% of data).
# - Whiskers indicate spread; any dots beyond them are outliers.


# ------------------------------------------------
# Summary and Key Concepts
# ------------------------------------------------
# - Histogram: shows distribution of numeric data (shape, spread, center)
# - Bar chart: compares frequencies across categories
# - Pie chart: shows proportions of a whole (adds to 100%)
# - Boxplot: summarizes distribution (median, IQR, outliers)
#
# In practice:
# - Always start with a histogram or boxplot for numeric data.
# - Use bar charts for categorical variables; reach for a pie only
#   when "part of a whole" is the actual message.
# - A bar chart of group MEANS with an error bar hides the distribution.
#   With fewer than about 20 points per group, plot the points instead:
#       stripchart(rt_ms ~ group, data = rt, vertical = TRUE,
#                  method = "jitter", pch = 16)
# - Check for skew or outliers before doing statistical tests.
