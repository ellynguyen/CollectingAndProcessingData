---
title: "CodeBook.md"
author: "Elly Nguyen"
output: word_document
---
This document describes variables and their values in the tidy data set summitted in the Course Project.

  "subject" variable is the identity number of each volunteer
  "activity_name" variable is the activity that a subject has been doing at the time the sensor collects data
  "variable" variable/column is the measurements on the mean and standard deviation collected by the sensor
  "mean" variable is the average value of each measurement
  
Below is list of transformations performed to clean up the data 
  Subset the raw data: only extract the measurements on the mean and standard deviation
  Create new variable: 
    "subject" variable is adding by joining/combining with the corresponding subject data set
    "activity_name" variable is adding by joining/combing with the activity labels data set
  Reshape the raw data: 
    Melt the data set to tall and skinny data set by melt all measured values except the columns of the id variable (subject, activity_name)
    Using ddply() function from plyr package to calculate mean/average value for             each value of the variable column/measured data
  
