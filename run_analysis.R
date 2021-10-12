library(dplyr)

train_subject <- read.table("train/subject_train.txt")
train_label <- read.table("train/y_train.txt")
train_set <- read.table("train/X_train.txt")

test_subject <- read.table("test/subject_test.txt")
test_label  <- read.table("test/y_test.txt")
test_set <- read.table("test/X_test.txt")

col_names <- read.table("features.txt", sep = " ")
col_names <- col_names$V2

activities <- read.table("activity_labels.txt")

merged_list <- rbind(
  cbind(train_subject, train_label, train_set),
  cbind(test_subject, test_label, test_set)
)

rm(list = ls()[grep("(train|test)", ls())])

colnames(merged_list) <- c("subject", "label", col_names)

#Q2

selected_col <- grep("subject|label|mean|sd", colnames(merged_list))
merged_list <- merged_list[, selected_col]

#Q3

merged_list$label <- factor(merged_list$label, levels = activities[, 1], labels = activities[, 2])

#Q5

summarized_list <-merged_list |> group_by(subject, label) |> summarize_all(list(mean = mean))
