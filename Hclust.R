library(dplyr)
library(philentropy)
data <- read.csv('/Users/abiramvyas/Documents/My_Projects/US_Accidents/Data_Subsets/pca_cali_data.csv')
data_dist <- dist(data)
data_scaled <- distance(as.matrix(data_dist), method="cosine")

data_hclust <- hclust(data_scaled,"complete")
plot(data_hclust)
rect.hclust(data_hclust,k = 6, border = 2:5)


