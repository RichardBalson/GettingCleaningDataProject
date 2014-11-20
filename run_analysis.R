ProjectUrl ='https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip' # Specify Url for data
a = tempfile() # Creat a temporary file to store the zip file
download.file(ProjectUrl,a,mode="wb") # download the zip file from the internet
