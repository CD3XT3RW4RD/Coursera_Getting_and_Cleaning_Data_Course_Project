
library(dplyr)

##Preparation of dataset1: download and extract

if(!file.exists("./data")){dir.create("./data")} ##check whether data directory exists
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" ##URL of dataset
download.file(fileurl, "./data/dataset.zip", method = "curl") ##download dataset
fileurl_downloaded <- Sys.time() ##timestamp of download
unzip("./data/dataset.zip", exdir = "./data") ##extract dataset
print("file downloaded")
print(fileurl_downloaded)

##Preparation of dataset2: File locations in extracted structure

subject_train_file <- "./data/UCI HAR Dataset/train/subject_train.txt" ##train file set
x_train_file <- "./data/UCI HAR Dataset/train/x_train.txt" ##train file set
y_train_file <- "./data/UCI HAR Dataset/train/y_train.txt" ##train file set

subject_test_file <- "./data/UCI HAR Dataset/test/subject_test.txt" ##test file set
x_test_file <- "./data/UCI HAR Dataset/test/x_test.txt" ##test file set
y_test_file <- "./data/UCI HAR Dataset/test/y_test.txt" ##test file set

features_file <- "./data/UCI HAR Dataset/features.txt" ##list of all features

activity_labels_file <- "./data/UCI HAR Dataset/activity_labels.txt" ##activity labels

##Preparation of dataset3: Read in files to dataframes

subject_train <- read.table(subject_train_file) ##read in subject_train.txt
print(c("subject_train read in, dimensions:",dim(subject_train)))
x_train <- read.table(x_train_file) ##read in x_train.txt
print(c("x_train read in, dimensions:",dim(x_train)))
y_train <- read.table(y_train_file) ##read in y_train.txt
print(c("y_train read in, dimensions:",dim(y_train)))

subject_test <- read.table(subject_test_file) ##read in subject_test.txt
print(c("subject_test read in, dimensions:",dim(subject_test)))
x_test <- read.table(x_test_file) ##read in x_test.txt
print(c("x_test read in, dimensions:",dim(x_test)))
y_test <- read.table(y_test_file) ##read in y_test.txt
print(c("y_test read in, dimensions:",dim(y_test)))

features <- read.table(features_file) ##read in features.txt
print(c("features read in, dimensions:",dim(features)))
activity_labels <- read.table(activity_labels_file) ##read in activity_labels.txt
print(c("activity_labels read in, dimensions:",dim(activity_labels)))

##Preparation of dataset4: column names for x sets from features, for y/subject sets, descriptive column name generated

colnames(x_test) <- features[,2] ##feature_labels 2nd column
colnames(x_train) <- features[,2] ##feature_labels 2nd column
colnames(y_test) <- "activityid"
colnames(y_train) <- "activityid"
colnames(subject_test) <- "subjectid"
colnames(subject_train) <- "subjectid"

##Preparation of dataset5: descriptive column names for activity labels

colnames(activity_labels) <- c('activityid','activity')

##Stitching datasets for test and train

train_set <- cbind(x_train,y_train,subject_train)
print("train_set generated")
test_set <- cbind(x_test,y_test,subject_test)
print("test_set generated")

write.table(train_set,"./data/train_set.txt")
write.table(test_set,"./data/test_set.txt")
print("backup train/test sets done")

full_set <-rbind(train_set,test_set)
print("full_set generated")

write.table(full_set,"./data/full_set.txt")
print("backup full set done")

##Full set with activity names based on activity_labels

full_set_w_activities <- merge(full_set, activity_labels, by="activityid", all.x=T) ##activityid is common by "design"
print("backup full set done") ##activities added to full set

##Deduct needed set of columns

needed_column_set <- grepl("mean\\(\\)|std\\(\\)|^subjectid|^activity$",names(full_set_w_activities)) ##mean/std/subjectid/activity T/F vector for filtering
mean_and_std_set <- full_set_w_activities[,needed_column_set] ##filtered set by vector
print("mean/std/subjectid/activity set created")

##Add descriptive names for columns
names(mean_and_std_set) <- gsub("Acc", "Acceleration", names(mean_and_std_set))
names(mean_and_std_set) <- gsub("Mag", "Magnitude", names(mean_and_std_set))
names(mean_and_std_set) <- gsub("Gyro", "Gyroscope", names(mean_and_std_set))
names(mean_and_std_set) <- gsub("^t", "Time", names(mean_and_std_set))
names(mean_and_std_set) <- gsub("^f", "Frequency", names(mean_and_std_set))
names(mean_and_std_set) <- gsub("X$", "X direction", names(mean_and_std_set))
names(mean_and_std_set) <- gsub("Y$", "Y direction", names(mean_and_std_set))
names(mean_and_std_set) <- gsub("Z$", "Z direction", names(mean_and_std_set))
names(mean_and_std_set) <- gsub("^subjectid$", "Subject", names(mean_and_std_set))
names(mean_and_std_set) <- gsub("^activity$", "Activity", names(mean_and_std_set))
print("setting descriptive column names done")

##Generating final tidy set by grouping and putting result to file
final_tidy_set <- mean_and_std_set ##initialize final set
final_tidy_set <- final_tidy_set %>% group_by(Activity,Subject) %>% summarize_all(funs(mean)) ##6 activity x 30 subject , dimensions will be 180 x 68 (variables) Grouping by activity, then subject
write.table(final_tidy_set,"./final_tidy_set.txt", row.names = F)
print("final tidy set created and backed up")
print("final tidy data set:")
final_tidy_set

