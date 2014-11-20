GettingCleaningDataProject
==========================

Project for Coursera course getting and cleaning data

Two Files are included:

run_analysis.R: This file extracts data collected from the accelerometers from the Samsung Galaxy S smartphone. 
		This data is then extracted into a training and test data set, with the activity and subjects labels extracted into seperate files.
		Following this features and activity names are extracted.
		The features are the names for all columns in the data sets, and the activity names provie details about the activity number provided with the original data sets activity labels.
		The features vector's names are then cleaned upto make their content more interpretable, this is only done for the mean and standard deviation names, as these are the only column required.
		The activity labels in the original data set are then added to both the training and test datasets, by comparing there values to the values provided in the activity details file.
		Following this the subject data and activity labels are appended to the orignal data frame for the training and test data.
		The columns with the mean and standard deviation are then determined based on the features vector, and the last two columns are appended to this list.
		Next a large data set is made by row binding the training and test sets.
		The large data sets column names are set by the features vector, which is appended with the activity and subjects labels.
		This large data set is the subset based on the features that are of interest.
		The mean of the large data set is then determined based on both the subject and activity type.
		Lastly, the data set is sorted.

CodeBookSamsung.txt: 	This file provides details about the output produced by run_analysis.R.
			In particular, what the column names mean, and what units they are measured in.
		
		
