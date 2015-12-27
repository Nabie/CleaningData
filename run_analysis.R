# in both directory test and train y is activity
# subject is the subject_id involve in the activity
# both directory are in the working directory
#setwd("./Coursera")

# put together information about the train

xtrain <- read.table("./train/X_train.txt",header = FALSE)
ytrain <- read.table("./train/y_train.txt",header = FALSE)
subjtrain <- read.table("./train/subject_train.txt",header = FALSE)
train <- data.frame(xtrain,subjtrain,ytrain)

# put together information about the test

xtest <- read.table("./test/X_test.txt", header = FALSE)
ytest <- read.table("./test/y_test.txt", header = FALSE)
subjtest <- read.table("./test/subject_test.txt", header = FALSE)
test <- data.frame(xtest,subjtest,ytest)

#merge the training and test sets

train_test <- rbind(train,test)

# labelling the variables
# variables names are in the dataset "features.txt"
feat <- read.table("features.txt",header = FALSE, stringsAsFactors = FALSE)
name <- c(feat[,2],"subject_id","activity")
names(train_test)<-name

# selecting the variables names that contain mean or std
ms <- grepl("mean\\(\\)|std\\(\\)" , names(train_test))

nameMS <- c(names(train_test)[ms],"subject_id","activity")
train_test <- train_test[, nameMS ]

# label the activity with activity name in "activity_labels.txt"
label <- read.table("activity_labels.txt", header = FALSE,stringsAsFactors = FALSE)
train_test$activity <- as.factor(train_test$activity)
levels(train_test$activity) <- label[,2]

# name the variables with descriptives names
names(train_test) <- make.names(names(train_test), unique = TRUE)
names(train_test) <- gsub(pattern = "\\.+", "\\.", names(train_test))
names(train_test) <- gsub(pattern = "\\.$", "", names(train_test))

#changing the variable using gsub
# pat=patter, remp = replacement
pat <- c("tBodyAcc.mean", "tBodyAcc.std", "tGravityAcc.mean", "tGravityAcc.std", 
         "tBodyAccJerk.mean", "tBodyAccJerk.std", "tBodyGyro.mean", "tBodyGyro.std", 
         "tBodyGyroJerk.mean", "tBodyGyroJerk.std", "tBodyAccMag.mean", 
         "tBodyAccMag.std", "tGravityAccMag.mean", "tGravityAccMag.std", 
         "tBodyAccJerkMag.mean", "tBodyAccJerkMag.std", "tBodyGyroMag.mean", 
         "tBodyGyroMag.std", "tBodyGyroJerkMag.mean", "tBodyGyroJerkMag.std", 
         "fBodyAcc.mean", "fBodyAcc.std", "fBodyAccJerk.mean", "fBodyAccJerk.std",
         "fBodyGyro.mean", "fBodyGyro.std", "fBodyAccMag.mean", "fBodyAccMag.std")

remp <-c("mean.BodyAccelaration.Fromtime", "standardDeviation.BodyAccelaration.Fromtime", 
        "mean.GravityAccelaration.Fromtime", "standardDeviation.GravityAccelaration.Fromtime", 
        "mean.JerkFromBodyAccelaration.Fromtime", "standardDeviation.JerkFromBodyAccelaration.Fromtime", 
        "mean.BodyAngularVelocity.Fromtime", "standardDeviation.BodyAngularVelocity.Fromtime", 
        "mean.JerkFromBodyAngularVelocity.Fromtime", "standardDeviation.JerkFromBodyAngularVelocity.Fromtime", 
        "mean.Magnitude.dyAccelaration.Fromtime", "standardDeviation.Magnitude.BodyAccelaration.Fromtime", 
        "mean.Magnitude.GravityAccelaration.Fromtime", "standardDeviation.Magnitude.GravityAccelaration.Fromtime",
        "mean.Magnitude.JerkFromBodyAccelaration.Fromtime", "standardDeviation.Magnitude.JerkFromBodyAccelaration.Fromtime",
        "mean.magnitude.BodyAngularVelocity.Fromtime", "standardDeviation.magnitude.BodyAngularVelocity.Fromtime",
        "mean.magnitude.JerkFromBodyAngularVelocity.Fromtime","standardDeviation.magnitude.JerkFromBodyAngularVelocity.Fromtime",
        "mean.frequencyOfBodyAccelaration", "standardDeviation.frequencyOfBodyAccelaration",
        "mean.frequencyOfJerkFromBodyAccelaration", "standardDeviation.frequencyOfJerkFromBodyAccelaration",
        "mean.frequencyOfBodyAngularVelocity", "standardDeviation.frequencyOfBodyAngularVelocity",
        "mean.Magnitude.frequencyOfBodyAccelaration", "standardDeviation.Magnitude.frequencyOfBodyAccelaration")

for (i in seq_along(pat)){
  names(train_test) <- gsub(pattern = pat[i], remp[i], names(train_test))
}

# Calculate the average of each variable by subject and activity

library(dplyr)
library(tidyr)

train_test <- tbl_df(train_test)

train_test_ms <- train_test %>% 
  group_by(subject_id, activity) %>%
  summarise_each(funs(mean))   %>%      # compute the mean by subject_id an activity
  select( subject_id, activity,
         ends_with("X"), ends_with("Y"),ends_with("Z")) #meetind tidy data criteria
 


tidy <-gather(train_test_ms, variable, value, 3:50)
tidy <- as.data.frame(tidy)

#compute variable "direction" from "variable" in tidy dataset
tidy$directin <- sapply(as.character(tidy$variable), 
                      function(x) substr(x,nchar(x),nchar(x)))

#compute variable "var" from "variable" in tidy dataset
tidy$var <- sapply(as.character(tidy$variable), 
                 function(x) substr(x,1,nchar(x)-2))

# drop variable "variable"
tidy <- tidy[, c(1,2,4:6)]

#
tidy_data <- spread(tidy, var, value)

#write the tidy_data in folder cleaningData
if (!file.exists("cleaningData")){ dir.create("cleaningData")}
write.table(tidy_data, "./cleaningData/tidy_data.txt", col.names = TRUE, row.names = FALSE)
