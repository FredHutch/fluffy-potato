#!/usr/bin/env Rscript
M <- matrix(1:300^2, nrow = 300)
tmp <- M %*% t(M)
max(tmp)
