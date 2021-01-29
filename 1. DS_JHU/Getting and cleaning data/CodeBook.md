It follows 5 steps of requirment of the course assignment. 
The 5 steps are following:  
#### 1. Merges the training and the test sets to create one data set.  
&nbsp;1.1 download the dataset and unzip the file  
&nbsp;1.2 read the each data set   
&nbsp;&nbsp;&nbsp;_xtest, ytest, subtest_ :data table names of test data set  
&nbsp;&nbsp;&nbsp;_xtrain, ytrain, subtrain_: data table names of train data set  
&nbsp;&nbsp;&nbsp;_feature, actlabel_:read feature, active_level data  
&nbsp;1.3 add column names to the data  
&nbsp;1.4 bining test and train data set to one data  
&nbsp;&nbsp;&nbsp;_test_: bining test data  
&nbsp;&nbsp;&nbsp;_train_: bining train data  
&nbsp;&nbsp;&nbsp;_data_: bining test and train data

#### 2.Extracts only the measurements on the mean and standard deviation for each measurement.    
&nbsp;&nbsp;&nbsp;2.1 find column names which has either mean or std  
&nbsp;&nbsp;&nbsp;&nbsp;_msd_: columns only mean or std in the column names  
&nbsp;&nbsp;&nbsp;2.2 select the data meet the above  
&nbsp;&nbsp;&nbsp;&nbsp;_msddata_: selected data only mean or std in the column names  

#### 3.Uses descriptive activity names to name the activities in the data set  
&nbsp;&nbsp;&nbsp;3.1 From the subset above, check the which names should be changed.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t->Time  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Acc->Acceleration  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Gyro->Gyroscope  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mag->Magnitude  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;f->Frequency
These changed words get from the feature_info.txt file  
&nbsp;&nbsp;&nbsp;3.2 using gsub to substitute the names  

#### 4.Appropriately labels the data set with descriptive variable names.  
&nbsp;&nbsp;&nbsp;4.1 join subset data and activity and subject data  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_msddata_:bining activity and subject on the subset data  
&nbsp;&nbsp;&nbsp;4.2 change the column name of the new data  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_Activitylevel_: column name of activity level  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_Subject_:column name of subject  
&nbsp;&nbsp;&nbsp;4.3 changed numeric activity labels to factor value  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WALKING  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WALKING_UPSTAIRS  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WALKING_DOWNSTAIRS  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SITTING  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;STANDING  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LAYING

#### 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
&nbsp;&nbsp;&nbsp;5.1 grouping the data by subject and activity level and calculate average  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_seconddata_: tidy data from the subset (msddata)  
#### To submit the data , making it to txt file.
