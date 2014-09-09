library(dplyr)
library(data.table)
load("pisaData.rda")
attach(student2012)

truancy <- student2012[which(CNT=="China-Shanghai"), ][c("CNT", "STIDSTD", "ST03Q02", "ST04Q01", "ST07Q01", "ST07Q02", "ST07Q03", "ST09Q01", "ST115Q01")]

late <- student2012[which(CNT=="China-Shanghai"), ][c("CNT", "STIDSTD", "ST03Q02", "ST04Q01", "ST07Q01", "ST07Q02", "ST07Q03", "ST08Q01")]


parents_luxuries <- student2012[which(CNT=="China-Shanghai"), ][c("CNT", "STIDSTD", "ST03Q02", "ST04Q01", "ST13Q01", "ST17Q01", "ST26Q13", "ST27Q02", "ST27Q03", "ST27Q04", "ST27Q05", "ST28Q01")]


write.csv(late, "late.csv")
write.csv(truancy, "truancy.csv")
write.csv(parents_luxuries, "parents_luxuries.csv")
