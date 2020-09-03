#!/usr/bin/env Rscript
M <- matrix(1:300^2, nrow = 300)
Mt <- t(M)
tmp <- M %*% Mt
max(tmp)
which(tmp == max(tmp), arr.ind = TRUE)
