set.seed(4)
normA<-rnorm(30,170,8); normB<-rnorm(30,175,8)
skewA<-rlnorm(30,0,0.7); skewB<-rlnorm(30,0.3,0.7)
cat("Normal data  t:", signif(t.test(normB,normA,var.equal=TRUE)$p.value,3),
    "  Wilcoxon:", signif(wilcox.test(normB,normA)$p.value,3), "\n")
cat("Skewed data  t:", signif(t.test(skewB,skewA,var.equal=TRUE)$p.value,3),
    "  Wilcoxon:", signif(wilcox.test(skewB,skewA)$p.value,3), "\n")
