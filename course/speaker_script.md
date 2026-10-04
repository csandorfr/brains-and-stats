# Speaker script

The word-for-word script for the lecture, also embedded in the notes field
of every slide in `BS_Neuroscience_statistics_2026.pptx`. Roughly 6,900 words,
about 48 minutes spoken: 25 minutes for session 1, 23 for session 2.

Square brackets are stage directions, not speech.

## Slide 1. Title slide

*147 words, about 61 seconds*

Good morning, and welcome to Introduction to Statistics for Neuroscientists.

I am Cynthia Sandor. I run a computational group at the UK Dementia Research Institute here at Imperial, where we work mostly on Parkinson's disease, so everything I show you today is something I have had to get right in my own work.

We have two sessions of forty-five minutes. Each one is half an hour of me talking and fifteen minutes with your hands on the keyboard in R.

Before we start, two things. Everything is on GitHub, at the address you will see shortly, and you need R and RStudio already installed. Fifteen minutes is not enough time to install anything, so if you have not done it, grab a demonstrator now rather than in minute fourteen.

Quick show of hands: who has used R before? Thank you, that tells me how fast to go.

## Slide 2. Agenda

*147 words, about 61 seconds*

Here is the plan.

Session one is about describing data and understanding where variation comes from. Descriptive statistics, how to plot things honestly, a little probability, the common distributions, and then the central limit theorem, which is the piece of mathematics that makes everything in session two legal.

After the break, session two is about testing. Hypothesis testing and p-values, the two ways you can be wrong, multiple testing, effect size, choosing between a t-test and its non-parametric cousin, and how many animals you actually need.

Each session ends with fifteen minutes in R and a few quick-check questions.

One thing to listen out for. In two slides I am going to ask you a question about a brewery. I am not going to answer it. The answer comes after the break, and it is not the answer most of you will expect. Hold on to it.

## Slide 3. Why Statistics?

*165 words, about 68 seconds*

So, why statistics?

Because neuroscience is a noisy business, and it is noisy for three separate reasons that are easy to confuse with each other.

The first is biological variation. No two mice are the same, no two neurons are the same, no two patients are the same. Some of the spread you measure is real and is not error at all.

The second is measurement noise. Electrodes drift. Two raters score the same video differently. The scanner gets recalibrated between your control group and your patient group.

And the third is small samples. Ethics and cost and time cap how many animals or participants you get, so you are almost always deciding on thin evidence.

Statistics is the discipline that tells you which differences survive all three of those. And, just as importantly, it tells you when your study was never capable of telling you anything either way. That second use is the one people forget, and it is the thread running through today.

## Slide 4. Motivating example: Is Tasty Beer  cheating its customers?

*165 words, about 68 seconds*

Here is the question I want you to hold on to.

Tasty Beer sells half-litre bottles. A consumer protection agency suspects they are underfilling, shaving a few millilitres off every bottle, which across a year is a lot of beer.

Now, there is always some variation. No bottling machine fills to exactly five hundred millilitres every time. So the agency cannot just open one bottle and complain.

What they do is take a random sample of bottles and measure them. We will see the actual numbers after the break.

The question is this. If the sample comes out slightly under half a litre, how do you decide whether that is a cheating machine or just the ordinary wobble of an honest one?

That is the whole of hypothesis testing in one sentence, and it is exactly the same question as asking whether a drug slowed reaction times or whether patients have smaller hippocampi.

Keep it in mind. We come back to it in session two.

## Slide 5. What are Descriptive Statistics?

*94 words, about 39 seconds*

Before any of that, you have to describe your data.

Descriptive statistics means summarising what you have in front of you, before you test anything. It is the step people skip, and most bad analyses are already lost by the time the test gets run.

There are two things you need to describe. Where the data sit, which we call central tendency, and how spread out they are, which we call variability.

Both halves matter. A number without a spread is not a result, and I will come back to that in a moment.

## Slide 6. Measures of Central Tendency

*171 words, about 71 seconds*

Three measures of where the data sit, and they are three genuinely different answers to the question "what is typical".

The mean is the arithmetic average: add everything up, divide by how many you have.

The median is the middle value once you put them in order. Half your data are below it, half above.

The mode is the most frequent value. It is useful for categories and for counts, and it is barely defined for continuous data, because no two reaction times are ever exactly equal.

Here is why the difference matters. Suppose you record five reaction times: two hundred and twenty, two hundred and thirty, four hundred, two hundred and forty, two hundred and fifty milliseconds.

The mean is two hundred and sixty-eight. The median is two hundred and forty.

One slow participant moved the mean by twenty-eight milliseconds and moved the median by nothing at all.

So which would you put in your abstract? Have a think. Nobody in that sample actually took two hundred and sixty-eight milliseconds.

## Slide 7. Variability

*205 words, about 85 seconds*

Now the other half of the summary, the half people forget.

The range is simply the highest value minus the lowest. It is quick, and it is defined entirely by two extreme points, so one unusual animal sets it.

The variance is the average squared distance from the mean. Squaring is what stops the positives and negatives cancelling out, but it also means the units are squared, which is why variance is hard to interpret directly.

So we take the square root, and that gives us the standard deviation. Back in the original units, and it is roughly the average distance of a value from the mean. That is what you report.

There is a fourth one worth knowing, the interquartile range, which is the width of the middle fifty per cent. It is robust, and it pairs with the median the way the standard deviation pairs with the mean. Do not mix them up: median with interquartile range, mean with standard deviation.

And the line I want you to leave with: a mean without a spread is not a result. Three hundred milliseconds, three hundred plus or minus twelve, and three hundred plus or minus a hundred and eighty describe three completely different experiments.

## Slide 8. Visualisation Data

*177 words, about 73 seconds*

Plot your data before you summarise it. Always.

The histogram is your first look at any continuous variable. It shows you the shape, the spread, and whether there is a second peak hiding in there that a mean would completely conceal.

The bar chart compares counts across categories. Genotypes, treatment arms, cell types.

The pie chart shows proportions of a whole. I will show you these in R, but I want to be honest with you about them: the human eye compares lengths far better than it compares angles, so anything a pie chart shows, a bar chart shows more precisely. Use a pie only when "part of a whole" is genuinely the message and you have three or four categories.

One more warning that is not on the slide. A bar chart of group means with an error bar on top is extremely common in our field and it hides the entire distribution. If you have fewer than about twenty animals per group, plot every single point. It is more honest and it is more informative.

## Slide 9. Visualisation Data

*181 words, about 75 seconds*

The boxplot is the one you will use most for comparing a few groups side by side, so let us read it properly.

The box itself covers the middle fifty per cent of your data. Its bottom edge is the first quartile, its top edge is the third, and the line inside is the median.

Now the whiskers, and this is where almost everyone goes wrong. The whisker ends are not the minimum and the maximum. They reach out to the most extreme points that are still within one and a half interquartile ranges of the box. Anything beyond that gets plotted as an individual dot.

And those dots are not mistakes. They are your data. Deleting a point needs a reason you could defend in print, such as a documented equipment failure, not that it was inconvenient.

Quick question for you: what fraction of your data sits inside the box? Half. That is the whole point of it.

And whenever you show a boxplot, report the numbers alongside it: n, mean, median, standard deviation and interquartile range for each group.

## Slide 10. What Do Your Error Bars Mean?

*264 words, about 109 seconds*

Now a slide that is not usually taught at this stage, and it should be, because it is the single commonest source of confusion in neuroscience figures.

Every bar on the right of this slide comes from exactly the same data. Sixteen mice, mean three hundred milliseconds, standard deviation forty milliseconds. Same animals, same numbers, three completely different-looking error bars.

The first one is the standard deviation, forty milliseconds. That describes the animals. It tells you how much individual mice differ from each other. Crucially, it does not shrink if you test more mice, because mice do not become more similar just because you measured more of them.

The second is the standard error of the mean, which is the standard deviation divided by the square root of n. Forty over four is ten. That describes your knowledge, not your animals. It says how precisely you have pinned down the average.

The third is the ninety-five per cent confidence interval, about plus or minus twenty-one milliseconds here. That is the range of true means your data cannot rule out, and it is usually the most useful thing you can show a reader.

Notice that the standard error bars are the smallest. That is why they are the ones you see most often in papers, and I will let you draw your own conclusion about that.

What I want from you is simple. Whenever you plot an error bar, say in the caption which one it is. A figure that does not say is uninterpretable, and in your project reports it will cost you marks.

## Slide 11. Probability Basics

*82 words, about 34 seconds*

A short detour into probability, because we need a little of it to make sense of p-values later.

A probability is a number between zero and one. Zero means impossible, one means certain, and nothing lives outside that range. There is no such thing as a hundred and ten per cent likely, however often you hear it.

Certainty, probability one: a packed Tube at rush hour.

Impossibility, probability zero: snow in the Sahara.

And everything interesting in science lives strictly in between.

## Slide 12. Probability Basics

*85 words, about 35 seconds*

Two rules, and each one has a condition attached that matters more than the rule itself.

The first is the addition rule. If you want the probability of A or B, you add the two probabilities together.

But only if A and B are mutually exclusive, which means only one of them can happen. Rolling a one and rolling a two on a single die: those cannot both happen, so you can add. Being female and being left-handed: those can both happen, so you cannot.

## Slide 13. Probability Basics

*139 words, about 58 seconds*

The second rule is multiplication. The probability of A and B both happening is the product of their probabilities.

But again, only under a condition, and this one is the important one for the rest of the course. The two events have to be independent, which means one happening tells you nothing about whether the other happens.

Heads on the first toss and tails on the second: independent, so you multiply.

Now listen carefully, because I will collect on this after the break. Independence is an assumption, not a fact. Two recordings from the same animal are not independent. Twenty neurons patched from one mouse are not twenty independent observations. If you treat them as if they were, your statistics will tell you things that are not true, and I will show you exactly how badly in session two.

## Slide 14. Probability Basics

*82 words, about 34 seconds*

The third piece is counting. When every outcome is equally likely and they are mutually exclusive, a probability is just the number of outcomes you care about divided by the total number of outcomes.

So, what is the probability of throwing an even number on a fair die? Three faces out of six. A half.

That is easy. The thing to notice is the condition: equally likely. Real measurements almost never satisfy it, which is why we need distributions rather than counting.

## Slide 15. Expected Value & Law of Large Numbers

*199 words, about 82 seconds*

Expected value is the long-run average you would get if you repeated an experiment forever.

For a fair die, add the six faces and divide by six, and you get three point five. And notice that three point five is a number the die can never actually show. That is fine. Expected value is a property of the process, not a prediction about any single roll.

Here is the version you will actually use. A neuron fires on each trial with probability zero point two, and you record ten trials. The expected number of spikes is ten times zero point two, so two.

The law of large numbers says that as you collect more and more observations, the sample average closes in on that expected value. That is why we average over trials, and it is why a five-hundred-trial recording is steadier than a ten-trial one.

What it does not say, and this trips people up, is that any individual trial gets pulled back towards the average. The die has no memory. Neither does your neuron. After three quiet trials, nothing whatsoever makes the next one more likely to spike. That is the gambler's fallacy wearing a lab coat.

## Slide 16. Probability Distributions

*101 words, about 42 seconds*

Distributions come in two flavours, and the distinction is practical, not pedantic.

Discrete distributions live on whole numbers and describe things you count. Number of spikes. Number of plaques in a field of view. Number of goals in a season.

Continuous distributions describe things you measure, and can take any value in a range. Height, reaction time, cortical thickness.

Why does it matter? Because spike counts near zero are badly described by a continuous bell curve. The bell curve runs below zero and counts cannot. If you model counts with the wrong distribution you will get predictions that are physically impossible.

## Slide 17. Probability Distributions

*57 words, about 24 seconds*

All a probability distribution does is tell you how likely each possible outcome is.

That is it. It is a complete description of what the process can produce and how often.

Once you have that, you can ask how surprising your actual data are, and that question is what the whole of session two is built on.

## Slide 18. Probability Distributions: common

*146 words, about 60 seconds*

Three distributions will cover almost everything you meet as an undergraduate.

The binomial describes yes-or-no outcomes over a fixed number of trials. Did the neuron fire or not, on each of ten trials. Its mean is n times p, and its variance is n times p times one minus p.

The Poisson describes counts of events in a fixed window of time or space. Spikes per second, plaques per field. It has a lovely property: its mean and its variance are the same number, lambda. That is genuinely useful as a diagnostic. If your spike counts are far more variable than their mean, something beyond chance is driving them, and that is a result rather than a nuisance.

And the normal distribution describes continuous measurements, and is defined completely by just two numbers, a mean and a standard deviation.

We will take each one in turn.

## Slide 19. Probability Distributions: common

*105 words, about 43 seconds*

The binomial first.

Ten coin tosses, each with probability one half of coming up heads. The bars show the probability of getting zero heads, one head, two heads, and so on up to ten.

It is symmetric around five, because p is a half. If p were zero point two it would be bunched up on the left.

Mean is n times p, so ten times a half, five. Variance is n times p times one minus p, which is two point five.

Your neuron firing on each of ten trials with probability zero point two is exactly this distribution, just with a different p.

## Slide 20. Probability Distributions: common

*113 words, about 47 seconds*

Now the Poisson, which models counts of events in a fixed interval.

Here is the worked example on the slide. On average three point six people arrive at a booking counter every ten minutes at the weekend. What is the probability that exactly seven arrive in a given ten minutes?

Lambda is three point six, k is seven, and the answer comes out at about four point two per cent.

Swap the booking counter for a neuron and you have spikes per second. Swap it for a field of view and you have plaque counts. Same distribution, same arithmetic.

And remember, for a Poisson the mean and the variance are equal, both lambda.

## Slide 21. Probability Distributions: common

*134 words, about 55 seconds*

And the normal distribution, the one you have all seen.

The thing to appreciate is how little information it needs. Two numbers, a mean and a standard deviation, and the entire curve is fixed. Nothing else.

It is symmetric, so the mean, the median and the mode all sit on top of each other.

And the numbers underneath are worth committing to memory. About sixty-eight per cent of the area lies within one standard deviation of the mean. About ninety-five per cent within two. Ninety-nine point seven within three.

That sixty-eight, ninety-five, ninety-nine point seven lets you sanity-check any mean and standard deviation anyone ever gives you. And strictly it is one point nine six standard deviations for ninety-five per cent, which is where the ninety-five in "ninety-five per cent confidence interval" comes from.

## Slide 22. Central Limit Theorem (CLT)

*197 words, about 82 seconds*

This is the most important slide in session one, and it is also the most misquoted result in biology, so listen carefully.

The central limit theorem says this. Take a population, any population with a finite variance, and it does not matter in the slightest what shape it is. Now take a sample of thirty from it and work out the mean. Then do that again, and again, thousands of times.

Those sample means pile up in a normal distribution. Centred on the true mean, with a spread of sigma over the square root of n.

So why does that matter? Two reasons. First, it is what makes t-tests and ANOVA and regression legal on data that are not themselves normal, provided n is reasonable. Second, that square root of n is exactly why averaging trials reduces noise.

Now the part everyone gets wrong. Students say "my data are normal by the central limit theorem". They are not. Your data are as skewed as they ever were. It is the means that become normal, not the measurements.

And one practical consequence of the square root: to halve your error bar, you need four times as much data.

## Slide 23. Session1: Practical with R 15 minutes

*65 words, about 27 seconds*

Right, hands on keyboards.

Everything is at this address. It is on the handout as well, and the slides are in the repository too.

Clone it if you know git, or just download the ZIP from the green button and unzip it somewhere you can find again.

Who does not have R open right now? Good, let us sort that before I start the clock.

## Slide 24. Session1: Practical with R 15 minutes

*186 words, about 77 seconds*

Fifteen minutes, so here is what I actually want you to do.

Open RStudio and open script zero one, descriptive stats, from the scripts folder. That is the one that matters today.

To run a single line, put your cursor on it and press Control Enter, or Command Enter on a Mac. To run the whole file, press Source.

The script starts by reading a real data file, forty mice in two groups, which is how your own data will arrive. Then it works through means, medians, standard deviations and the plots.

When you have run it, I want you to change exactly one thing. Swap the exponential distribution for a normal one, and watch the mean and the median converge on each other. That is slide six happening in front of you.

If you finish early, scripts zero two and zero three are there. In script zero three, set n to two, then thirty, then five hundred, and rerun the central limit theorem plot.

If anything errors, the message is almost always about the working directory. Put your hand up and a demonstrator will come.

## Slide 25. Session1: Practical with R 15 minutes

*25 words, about 10 seconds*

This is roughly what your screen should look like. Code top left, console bottom left, plots on the right.

Carry on. I will walk round.

## Slide 26. Quick Check Questions – Session 1

*207 words, about 86 seconds*

Let us go through the quick check questions.

Question one. Why do we need statistics in neuroscience? Because our data are noisy for three separate reasons, biological variation, measurement noise and small samples, and we need to know which differences survive all three. And because we need to know when a study was simply too small to tell.

Question two. The five reaction times. The mean is two hundred and sixty-eight, the median is two hundred and forty. The median is more robust, because one slow participant moved the mean by twenty-eight milliseconds and left the median alone. I would report the median, and I would say why.

Question three. A neuron firing with probability zero point two over ten trials. Ten times zero point two, so two spikes expected.

Question four. The coin flips. With five flips the histogram is roughly symmetric around zero point five, but lumpy, because only six proportions are even possible: zero, zero point two, zero point four, zero point six, zero point eight and one. With fifty flips it is far smoother and much narrower. That is the law of large numbers and the central limit theorem working together.

Take ten minutes. When we come back, we go after Tasty Beer.

## Slide 27. Hypothesis Testing & P-values

*148 words, about 61 seconds*

Welcome back.

Hypothesis testing asks one question: is the effect I am looking at real, or is it the sort of thing chance produces anyway?

We set it up with two competing statements. The null hypothesis, H nought, is the boring one. No effect, no difference, nothing to report. The alternative, H one, says there is something there.

We then compute a test statistic, which is always some version of signal divided by noise, and from that we get a p-value.

And here is the definition I want you to be able to give me word for word. A p-value is the probability of observing data at least as extreme as yours, if the null hypothesis were true.

If that probability is below some threshold, conventionally zero point zero five, we reject the null.

I will come back to what a p-value is not, because that matters more.

## Slide 28. Hypothesis Testing & P-values

*95 words, about 39 seconds*

Here are the actual numbers from the brewery.

Tasty Beer produce half-litre bottles. There is always a little variation in how much goes in. The agency takes a random sample of ten bottles and measures them, and these are the ten readings.

Have a look at them. Several are over five hundred millilitres, several are under. One is four hundred and seventy-eight, which looks bad.

So how do we decide? We cannot just eyeball it. We need a way of asking whether a sample like this is the sort of thing an honest machine produces.

## Slide 29. Hypothesis Testing & P-values

*114 words, about 47 seconds*

First we state the hypotheses, and we state them before we look at anything.

The null is that Tasty Beer fills at least half a litre on average. That is the presumption of innocence.

The alternative is that they fill less than half a litre on average.

Notice this is one-sided. We only care about underfilling, because overfilling is not an offence, it is generosity. And we decided that direction in advance. If you choose the direction after seeing which way the data went, you are not testing a hypothesis, you are choosing your answer.

So the question becomes: how likely are we to see readings like these, if the machine really is honest?

## Slide 30. Hypothesis Testing & P-values

*200 words, about 83 seconds*

Which is exactly what a p-value measures.

Formally, the p-value is the probability, under the null hypothesis, of obtaining a result equal to or more extreme than the one you actually observed.

If that probability is smaller than our threshold alpha, usually zero point zero five, we reject the null and call it statistically significant.

Now, three things a p-value is not, and all three are misread constantly in published papers.

It is not the probability that the null hypothesis is true. It cannot be, because we computed it by assuming the null is true.

It is not the probability that your result will replicate. A p of zero point zero four does not mean a ninety-six per cent chance the next lab agrees with you. In practice it is far lower.

And it is not a measure of how big or how important the effect is. A tiny p-value can come from a trivial effect measured in a huge sample.

One more thing. Zero point zero five is a convention from the nineteen-twenties. It is not a law of nature. The evidence either side of that line is nearly identical, even though journals treat it as a cliff edge.

## Slide 31. Hypothesis Testing & P-values

*241 words, about 100 seconds*

So. Is Tasty Beer cheating?

Before I show you, hands up: who thinks the agency can prosecute on this evidence?

[pause for the vote]

Here are the numbers. The sample mean is zero point four nine seven one litres, so a shortfall of about two point nine millilitres per bottle. The standard deviation is zero point zero one zero four. Ten bottles.

That gives a t statistic of minus zero point eight eight, and a one-sided p-value of zero point two zero.

Zero point two zero. If the machine were completely honest, a sample this low would turn up about one time in five. That is not unusual at all. We cannot reject the null. On this evidence, Tasty Beer is not convicted.

Most of you had your hands up. Good. That is the useful bit.

Now look at the confidence interval, because it tells you more than the p-value does. It runs from zero point four eight nine seven to zero point five zero four five. It contains five hundred millilitres, so the data are perfectly compatible with an honest machine. But it also contains four hundred and ninety, so the data are equally compatible with a ten-millilitre shortfall.

Ten bottles simply cannot tell those two worlds apart.

And that is the point. Not guilty is not the same as innocent. Hold that thought, because in twenty minutes I am going to show you exactly how inadequate this inspection was.

## Slide 32. Errors in Hypothesis Testing

*206 words, about 85 seconds*

Which brings us to the two ways you can be wrong, and there are only two.

A type one error is a false positive. You reject the null when it was actually true. You announce an effect that is not there. The probability of that is alpha, the threshold you chose, usually zero point zero five.

A type two error is a false negative. You fail to reject the null when the alternative was actually true. There was a real effect and you missed it. The probability of that is beta.

And power is one minus beta. It is the probability that you correctly detect an effect that is genuinely there.

Here is the trade-off, and there is no way out of it. If you tighten alpha to zero point zero one to avoid false positives, you make false negatives more likely. No threshold avoids both.

Which error matters more depends entirely on the question. A false positive sends a whole field chasing an effect that does not exist. A false negative shelves a drug that works.

And I will be blunt about our own field. Small sample sizes make beta very large. Most published neuroscience worries carefully about alpha and quietly tolerates an enormous beta.

## Slide 33. Multiple Testing Problem

*233 words, about 96 seconds*

Now a problem that is pure arithmetic and is still everywhere.

Every test has a false positive rate of alpha, five per cent. Run one test, five per cent chance of a false positive. Fine.

But run many tests, and the chance that at least one of them comes up falsely significant climbs fast. The formula is one minus zero point nine five to the power of the number of tests.

Ten tests: forty per cent. Twenty tests: sixty-four per cent. Fifty tests: ninety-two per cent.

Think about what that means for a screen of a thousand genes. You are guaranteed false positives. Guaranteed.

The simplest fix is Bonferroni: divide alpha by the number of tests. Twenty tests, so test each one at zero point zero zero two five. That controls the chance of any false positive at all, and it is strict, so you pay for it in missed real effects.

The better choice for large screens is the false discovery rate, usually Benjamini-Hochberg, which controls the proportion of your findings that are false rather than the chance of any single error. In R both are one function, p dot adjust, and script zero seven shows you all three side by side.

The hard part is not the arithmetic. It is counting honestly. Every test you ran belongs in that number, including the three models you fitted and quietly did not report.

## Slide 34. Effect Size

*190 words, about 79 seconds*

A p-value tells you whether. An effect size tells you how much, and that is nearly always the question you actually care about.

Think about a clinical trial. A drug that reduces symptoms by one per cent and a drug that reduces them by thirty per cent can both give you a significant p-value. They are not the same drug.

Or in our own work, a brain volume difference of one cubic millimetre versus a hundred. Both can be significant with enough scans.

The standard measure is Cohen's d, which is the difference in means divided by the pooled standard deviation. Because it is unit-free, you can compare across measures. The rough conventions are zero point two small, zero point five medium, zero point eight large, and they are conventions, not thresholds.

For two continuous variables, the equivalent is the correlation coefficient r.

Here is what I want you to do in practice. Report the difference in the units you actually measured, with a confidence interval around it, every single time. "Thirty milliseconds faster, ninety-five per cent interval eight to fifty-two" tells a reader everything that a bare p-value hides.

## Slide 35. Parametric vs. Non-parametric Tests

*173 words, about 72 seconds*

Which test should you use? That decision splits into two families.

Parametric tests assume your data follow a known distribution, usually the normal. The t-test, ANOVA and Pearson correlation are all in this family.

Non-parametric tests are described as distribution-free. They work on ranks rather than the raw values, so they do not assume normality. Wilcoxon, Mann-Whitney and Spearman are the ones you will meet.

So why not just always use the non-parametric one and be safe?

Three reasons. Parametric tests are usually more powerful when their assumptions hold, so you find real effects more often. They extend naturally into regression, where you can adjust for age, sex and batch. And they test a statement about means, which is usually what you want to claim, whereas a rank test does not licence a statement about means at all.

Non-parametric is not assumption-free. It trades an assumption about shape for a loss of power and a different question. Script zero six runs two thousand simulated experiments and shows you the trade-off as actual numbers.

## Slide 36. The T-test

*195 words, about 81 seconds*

The t-test is the workhorse, and underneath it is very simple: signal divided by noise.

The signal is the difference you observed. The noise is the standard error of that difference, which is the spread divided by the square root of n.

There are three versions, and which one you use is decided by your design, not by your data.

One-sample, when you compare a mean against a fixed known value. That is the brewery: ten bottles against five hundred millilitres.

Two-sample, when you compare two independent groups. Drug against placebo.

And paired, when you measure the same subjects twice. Before and after training.

One practical note that will save you trouble. R's t dot test defaults to the Welch version, which does not assume the two groups have equal variances. Leave it alone. People set var dot equal equals TRUE out of habit and it buys them almost nothing.

And pairing is a design decision, not an analysis option. If you ran a paired design and analyse it as unpaired, you throw away the very thing that made it powerful. Script zero two in the exercises shows you that, and the difference is dramatic.

## Slide 37. Experimental Design

*177 words, about 73 seconds*

Before we talk about numbers of animals, a word about design, because design beats analysis every time.

A randomised controlled trial is the gold standard. Participants or animals are allocated to control or treatment at random, and the point of the randomisation is to make the groups comparable in everything you did not measure as well as everything you did.

Do not allocate by cage, by litter, or by the order the animals come out of the box. Those are all confounded with things you care about.

Blind whoever scores the outcome, and blind the analyst too if you can. Blinding measurably changes reported effect sizes, which tells you something uncomfortable about unblinded studies.

Pre-specify your primary outcome and your analysis before you collect anything. Everything else you look at afterwards is exploratory, and should be labelled as such.

And the challenges are real. You need a large enough sample, and that costs money and animals. Which is exactly why you work out how many you need in advance, rather than collecting until the p-value looks right.

## Slide 38. What Is Your n?

*232 words, about 96 seconds*

Now, the question I promised you back at the independence rule.

Here is a scenario that happens constantly. You patch sixty neurons. Twenty cells from each of three mice, in each of two groups.

What is your n? Is it sixty, or is it three?

Have a think. Hands up for sixty. Hands up for three.

It is three.

The mouse is what you randomised, and the mouse is what carries the treatment. Cells from one animal share its genotype, its surgery, the quality of that slice, and the day you recorded. They are not independent observations, they are twenty measurements of the same animal.

And look at what you do if you count them as independent. You claim n equals sixty when you really have three. Your standard error shrinks by a factor of about four and a half, your confidence intervals become far too narrow, and your false positive rate climbs well above the five per cent you think you are controlling.

The fix is straightforward. Either average the cells within each animal and test across animals, which is the simple option, or fit a mixed model with animal as a random effect, which is the version you will meet in your project.

This is one of the commonest statistical errors in published neuroscience, and once you know about it you will start spotting it in methods sections. Please do.

## Slide 39. Power & Sample Size

*232 words, about 96 seconds*

So, how many animals do you need?

Power is one minus beta, the probability of detecting an effect that is really there. It goes up with three things: a bigger true effect, a bigger sample, and a looser alpha. And it goes up if you reduce your measurement noise, which is often the cheapest option available.

The convention is eighty per cent power. Be clear about what that means: you are accepting a one in five chance of missing a real effect. That is already generous, and most neuroscience studies fall well below it.

Now, a warning about the formula on this slide, because it is easy to misuse. That formula gives you the sample size for a given precision, that is, for a confidence interval of a given width. Look at it: there is no beta in it and no effect size in it. So it cannot tell you the n you need for a given power. Those are different questions.

For power, use power dot t dot test in R, which is in script zero five. It asks you for the effect size and the power you want, and gives you n.

And one last thing. Power is something you calculate before you collect data. Computing it afterwards from your own observed effect, which people call post-hoc power, tells you literally nothing you did not already know from the p-value.

## Slide 40. Power & Sample Size

*154 words, about 64 seconds*

These curves show it better than any formula.

Sample size per group along the bottom, power up the side, and the dashed line is the eighty per cent we are aiming for.

The green curve is a large effect, Cohen's d of zero point eight. It crosses eighty per cent at about twenty-six animals per group.

The yellow curve is a medium effect, d of zero point five. Sixty-four per group.

And the red curve is a small effect, d of zero point three. A hundred and seventy-six animals per group.

Look at that progression. Halving the effect size roughly quadruples the sample you need.

So small effects are not cheaper to study. They are dramatically more expensive, and that is why so much of the literature on small effects is underpowered and unreliable. If you are planning a project on a subtle effect, this slide is the one to take to your supervisor.

## Slide 41. Power & Sample Size: Back to Tasty Beer

*158 words, about 65 seconds*

Which brings us all the way back to the brewery.

The agency tested ten bottles and got a p-value of zero point two zero. We said we could not convict.

Now ask the other question. Suppose the machine really were underfilling, filling four hundred and ninety-five millilitres instead of five hundred, a five-millilitre shortfall. Would ten bottles have caught it?

Forty-three per cent of the time. Less than half.

To have an eighty per cent chance of catching that same shortfall, they needed twenty-seven bottles. They tested ten.

So that non-significant result was never evidence that the machine was honest. It was evidence that the inspection was too small to tell.

And this is the habit I most want you to leave with today. Every time you read "no significant difference" in a paper, ask what that study could actually have detected. Very often the honest answer is: not much.

Absence of evidence is not evidence of absence.

## Slide 42. Session 2: Practical with R 15 minutes

*144 words, about 60 seconds*

Last practical, fifteen minutes.

The script that matters is zero four, the p-value simulation. It is the brewery, built by simulation rather than by formula, using the same ten bottle readings you saw on the slide. The number it prints should match what I showed you: zero point two zero. If it does not, tell me.

Then it runs the power calculation and prints the forty-three per cent and the twenty-seven.

When you have run it, change one thing. Pretend they tested thirty bottles with the same readings, by writing fill arrow rep bracket fill comma three. The shortfall has not changed at all. Watch what happens to the p-value, and explain to the person next to you why.

Scripts zero five to zero seven are take-home. They are written to be read as well as run, and the comments are the lecture notes.

## Slide 43. Quick Check Questions – Session 2

*259 words, about 107 seconds*

The session two quick check.

Question one. You compare hippocampal volume in patients and controls. The null hypothesis is that the mean volume is the same in the two groups. And a p-value of zero point zero one means that if the groups truly did not differ, a difference as large as the one you saw, or larger, would arise in about one study in a hundred like yours. Notice I did not say anything about the probability that the hypothesis is true.

Question two. Twenty independent tests at alpha zero point zero five. One minus zero point nine five to the power twenty, which is sixty-four per cent. Bonferroni would set your threshold at zero point zero five over twenty, so zero point zero zero two five. And effect size is more useful than a p-value because it tells you how big the difference is, which no p-value ever does.

Question three. Siblings follow a Poisson distribution, so the data are discrete and skewed. Median and interquartile range are the honest summaries, and a rank-based test is safer than a t-test. For the second half, the paired t-test on the pre and post reaction times should give you a clear improvement, and it is paired because you measured the same people twice.

Question four. Why is an underpowered study a problem? Two reasons. It usually misses effects that are really there. And the non-significant results it produces get read as evidence that there is no effect, which, as the brewery showed you, is simply not what they mean.

## Slide 44. Take-home Messages

*151 words, about 62 seconds*

Four things to take away.

Visualise your data first. Plots tell you more than tables, and the shape of a distribution decides which summary is honest.

A p-value is not truth. It answers one narrow question. Always think about effect size, and report a confidence interval alongside it.

Beware of errors and multiple testing. False positives are easy to manufacture, and you have to count every test you ran.

And good design and power matter. Plan before you collect data, not after. Know what your n actually is, and decide it in advance.

If you take one habit from today, make it this. Before you run any test at all, plot the data, and ask what your unit of replication is. Those two questions catch most of what goes wrong.

Everything is on GitHub, the scripts are commented to be read on their own, and my door is open. Thank you.
