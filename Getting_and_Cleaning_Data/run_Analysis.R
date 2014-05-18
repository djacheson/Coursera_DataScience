setwd("D:\\GitHub\\Coursera_DataScience\\Getting_and_Cleaning_Data\\UCI HAR Dataset")


run_Analysis <- function() {
    require(stringr)
    require(data.table)
    
    #Read Features
    features <- read.table(file="features.txt",col.names=c("featureNumber","featureName"))
    
    #Read Activity Labels
    labels <- read.table(file="activity_labels.txt",col.names=c("Activity_Number","Activity_Label"))
    
    #Read train, and then extract columns with mean and std in the name
    X_train <- read.table(file=".\\train\\X_train.txt",header=F)
    X_test <- read.table(file=".\\test\\X_test.txt",header=F)
    names(X_train) <- features$featureName
    names(X_test) <- features$featureName
    
    #mean and std booleans
    meanBool <- str_detect(features$featureName,"mean()")
    stdBool <- str_detect(features$featureName,"std()")
    mean_stdBool <- meanBool | stdBool
    
    X_train <- X_train[mean_stdBool]
    X_test <- X_test[mean_stdBool]
    
    #Read Y_data, which is the activity
    #re-label the numbers as the activity 
    
    Y_train <- read.table(file=".\\train\\y_train.txt",header=F)
    Y_test <- read.table(file=".\\test\\y_test.txt",header=F)
    names(Y_train) <- "Activity_Number"
    names(Y_test) <- "Activity_Number"
    
    Y_train <- merge(Y_train, labels)
    Y_test <- merge(Y_test, labels)
    
    #Read subject data
    subject_train <- read.table(file="./train/subject_train.txt")
    names(subject_train) <- "subject"
    subject_test <- read.table(file="./test/subject_test.txt")
    names(subject_test) <- "subject"

    
    #Start combining the data
    train_All <- cbind(subject_train,X_train,Y_train)
    test_All <- cbind(subject_test,X_test,Y_test)
    
    data_Combined <- data.table(rbind(train_All,test_All))
    tidy <- data[, lapply(.SD,mean), by="subject,Activity_Label"]
    return(tidy)

}

