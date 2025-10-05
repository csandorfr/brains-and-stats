scores <- round(rnorm(200, 70, 10)); hist(scores, col="lightblue", main="Histogram", xlab="Score")
methods <- c("Flashcards","Group","Solo","Online"); counts <- c(25,15,40,20)
barplot(counts, names.arg=methods, las=2, col="lightgreen", main="Bar chart")
pie_counts <- c(4,4,1,6,5); labels <- paste(c("SciFi","Comedy","Drama","Romance","Action"),
                                            "(", round(100*pie_counts/sum(pie_counts)),"%)")
pie(pie_counts, labels=labels, col=rainbow(5), main="Pie chart")
set.seed(456); placebo <- rnorm(50,300,40); drug <- rnorm(50,270,35)
boxplot(c(placebo,drug)~rep(c("Placebo","Drug"),each=50), col=c("coral","skyblue"), main="Boxplot")
