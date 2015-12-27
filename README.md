# How to use the R code run_analysis.R
1. Donwload the dataset and unzip it
2. put **training** and **test** folders and datasets **features.txt** and **activity_labels.txt** in the working directory where the code is
3. run `run_analysis.R` by typing `source("run_analysis.R")`
4. the tidy_data is then in the folder `cleaningData`
5. to read it in R type `read.table("./cleaningData/tidy_data.txt", header = TRUE)`

# How the code is performed
1. `read.table`is used to read datasets in R
2. libraries used are `dplyr`and `tidyr`
