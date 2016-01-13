
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
unique_proj = table(loc$project_id)
View(unique_proj)
sort(table(loc$project_id))

#create a data frame of locations per project from unique_proj table
unique_proj_df = data.frame(unique_proj)

#barplot of locations per project
barplot(unique_proj, main = "Locations Per Project", 
        xlab = "Each Project", ylab = "# of Locations")

#Count projects with more than x locations
sum(unique_proj == 1)
sum(unique_proj > 1)
sum(unique_proj > 3)
sum(unique_proj > 5)

#count of projects by sector & make a barplot
proj_bySector = table(proj$ad_sector_names)
View(proj_bySector)

quartz()
par(mar = c(15,4,4,2) + 0.1, mgp = c(12, 0, 0), las=2)
barplot(proj_bySector, main = "Number of Projects by Sector", 
        xlab = "Sector", ylab = "")
title(ylab="Number of Projects", line=2, cex.lab=1.2, family="Calibri Light")

#count of locations by sector
loc_bySector=table(lev1a$ad_sector_names)
View(loc_bySector)

barplot(loc_bySector)

#subset by precision code
loc_prec <- subset(loc, precision_code==1 | precision_code==2)
table(loc_prec$precision_code)

lev1a_prec <- subset(lev1a, precision_code==1 | precision_code==2)

#get # of locations per project
#unique_proj_prec = table(loc_prec$project_id)
#View(unique_proj_prec)
sort(table(loc_prec$project_id))

# count of precision 1 or 2 locations by sector
loc_bySector=table(lev1a_prec$ad_sector_codes)
View(loc_bySector)

barplot(loc_bySector)

loc_bySectorRec=table(lev1a_prec$ad_sector_codes, lev1a_prec$recipients)
barplot(loc_bySectorRec, legend=rownames(loc_bySectorRec))

#locations by sector
margin.table(loc_bySectorRec,1)

#locations by country
margin.table(loc_bySectorRec,2)

#count precise projects with more than x locations

unique_proj_prec = table(loc_prec$project_id)
View(unique_proj_prec)

sum(unique_proj_prec == 1)
sum(unique_proj_prec > 1)
sum(unique_proj_prec > 3)
sum(unique_proj_prec > 5)


install.packages("gmodels")
library(gmodels)

CrossTable(lev1a_prec$ad_sector_codes, lev1a_prec$project_id)
