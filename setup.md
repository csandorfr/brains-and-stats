# Setup

Do this **before** the session. Fifteen minutes is not enough time to
install anything.

## 1. Install R

Windows, macOS and Linux: <https://cran.r-project.org>

Install R first, then RStudio. RStudio will not work without R.

## 2. Install RStudio

RStudio Desktop (free): <https://posit.co/download/rstudio/>

## 3. Check it works

Open RStudio and type these two lines into the Console, pressing Enter
after each:

```r
2 + 2
hist(rnorm(100), col = "lightblue")
```

You should see `4` and a histogram. If you do, you are ready.

## 4. Get the course files

Either clone the repository:

```bash
git clone https://github.com/csandorfr/brains-and-stats.git
```

or download the ZIP from the GitHub page and unzip it somewhere you can
find again.

## If something goes wrong

The commonest error is `cannot open file`. That means R is looking in the
wrong folder. In RStudio use **Session > Set Working Directory > To Source
File Location**, or run `setwd("path/to/brains-and-stats")`.

Bring any remaining problem to the start of the session, not minute 14.
