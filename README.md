# coursera-getdata-samsung-data-set
Getting and cleaning the UCI HAR data set

The repository contains the run_analysis.R script which needs to be tun from an R console.

Requirements for running the script:
- Package "reshape" needs to be installed in R (provides the melting/casting functionality)
- The folder "UCI HAR Dataset" needs to be present in the working directory

Output:
- A text file "final_data.txt" will be created in the working directory with the required data.
- In the console the data sets raw_data (initial merged data set), mean_std_data and melted_samsung_data will be available as intermediate results.
- Data set final_data will represent the final result and this is the object written to the text file.

Data source:
- http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

References:
- https://class.coursera.org/getdata-011/forum/thread?thread_id=69