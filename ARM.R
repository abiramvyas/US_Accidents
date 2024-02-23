install.packages("arules") 
install.packages("arulesViz")

library(arules) 
library(arulesViz) 

dataset = read.csv('/Users/abiramvyas/Documents/My_Projects/US_Accidents/colorado.csv')

set.seed = 220 # Setting seed 
associa_rules = apriori(data = dataset,  
                        parameter = list(support = 0.2,  
                                         confidence = 0.2)) 

# Plot 
itemFrequencyPlot(dataset, topN = 10) 

inspect(sort(associa_rules, by = 'confidence',decreasing = TRUE)[1:30]) 
plot(associa_rules, method = "graph",  
     measure = "confidence", shading = "lift") 

inspect(subset(rules, subset = items %in% "severity")[20])

rules <- apriori(discretizeDF(dataset),
                 parameter = list(minlen=2, supp=0.005, conf=0.8),
                 appearance = list(rhs=c("severity=1", "severity=2","severity=3","severity=4"),
                 default="lhs"),
                 control = list(verbose=F))


dataset$crossing <- as.factor(dataset$crossing)
dataset$sunrise_sunset <- as.factor(dataset$sunrise_sunset)
dataset$season <- as.factor(dataset$season)
dataset$severity <- as.factor(dataset$severity)
dataset$traffic_signal <- as.factor(dataset$traffic_signal)

rules <- apriori(discretizeDF(dataset),
                 parameter = list(minlen=2, supp=0.005, conf=0.8),
                 appearance = list(rhs=c("severity=1", "severity=2","severity=3","severity=4"),
                                   default="lhs"),
                 control = list(verbose=F))

inspect(sort(rules, by = 'support',decreasing = TRUE)[1:15])
inspect(sort(rules, by = 'confidence',decreasing = TRUE))
inspect(sort(rules, by = 'lift',decreasing = TRUE))

plot(rules, method = "graph", control = list(type = "items"))
plot(rules, method = "scatter")
