library(RevoScaleR)

### https://docs.microsoft.com/en-us/machine-learning-server/r/how-to-revoscaler-logistic-regression

# Pull in data
data("kyphosis", package="rpart")


# Create a Decision Tree
kyphTree <- rxDTree(Kyphosis ~ Age + Start + Number,
                    data = kyphosis, 
                    cp=0.01)


## Visualize the tree
library(RevoTreeView)
plot(createTreeView(kyphTree))

# Create a Logistic Regression
kyphLogit <- rxLogit(Kyphosis ~ Age + Start + Number,
                     data = kyphosis)
# Create a stepwise Model
kyphStepModel <-  rxLogit(Kyphosis ~ Age,
                          data = kyphosis,
                          variableSelection = rxStepControl(method="stepwise",
                                                            scope = ~ Age + Start + Number ))

#  A Larger Regression Tree Model
censusWorkers <- file.path(rxGetOption("sampleDataDir"),
                           "CensusWorkers.xdf")
rxGetInfo(censusWorkers, getVarInfo=TRUE)
incomeTree <- rxDTree(incwage ~ age + sex + wkswork1,
                      pweights = "perwt", 
                      maxDepth = 3,
                      minBucket = 30000,
                      data = censusWorkers)
incomeTree


