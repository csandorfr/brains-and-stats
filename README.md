# Introduction to Statistics for Neuroscientists (BSc Neuroscience)

A short, hands-on course using **base R** to teach descriptive statistics,
visualisation, probability distributions, the central limit theorem,
p-values, errors and power, parametric vs non-parametric tests, multiple
testing and effect size, using neuroscience examples.

Two sessions of 45 minutes: 30 minutes of theory and 15 minutes in R.

Cynthia Sandor, UK Dementia Research Institute, Imperial College London.

## Quick start

1. Install R and RStudio **before the session** (see [`setup.md`](setup.md)).
2. Clone the repository:
   ```bash
   git clone https://github.com/csandorfr/brains-and-stats.git
   cd brains-and-stats
   ```
3. Open the folder in RStudio and run the core script for the session:
   ```r
   source("scripts/01_descriptive_stats_base.R")   # session 1
   source("scripts/04_pvalue_simulation.R")        # session 2
   ```

## What is in here

| Path | Contents |
|---|---|
| `course/BS_Neuroscience_statistics_2026.pptx` | The slides: 44 slides with speaker notes and click builds |
| `course/BS_Neuroscience_statistics_2026.pdf` | Flat reading copy, no animation |
| `course/speaker_script.md` | The spoken script, same text as the slide notes |
| `course/archive/` | The 2025 version of the deck |
| `scripts/` | Seven teaching scripts, 01 to 07. The comments are the notes |
| `exercises/` | The quick-check questions and worked solutions |
| `data/reaction_times.csv` | 40 animals in two groups, read by script 01 |
| [`syllabus.md`](syllabus.md) | Topic list for both sessions |
| [`CHANGES.md`](CHANGES.md) | What changed in this revision, and why |

**Session 1** runs scripts 01 to 03, **session 2** runs scripts 04 to 07.
One script per session is the realistic target in 15 minutes; the rest are
written to be read at home.

## The running example

Tasty Beer is accused of underfilling its 0.5 L bottles. The question is
posed in session 1 and answered in session 2: ten bottles give p = 0.20, so
the null is not rejected, but the inspection only had a 43% chance of
catching a real 5 mL shortfall and needed 27 bottles. The slides and
`scripts/04_pvalue_simulation.R` print the same numbers, so the lecture and
the practical agree.

Absence of evidence is not evidence of absence.
