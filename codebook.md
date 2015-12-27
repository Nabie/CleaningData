 
#Origin of raw data

it's [written]
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
about the raw data:
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data." 

Raw data can be get [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

#Tasks performed on the data

######Selection of variables
We have extracted only mean and standard deviation for each mesurement. 
######computation 
We calculate the mean of these mesurement by subjet and by activity.So the values contain in the tidy_data are the average of 
mean and standard deviation for each couple of subject and activity

######tidy data criteria
To meet the tidy data criteria, we create the variable "direction" which indicates the three dimensions. But before performing this,
I drop all variables that's scalar so don't belong to any direction.

# List of variables in the tidy dataset
Variables are about time and frequency domain. That's indicated in the names of variables by "Fromtime" and "frequency"
The linear acceleration has two components: the body acceleration and the gravity.



1. **subject_id** : number that identify the subject involve in the study.There are thirty personns so the number is from 1 to 30
            
2. **activity**   : name of the activity perform in the study. there are six activities.
                
                1.  WALKING  
                2. WALKING_UPSTAIRS  
                3. WALKING_DOWNSTAIRS
                4. SITTING
                5. STANDING
                6. LAYING
              

3. **direction**   : three dimensions: X, Y and Z         

      


4.  **mean.BodyAccelaration.Fromtime** : mean of body linear acceleration                                
 
                        
5.  **mean.BodyAngularVelocity.Fromtime**         : mean time of body angular velocity           
6.  **mean.frequencyOfBodyAccelaration**          :mean frequency of body linear acceleration            
7.  **mean.frequencyOfBodyAngularVelocity**       :mean frequency of body angular velocity            
8.  **mean.frequencyOfJerkFromBodyAccelaration**  :mean frequency of jerk from body linear acceleration
9.  **mean.GravityAccelaration.Fromtime**         :mean time of gravity acceleration            
10. **mean.JerkFromBodyAccelaration.Fromtime**    :mean time of jerk from body linear acceleration            
11. **mean.JerkFromBodyAngularVelocity.Fromtime** : mean time of jerk from body angular velocity
                                               
12. **standardDeviation.BodyAccelaration.Fromtime**: standard deviation of body linear acceleration          
13. **standardDeviation.BodyAngularVelocity.Fromtime**: standard deviation time of body angular velocity 
                                        
14. **standardDeviation.frequencyOfBodyAccelaration**  :standard deviation of frequency of body linear acceleratin
                   
15. **standardDeviation.frequencyOfBodyAngularVelocity** : standard deviation of frequency of body angular velocity
                   
16. **standardDeviation.frequencyOfJerkFromBodyAccelaration**: standard deviation of frequency
                                                        of jerk from body linear acceleration
17. **standardDeviation.GravityAccelaration.Fromtime**      :standard deviation of time of gravity acceleration
18. **standardDeviation.JerkFromBodyAccelaration.Fromtime** :standard deviation of time of jerk from body linear acceleration
                      
19. **standardDeviation.JerkFromBodyAngularVelocity.Fromtime**: standard deviation of time of jerk from body angular velocity

