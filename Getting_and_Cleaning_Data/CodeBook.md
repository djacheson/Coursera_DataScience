##Codebook for Human Activity Recognition Using Smartphones Data Set 
====================================================================

###This codebook is for a tidy dataset (tidy.txt) that includes subject IDs, activity labels, and various measures (mean and standard deviation) of various activity measurements of 30 participants wearing a smartphone (Samsung Galaxy SII) from the UCI Machine Learning Repository: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

###The description of the features from the UCI Repository is as follows:

####The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

####Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

####Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

================
###Tidy Dataset:
================
###The measures were extracted from a larger dataset using the script makeTidy.R. The script combined training and test sets from the UCIDescriptions of the steps involved in creating this dataset are described in README.md.

###Below is a list of the variables included in the tidy dataset, a description for each, and the units of measurement (in parenthesis):

1.  subject	ID of subject
2.  Activity_Label	Text label of the activity the subject was performing (e.g., WALKING)
3.  tBodyAcc-mean()-X	Time Domain:  Mean of body acceleration in X direction (m / sec^2)
4.  tBodyAcc-mean()-Y	Time Domain:  Mean of body acceleration in Y direction (m / sec^2)
5.  tBodyAcc-mean()-Z	Time Domain:  Mean of body acceleration in Z direction (m / sec^2)
6.  tBodyAcc-std()-X	Time Domain:  Standard Deviation of body acceleration in X direction (m / sec^2)
7.  tBodyAcc-std()-Y	Time Domain:  Standard Deviation of body acceleration in Y direction (m / sec^2)
8.  tBodyAcc-std()-Z	Time Domain:  Standard Deviation of body acceleration in Z direction (m / sec^2)
9.  tGravityAcc-mean()-X	Time Domain:   Mean of gravity acceleration in X direction (m / sec^2)
10.  tGravityAcc-mean()-Y	Time Domain:   Mean of gravity acceleration in Y direction (m / sec^2)
11.  tGravityAcc-mean()-Z	Time Domain:  Mean of gravity acceleration in Z direction (m / sec^2)
12.  tGravityAcc-std()-X	Time Domain:  Standard Deviation of gravity acceleration in X direction (m / sec^2)
13.  tGravityAcc-std()-Y	Time Domain:  Standard Deviation of gravity acceleration in Y direction (m / sec^2)
14.  tGravityAcc-std()-Z	Time Domain:  Standard Deviation of gravity acceleration in Z direction (m / sec^2)
15.  tBodyAccJerk-mean()-X	Time Domain:  Mean body linear acceleration in X direction (m / sec^2 )
16.  tBodyAccJerk-mean()-Y	Time Domain:  Mean body linear acceleration in Y direction  (m / sec^2 )
17.  tBodyAccJerk-mean()-Z	Time Domain:  Mean body linear acceleration in Z direction  (m / sec^2 )
18.  tBodyAccJerk-std()-X	Time Domain:  Standard Devision of linear acceleration in X direction (m / sec^2 )
19.  tBodyAccJerk-std()-Y	Time Domain:  Standard Devision of linear acceleration in Y direction  (m / sec^2 )
20.  tBodyAccJerk-std()-Z	Time Domain:  Standard Devision of linear acceleration in Z direction  (m / sec^2 )
21.  tBodyGyro-mean()-X	Time Domain:  Mean body angular velocity in X direction (radians / sec)
22.  tBodyGyro-mean()-Y	Time Domain:  Mean body angular velocity in Y direction (radians / sec)
23.  tBodyGyro-mean()-Z	Time Domain:  Mean body angular velocity in Z direction (radians / sec )
24.  tBodyGyro-std()-X	Time Domain:  Standard Deviation body angular velocity in X direction (radians / sec)
25.  tBodyGyro-std()-Y	Time Domain:  Standard Deviation body angular velocity in Y direction (radians / sec )
26.  tBodyGyro-std()-Z	Time Domain:  Standard Deviation body angular velocity in Z direction (radians / sec)
27.  tBodyGyroJerk-mean()-X	Time Domain:  Mean combined linear acceleration and angular velocity in X direction 
28.  tBodyGyroJerk-mean()-Y	Time Domain:  Mean combined linear acceleration and angular velocity in Y direction 
29.  tBodyGyroJerk-mean()-Z	Time Domain:  Mean combined linear acceleration and angular velocity in Z direction 
30.  tBodyGyroJerk-std()-X	Time Domain:  Standard Deviation combined linear acceleration and angular velocity in X direction 
31.  tBodyGyroJerk-std()-Y	Time Domain:  Standard Deviation combined linear acceleration and angular velocity in Y direction 
32.  tBodyGyroJerk-std()-Z	Time Domain:  Standard Deviation combined linear acceleration and angular velocity in Z direction 
33.  tBodyAccMag-mean()	Time Domain:  Mean Euclidean Norm of Body Acceleration (m / sec^2)
34.  tBodyAccMag-std()	Time Domain:  Standard Deviation Euclidean Norm of Body Acceleration (m / sec^2)
35.  tGravityAccMag-mean()	Time Domain:  Mean Euclidean Norm of Gravity Acceleration (m / sec^2)
36.  tGravityAccMag-std()	Time Domain:  Standard Deviation Euclidean Norm of Gravity Acceleration (m / sec^2)
37.  tBodyAccJerkMag-mean()	Time Domain:  Mean Euclidean Norm of Linear acceleration (m / sec^2)
38.  tBodyAccJerkMag-std()	Time Domain:  Standard Deviation Euclidean Norm of Linear acceleration (m / sec^2)
39.  tBodyGyroMag-mean()	Time Domain:  Mean Euclidean Norm of body angular velocity (radians / sec)
40.  tBodyGyroMag-std()	Time Domain:  Standard Deviation Euclidean Norm of body angular velocity (radians / sec)
41.  tBodyGyroJerkMag-mean()	Time Domain:  Mean Euclidean norm of combined linear acceleration and angular velocity
42.  tBodyGyroJerkMag-std()	Time Domain:  Standard Deviation Euclidean norm of combined linear acceleration and angular velocity
43.  fBodyAcc-mean()-X	Frequency Domain:  Mean of body acceleration in X direction (m / sec^2)
44.  fBodyAcc-mean()-Y	Frequency Domain:  Mean of body acceleration in Y direction (m / sec^2)
45.  fBodyAcc-mean()-Z	Frequency Domain:  Mean of body acceleration in Z direction (m / sec^2)
46.  fBodyAcc-std()-X	Frequency Domain:  Standard Deviation of body acceleration in X direction (m / sec^2)
47.  fBodyAcc-std()-Y	Frequency Domain:  Standard Deviation of body acceleration in Y direction (m / sec^2)
48.  fBodyAcc-std()-Z	Frequency Domain:  Standard Deviation of body acceleration in Z direction (m / sec^2)
49.  fBodyAcc-meanFreq()-X	Frequency Domain: Mean across frequencies of body acceleration in X direction (m / sec^2)
50.  fBodyAcc-meanFreq()-Y	Frequency Domain: Mean across frequencies of body acceleration in Y direction (m / sec^2)
51.  fBodyAcc-meanFreq()-Z	Frequency Domain: Mean across frequencies of body acceleration in Z direction (m / sec^2)
52.  fBodyAccJerk-mean()-X	Frequency Domain:  Mean body linear acceleration in X direction (m / sec^2 )
53.  fBodyAccJerk-mean()-Y	Frequency Domain:  Mean body linear acceleration in Y direction  (m / sec^2 )
54.  fBodyAccJerk-mean()-Z	Frequency Domain:  Mean body linear acceleration in Z direction  (m / sec^2 )
55.  fBodyAccJerk-std()-X	Frequency Domain:  Standard Devision of linear acceleration in X direction (m / sec^2 )
56.  fBodyAccJerk-std()-Y	Frequency Domain:  Standard Devision of linear acceleration in Y direction  (m / sec^2 )
57.  fBodyAccJerk-std()-Z	Frequency Domain:  Standard Devision of linear acceleration in Z direction  (m / sec^2 )
58.  fBodyAccJerk-meanFreq()-X	Frequency Domain: Mean across frequencies of linear acceleration in X direction (m / sec^2)
59.  fBodyAccJerk-meanFreq()-Y	Frequency Domain: Mean across frequencies of linear acceleration in Y direction (m / sec^2)
60.  fBodyAccJerk-meanFreq()-Z	Frequency Domain: Mean across frequencies of linear acceleration in Z direction (m / sec^2)
61.  fBodyGyro-mean()-X	Frequency Domain:  Mean body angular velocity in X direction (radians / sec)
62.  fBodyGyro-mean()-Y	Frequency Domain:  Mean body angular velocity in Y direction (radians / sec)
63.  fBodyGyro-mean()-Z	Frequency Domain:  Mean body angular velocity in Z direction (radians / sec )
64.  fBodyGyro-std()-X	Frequency Domain:  Standard Deviation body angular velocity in X direction (radians / sec)
65.  fBodyGyro-std()-Y	Frequency Domain:  Standard Deviation body angular velocity in Y direction (radians / sec )
66.  fBodyGyro-std()-Z	Frequency Domain:  Standard Deviation body angular velocity in Z direction (radians / sec)
67.  fBodyGyro-meanFreq()-X	Frequency Domain: Mean across frequencies of angular velocity in X direction (radians / sec)
68.  fBodyGyro-meanFreq()-Y	Frequency Domain: Mean across frequencies of angular velocity in Y direction (radians / sec)
69.  fBodyGyro-meanFreq()-Z	Frequency Domain: Mean across frequencies of angular velocity in Z direction (radians / sec)
70.  fBodyAccMag-mean()	Frequency Domain: Mean Euclidean norm of body acceleration (m / sec^2)
71.  fBodyAccMag-std()	Frequency Domain: Standard Deviation of Euclidean norm of body acceleration (m / sec^2)
72.  fBodyAccMag-meanFreq()	Frequency Domain: Mean Euclidean norm across frequencies of body acceleration (m / sec^2)
73.  fBodyBodyAccJerkMag-mean()	Frequency Domain: Mean Euclidean norm of linear acceleration (m / sec^2)
74.  fBodyBodyAccJerkMag-std()	Frequency Domain: Standard Deviation of Euclidean norm of linear acceleration (m / sec^2)
75.  fBodyBodyAccJerkMag-meanFreq()	Frequency Domain: Mean Euclidean norm across frequencies of linear acceleration (m / sec^2)
76.  fBodyBodyGyroMag-mean()	Frequency Domain: Mean Euclidean norm of angular velocity (radians / sec)
77.  fBodyBodyGyroMag-std()	Frequency Domain: Standard Deviation of Euclidean norm of angular velocity (radians / sec)
78.  fBodyBodyGyroMag-meanFreq()	Frequency Domain: Mean Euclidean norm across frequencies of angular velocity (radians / sec)
79.  fBodyBodyGyroJerkMag-mean()	Frequency Domain: Mean Euclidean norm of combined linear acceleration and angular velocity
80.  fBodyBodyGyroJerkMag-std()	Frequency Domain: Standard Deviation of Euclidean norm of combined linear acceleration and angular velocity
81.  fBodyBodyGyroJerkMag-meanFreq()	Frequency Domain: Mean Euclidean norm across frequencies of combined linear acceleration and angular velocity
82.  Activity_Number	Numeric code of activities (matches with Activity Label)
