#Getting And Cleaning Data - code book
## Variabels used in 'run_analysis.R'
### Temporary variables
These variables are onle present for a short amount of time and only for the purpose to read and/or transfer information.
They are deleted in teh course of the script in order not to clutter the R Global Environment and to keep memory utilisation at a minimum.

| variable name   | variable description                             |
|-----------------|--------------------------------------------------|
| subject_train   | store subject id's from relevant txt file        |
| x_train         | store measured variables from relevant txt file  |
| y_train         | store measured activity from relevant txt file   |
| subject_test    | store subject id's from relevant txt file        |
| x_test          | store measured variables from relevant txt file  |
| y_test          | store measured activity from relevant txt file   |
| subject_ids     | store combined train and test subject id's       |
| measurements    | store combined train and test measured variables |
| label_ids       | store combined train and test measured activity  |
| features        | store descriptions of measured variables         |
| activity_labels | store descriptions of measured activities        |

### Final variables
These variables contain the end result of teh script and remain available after the script has run.

| variable name | variable description                                                                                                     |
|---------------|--------------------------------------------------------------------------------------------------------------------------|
| data          | stores the combined data set content changes through the course of the script until only the relevant subset is retained |
| data2         | stores the tidy data set                                                                                                 |




### original data
The original data comes from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012