# R script to calculate nPVI values 
# Programmed by: Hubert Léveillé Gauvin, Ohio State University
# Date: 13 Oct. 2015

# The npvi function takes an argument x of numerical values 
# representing note durations and computes the npvi value 
# using the formula designed by Low, Grabe, and Nolan (2000).

npvi<-function(x){
data<-x
m<-length(data)
data.normalized = NULL
for (i in 0:(m-1)) {
data.normalized[i] = abs(2*(data[i]-data[i+1])/(data[i]+data[i+1]))
}
sum<-sum(data.normalized[0:(m-1)])
npvi<-(100*sum)/(m-1)
npvi
}

# Example:
# > data <- read.table("FILENAME", header = FALSE)
# > data
#     V1
# 1  1.00
# 2  1.50
# 3  0.50
# 4  0.66
# > npvi(data$V1)
# [1] 55.86207

# Reference: Low, E. L., Grabe, E., & Nolan, F. (2000). Quantitative 
# characterizations of speech rhythm: syllable-timing in Singapore 
# English. Language & Speech, 43 (4), 377–401.