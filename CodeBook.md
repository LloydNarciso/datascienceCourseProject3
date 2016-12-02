## Code Book for Course Project

Explanation of Data Variables:

* subject: integer ranging from 1-30; number representing person who was measured
* activity: activity that subject was performing while being measured; it is one of 6 actions: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* measurement: type of measurement being averaged; it is one of 79 variables that were recorded during the experiment. Several other measurements were recorded such as max and min but for the purpose of this project, the mean and standard deviation measurements were used. The measurement names were cleaned up so that () and - were not included, as well as the "mean" and "std" strings had their first letter capitalized to provide clarity to the type of measurement that was used.
* average: the mean of the measurement provided a subject and activity. There were multiple values for each measurement, subject and activity so the mean was calculated, as per the assignment.
