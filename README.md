# Getting_and_Cleaning_Data_assignment

## Reading data
I used read.table built-in function but readr package can be used as well

## Merging data
We have two data sets, rbind can be used to merge two data sets by row. And remove the remaining variables

## Naming columns
Column names were assigned to col_names variable, and by using it I assign these to the colum names

## Selecting required names
take the col names that include subject or label or mean or sd

## add labels
add labels to the each observation as factor

## Group and summarize
I used to dplyr package to group the data set by subject and label column and summarize it
