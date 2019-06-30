# 1. Uniform continuous model


# 2. 
# Mean of theoretical model = (a+b)/2
# SD f theoretical model = (b-a)/sqrt(12)


# 3. gets random variables 0:1 of Real Numbers
warpedArray = runif(100000,0.000,1.000)

# wraps into array with appropriate dimensions
dataContent = array(c(warpedArray), dim = c(1000,100))

# 4. 
# reporting sample mean of 100,000 set
mean(dataContent)

# reporting standard deviation of 100,000 set 
sd(dataContent)

# 5. display Uniform Histogram
hist(dataContent, main = "Histogram of 100,000 Observations", xlab = "Raw Data")

# tacks on rowmean onto array and rename
perRowMean = cbind(dataContent, rowMeans(dataContent[,1:100]))

# grabs only the last column which is just the mean column
perRowMean = perRowMean[,ncol(perRowMean)]


# 6. double transpose trick to get in vertical array
mean_Graph = t(t(perRowMean))

# 7.Display bell curve Histogram
hist(mean_Graph, main = "Histogram of 1,000 Sample means", xlab = " Sample Mean Values")

# 8. mean of sample mean
popMean = mean(perRowMean)

# variance of sample mean
variance = var(perRowMean)
variance
stdDev = sqrt(variance)
stdDev

# 9.
# on spreadsheet


# 10. 
probUpper = (popMean + stdDev) 
probUpper
probLower = (popMean - stdDev)
probLower



# 11. percent of random samples
#  checks each element row by row and see's if it fits between upper and lower.
# IF yes, add 1 and move on. The summation of THAT then gets divided by 1000 to get a percentage


for (row in 1: nrow(mean_Graph)){
  for(col in 1: ncol(mean_Graph)){
    if (mean_Graph[row, col] >= probLower && mean_Graph[row, col] <= probUpper)
      summation = summation + 1

  }
}

summation
summation = (summation/1000)
summation