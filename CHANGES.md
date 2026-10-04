# What changed

Every script in `scripts/` and `exercises/` was run end to end under
R 4.3.3 before release. All nine execute without error or warning.

## Corrections

**`scripts/04_pvalue_simulation.R`** is the substantive one. It previously
simulated a *different* observation from an underfilling machine, so the
p-value it printed never matched the ten bottle measurements on the slide,
and the comment asserted a value (`~0.02`) the code did not produce. It now
uses the ten measurements from the slide, so it prints mean 0.4971, p = 0.20
and a 95% CI of 0.4897 to 0.5045, matching the lecture exactly. It then adds
the power calculation that resolves the example: ten bottles had a 43% chance
of catching a real 5 mL shortfall; 27 were needed.

**`scripts/06_parametric_vs_nonparametric.R`** compared one t-test p-value
against one Mann-Whitney p-value and concluded the t-test was "more
powerful". One pair of p-values says nothing about power, and the lesson a
student takes is that the better test is whichever gives the smaller p. It
now runs 2000 simulated experiments and reports rejection rates: t-test
0.67 vs Mann-Whitney 0.64 on normal data, 0.29 vs 0.36 on skewed data, and
both near 0.05 when there is no effect. `var.equal = TRUE` removed, so
`t.test()` keeps its Welch default.

**`scripts/05_errors_power.R`** replaces the hand-rolled normal
approximation with `power.t.test()`, and solves for n: 176, 64 and 26 per
group for small, medium and large effects at 80% power. Adds a warning
about post-hoc power.

**`scripts/07_multiple_testing_effect_size.R`** adds `p.adjust()` on a
simulated 100-test screen, showing uncorrected, Bonferroni and BH side by
side, and reports the effect size with its confidence interval. The script
now narrates its own output rather than quoting invented numbers.

**`scripts/01_descriptive_stats_base.R`** now opens by reading
`data/reaction_times.csv` with `read.csv()`. Students previously finished
the course having never loaded a data file.

**`scripts/02_visualisation_base.R`** swaps the favourite-movie-genres
example for cell types, and draws the same counts as both a pie and a bar
chart so the comparison is the lesson rather than an assertion.

## Repairs

- `README.md` clone URL was `<your-org>/intro-stats-neuro`; now the real repo.
- `setup.md` and `syllabus.md` both opened with a stray `### filename`
  heading and an unclosed ```` ```markdown ```` fence, so GitHub Pages
  rendered each as one code block. Rewritten as plain Markdown.
- `_config.yml` added. The Pages workflow had no Jekyll config, so the site
  could not build correctly.
- `exercices/` renamed to `exercises/`, which is what `syllabus.md` already
  referred to. **This changes a path**: if anything links to the old folder,
  keep the old spelling and change `syllabus.md` instead.
- Exercise files renumbered to match the slides (Q1 to Q4 in both sessions);
  previously the slides, the `.txt` briefs and the solution scripts used
  three different numbering schemes for the same questions.
- `data/reaction_times.csv` added: 40 animals, two groups, one covariate.

## The slides

The deck is now `course/BS_Neuroscience_statistics_2026.pptx`, rebuilt from the
2025 PDF as editable PowerPoint. Same layout, same Arial, same navy and cyan,
same UK DRI logo and section footers, same figures in the same positions. The
2025 original is kept under `course/archive/`.

**Added throughout.** A word-for-word speaker script in the notes field of
every slide, about 48 minutes spoken across the two sessions, and fade
entrance builds on click, bullet group by bullet group, with figures appearing
after the text they belong to.

**Four new slides**, in the same house style:

- *Slide 10, What Do Your Error Bars Mean?* The same 16 mice drawn as SD, SEM
  and 95% CI. This is also where the confidence interval gets defined, which
  the rest of the deck had been assuming.
- *Slide 31, the verdict on Tasty Beer.* The deck previously posed the
  question on slide 4, set up the test, and stopped. Anyone revising from the
  slides never found out the answer.
- *Slide 38, What Is Your n?* Pseudoreplication: 60 neurons from 3 mice is
  n = 3, not n = 60.
- *Slide 41, back to the brewery.* 10 bottles tested, 43% power, 27 needed.

**Two corrections to existing slides:**

- The power slide called n = (Z·σ/E)² a sample size estimate. That formula
  contains no β and no effect size, so it sizes a confidence interval, not a
  power calculation. The heading now says so and points at `power.t.test()`.
- The boxplot slide promised "Table of summary statistics: Mean, Median, SD,
  etc." with no table beneath it. The line is now a complete instruction.

**Typographical fixes:** "eight" for "height" twice, "H0 is rue", "Questiions"
twice, a stray "same" in five footers, a Q3-to-Q5 jump in the session 1 quick
check, the `exercices/scripts/` path in both practical slides, three footers
that still read "Parametric vs. Non-parametric tests" on the design and power
slides, and "UKRI Future Leader Fellow" on the cover.

Titles are now centred consistently in a full-width box; in the original they
drifted by up to 30 points between slides.

**Note on the speaker script.** It is embedded in the `.pptx` notes and
duplicated in `course/speaker_script.md`, so in a public repository anyone can
read exactly what you plan to say. If you would rather it stayed private,
delete `speaker_script.md` and strip the notes from the published copy of the
deck.
