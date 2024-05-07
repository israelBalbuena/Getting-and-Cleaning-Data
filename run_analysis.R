library(pacman)

p_load(tidyverse)


Sys.setlocale("LC_ALL", "es_ES.UTF-8") 

options(scipen=999)

features <- read_delim("Data/features.txt",col_names = F)

################################################################################
########################## BUILDING TEST PART ##################################
################################################################################

test_subject <- read_delim("Data/test/subject_test.txt",delim = ",", 
                           col_names = "Subject")

test_x <- read_delim("Data/test/X_test.txt",
                     delim = " ", col_names = features$X2 )

test_y <- read_delim("Data/test/y_test.txt",
                     delim = ",", col_names = "Activity")

test_data <- cbind(test_y,test_subject,test_x) 

################################################################################
########################## BUILDING TRAIN PART ##############################
################################################################################

training_subject <- read_delim("Data/train/subject_train.txt",delim = " ",
                               col_names = "Subject")

training_x <- read_delim("Data/train/X_train.txt", delim = " ", 
                         col_names = features$X2 )

training_y <- read_delim("Data/train/y_train.txt", delim = ",", 
                         col_names = "Activity")

training_data <- cbind(training_y,training_subject,training_x) 

################################################################################
################################ COMPLETE DATABASE #############################
################################################################################

complete_database <- rbind(test_data,training_data)

################################################################################
############ GETTING MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT #########
################################################################################

some_measurements <- complete_database %>% mutate(Activity_label =case_when(
  Activity == 1 ~ "Walking",
  Activity == 2 ~ "Walking_Upstairs",
  Activity == 3 ~ "Walking_Downstairs",
  Activity == 4 ~ "Sitting",
  Activity == 5 ~ "Standing",
  Activity == 6 ~ "Laying")) %>% 
  relocate("Activity","Activity_label") %>% 
  select( Activity_label, Subject,    
          contains("mean()") | contains("std()"))

################################################################################
################################ FINAL TIDY DATABASE ###########################
################################################################################

averages <- some_measurements %>% group_by(Activity_label, Subject) %>% 
  summarise_all(list(average = ~ mean(.,na.rm = T)))

################################################################################
################################################################################
################################################################################


write.table(averages,"Tidy_Data.txt", col.names = F)



