# Code Book

This code book summarizes the resulting data fields in `final_tidy_set.txt`.

Original dataset: _https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip_

Original description: _http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones_

## Identifiers

* `Subject` - ID of test subject, type: _integer_
* `Activity` - Activity type, based on ID/type dictionary in original dataset, type: _factor_
  - `WALKING` = `1`
  - `WALKING_UPSTAIRS` = `2`
  - `WALKING_DOWNSTAIRS` = `3`
  - `SITTING` = `4`
  - `STANDING` = `5`
  - `LAYING` = `6`

## Measurements

Measurements are taken from original dataset and altered to more descriptive names:

                Original                                     Renamed
            tBodyAcc-mean()-X               TimeBodyAcceleration-mean()-X direction
            tBodyAcc-mean()-Y               TimeBodyAcceleration-mean()-Y direction
            tBodyAcc-mean()-Z               TimeBodyAcceleration-mean()-Z direction
            tBodyAcc-std()-X                TimeBodyAcceleration-std()-X direction
            tBodyAcc-std()-Y                TimeBodyAcceleration-std()-Y direction
            tBodyAcc-std()-Z                TimeBodyAcceleration-std()-Z direction
            tGravityAcc-mean()-X            TimeGravityAcceleration-mean()-X direction
            tGravityAcc-mean()-Y            TimeGravityAcceleration-mean()-Y direction
            tGravityAcc-mean()-Z            TimeGravityAcceleration-mean()-Z direction
            tGravityAcc-std()-X             TimeGravityAcceleration-std()-X direction
            tGravityAcc-std()-Y             TimeGravityAcceleration-std()-Y direction
            tGravityAcc-std()-Z             TimeGravityAcceleration-std()-Z direction
            tBodyAccJerk-mean()-X           TimeBodyAccelerationJerk-mean()-X direction
            tBodyAccJerk-mean()-Y           TimeBodyAccelerationJerk-mean()-Y direction
            tBodyAccJerk-mean()-Z           TimeBodyAccelerationJerk-mean()-Z direction
            tBodyAccJerk-std()-X            TimeBodyAccelerationJerk-std()-X direction
            tBodyAccJerk-std()-Y            TimeBodyAccelerationJerk-std()-Y direction
            tBodyAccJerk-std()-Z            TimeBodyAccelerationJerk-std()-Z direction
            tBodyGyro-mean()-X              TimeBodyGyroscope-mean()-X direction
            tBodyGyro-mean()-Y              TimeBodyGyroscope-mean()-Y direction
            tBodyGyro-mean()-Z              TimeBodyGyroscope-mean()-Z direction
            tBodyGyro-std()-X               TimeBodyGyroscope-std()-X direction
            tBodyGyro-std()-Y               TimeBodyGyroscope-std()-Y direction
            tBodyGyro-std()-Z               TimeBodyGyroscope-std()-Z direction
            tBodyGyroJerk-mean()-X          TimeBodyGyroscopeJerk-mean()-X direction
            tBodyGyroJerk-mean()-Y          TimeBodyGyroscopeJerk-mean()-Y direction
            tBodyGyroJerk-mean()-Z          TimeBodyGyroscopeJerk-mean()-Z direction
            tBodyGyroJerk-std()-X           TimeBodyGyroscopeJerk-std()-X direction
            tBodyGyroJerk-std()-Y           TimeBodyGyroscopeJerk-std()-Y direction
            tBodyGyroJerk-std()-Z           TimeBodyGyroscopeJerk-std()-Z direction
            tBodyAccMag-mean()              TimeBodyAccelerationMagnitude-mean()
            tBodyAccMag-std()               TimeBodyAccelerationMagnitude-std()
            tGravityAccMag-mean()           TimeGravityAccelerationMagnitude-mean()
            tGravityAccMag-std()            TimeGravityAccelerationMagnitude-std()
            tBodyAccJerkMag-mean()          TimeBodyAccelerationJerkMagnitude-mean()
            tBodyAccJerkMag-std()           TimeBodyAccelerationJerkMagnitude-std()
            tBodyGyroMag-mean()             TimeBodyGyroscopeMagnitude-mean()
            tBodyGyroMag-std()              TimeBodyGyroscopeMagnitude-std()
            tBodyGyroJerkMag-mean()         TimeBodyGyroscopeJerkMagnitude-mean()
            tBodyGyroJerkMag-std()          TimeBodyGyroscopeJerkMagnitude-std()
            fBodyAcc-mean()-X               FrequencyBodyAcceleration-mean()-X direction
            fBodyAcc-mean()-Y               FrequencyBodyAcceleration-mean()-Y direction
            fBodyAcc-mean()-Z               FrequencyBodyAcceleration-mean()-Z direction
            fBodyAcc-std()-X                FrequencyBodyAcceleration-std()-X direction
            fBodyAcc-std()-Y                FrequencyBodyAcceleration-std()-Y direction
            fBodyAcc-std()-Z                FrequencyBodyAcceleration-std()-Z direction
            fBodyAccJerk-mean()-X           FrequencyBodyAccelerationJerk-mean()-X direction
            fBodyAccJerk-mean()-Y           FrequencyBodyAccelerationJerk-mean()-Y direction
            fBodyAccJerk-mean()-Z           FrequencyBodyAccelerationJerk-mean()-Z direction
            fBodyAccJerk-std()-X            FrequencyBodyAccelerationJerk-std()-X direction
            fBodyAccJerk-std()-Y            FrequencyBodyAccelerationJerk-std()-Y direction
            fBodyAccJerk-std()-Z            FrequencyBodyAccelerationJerk-std()-Z direction
            fBodyGyro-mean()-X              FrequencyBodyGyroscope-mean()-X direction
            fBodyGyro-mean()-Y              FrequencyBodyGyroscope-mean()-Y direction
            fBodyGyro-mean()-Z              FrequencyBodyGyroscope-mean()-Z direction
            fBodyGyro-std()-X               FrequencyBodyGyroscope-std()-X direction
            fBodyGyro-std()-Y               FrequencyBodyGyroscope-std()-Y direction
            fBodyGyro-std()-Z               FrequencyBodyGyroscope-std()-Z direction
            fBodyAccMag-mean()              FrequencyBodyAccelerationMagnitude-mean()
            fBodyAccMag-std()               FrequencyBodyAccelerationMagnitude-std()
            fBodyBodyAccJerkMag-mean()      FrequencyBodyBodyAccelerationJerkMagnitude-mean()
            fBodyBodyAccJerkMag-std()       FrequencyBodyBodyAccelerationJerkMagnitude-std()
            fBodyBodyGyroMag-mean()         FrequencyBodyBodyGyroscopeMagnitude-mean()
            fBodyBodyGyroMag-std()          FrequencyBodyBodyGyroscopeMagnitude-std()
            fBodyBodyGyroJerkMag-mean()     FrequencyBodyBodyGyroscopeJerkMagnitude-mean()
            fBodyBodyGyroJerkMag-std()      FrequencyBodyBodyGyroscopeJerkMagnitude-std()
            subjectid                       Subject
            activity                        Activity

All measurements types are _numeric_

## Transformations

Values in data set are calculated in the following way: Mean values for _Measurements_ listed above are aggregated on basis of _Identifiers_ (_Activity_ then _Subject_)
