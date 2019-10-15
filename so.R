# packageVersion("microbenchmark")
# # [1] ‘1.4.7’
# packageVersion("ggplot2")
# # [1] ‘3.2.1’
gc()

set.seed(128)
myvec <- rnorm(1e7, 128, 128)  #or making a vector with 1e7 elements

myvecsorted <- sort(myvec)

mysumU = 0
mysumS = 0

SvU <- microbenchmark::microbenchmark(
  Unsorted = for (i in 1:length(myvec)) {
    
    if (myvec[i] > 128) {
      mysumU = mysumU + myvec[i]
    }
    
  } ,
  Sorted = for (i in 1:length(myvecsorted)) {
    
    if (myvecsorted[i] > 128) {
      mysumS = mysumS + myvecsorted[i]
    }
    
  } ,
  times = 1)

png(filename = paste0(getwd(), "/pics/test1.png"))
# ggplot2::autoplot(SvU)
boxplot(SvU, by = "expr")
dev.off()

