
library(plyr)
library(ggplot2)
library(reshape2)

#set wd to Git Repo

loc = read.csv("Data_TUFFGeocoded/locations.csv")
proj = read.csv("Data_TUFFGeocoded/projects.csv")
proj_anc = read.csv("Data_TUFFGeocoded/projects_ancillary.csv")
trans = read.csv("Data_TUFFGeocoded/transactions.csv")
lev1a = read.csv("Data_TUFFGeocoded/level_1a.csv")

#get # of locations per project
unique_proj = table(LA_locations$project_id)
View(unique_proj)
