# Getting-and-Cleaning-Data

This repo is the "Getting and Cleaning Data" Peer-graded from Johns Hopkins Data Specialization. Its goal is creating a database from test and train databases of "Smartphone-Based Recognition of Human Activities and Postural Transitions" Samsung´s experiment, through cleaning, reading and analyzing its files. 

How to start?

The original databases, given by Cousera Platform, own a mistake which needs to be resolved before reading the files with R: some records in "x_test" and "y_train" files use double spaces as their delimiter and another use a simple space as their delimiter. 

So, before reading the files with R, double spaces were manually replaced with simple spaces using "Replace All" function from txt editor. This step was the most important part due to the origin error would made that "x_test" and "y_test" were read as they had more than 561 features(variables), situation which can´t be possible in accordance with the list of features given by the course.

Reading Data

After cleaning databases, test and train databases were read separately, as it can be reviewed in "Building Test Part" and "Building Train Part", by using read_delim function from dplyr package and using simple space " " as the delimiter. These databases were joined with the features names, subjects who carried out the experiment and the activity which they took part in.  

Getting Tidy Data and some measurements

Complete Data Base was created by joining test and train databases using "rbind" function from base package. After that, data was manipulated using dplyr package in such a way that were selected only features(variables) which were the average or the standard deviation as the assignment indicates. 

Finally, using functions from dplyr package was obtained a new database which contains the average and standard deviation of each activity performed by each of the 30 participants. 