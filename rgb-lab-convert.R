#!/usr/bin/env Rscript
white <- c(x = 0.953205712549377, 1, y = 1.08538438164692)
red10.rgb <- structure(
  c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  .Dim = c(10L, 3L),
  .Dimnames = list( NULL, c("r", "g", "b"))
)
convertColor(red10.rgb, from = "sRGB", to = "Lab")
