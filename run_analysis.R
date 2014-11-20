ProjectUrl ='https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip' # Specify Url for data
#a = tempfile() # Creat a temporary file to store the zip file
#download.file(ProjectUrl,a,mode="wb") # download the zip file from the internet
#unzip(a) # Extract Data to local hard drive

# Extract General Data

activityLabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE) # Extract label names for all data
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)

# Extract training data

trainingData = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE) # Extract Training Data
trainingLabels =read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE) # Extract Labels for training data
trainingSubjects = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE) # Extract Subjects for training data

# Extract test data

testData = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE) # Extract test Data
testLabels =read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE) # Extract Labels for test data
testSubjects = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE) # Extract Subjects for test data

# Fix naming of feutures for Columns of interest

features[,2] = gsub('-mean','Mean',features[,2])
features[,2] = gsub('-std','STD',features[,2])
features[,2] = gsub('\\(\\)','',features[,2])

# Add subject data to training and test data

trainingData$Subjects = trainingSubjects[,1]
testData$Subjects= testSubjects[,1]

# Add activity types to training and test data and convert to factor

testData$activty = rep(0,nrow(testLabels),1)
trainingData$activty = rep(0,nrow(trainingLabels),1)
for (i in 1:6) {
    
    testData$activty[testLabels == i] = as.character(activityLabels[i,2])
    trainingData$activty[trainingLabels == i] = as.character(activityLabels[i,2])
}
testData$activty = as.factor(testData$activty)
trainingData$activty = as.factor(trainingData$activty)



# Determine which columns contain the Mean and standard deviation before combining data sets

MeanSTDCol = grep(".*Mean.*|.*STD.*", features[,2])

# Append the last two columns to this list

MeanSTDCol=append(MeanSTDCol,c(ncol(testData)-1,ncol(testData)))

# Bind all data along rows

AllData = rbind(trainingData,testData)

# Add subject and activity to features list

colnames(AllData) = c(features$V2,'Subjects','Activity')

# Only select columns of interest

AllData = AllData[,MeanSTDCol]

AverageData = aggregate(AllData, by=list(Activity = AllData$Activity, Subjects=AllData$Subjects), mean)

# Remove duplicate activty and subject columns

AverageData = AverageData[,1:(ncol(AverageData)-2)]

# Write Data to a table

write.table(AverageData, "AverageData.txt", sep="\t")








