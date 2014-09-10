load("pisaData.rda")
attach(student2012)

#truancy <- student2012[which(CNT=="China-Shanghai"), ][c("CNT", "STIDSTD", "ST03Q02", "ST04Q01", "ST07Q01", "ST07Q02", "ST07Q03", "ST08Q01", "ST09Q01", "ST115Q01")]

truancy <- student2012[which(CNT=="Israel"), ][c("CNT", "STIDSTD", "ST03Q02", "ST04Q01", "ST07Q01", "ST07Q02", "ST07Q03", "ST08Q01", "ST09Q01", "ST115Q01")]

job_interest <- student2012[which(CNT=="China-Shanghai"), ][c("CNT", "STIDSTD", "ST03Q02", "ST04Q01", "ST29Q01", "ST29Q02", "ST29Q03", "ST29Q04", "ST29Q05", "ST29Q06", "ST29Q07", "ST29Q08")]

confidence_external_factors <- student2012[which(CNT=="China-Shanghai"), ][c("CNT", "STIDSTD", "ST03Q02", "ST04Q01", "ST43Q01", "ST43Q02", "ST43Q05", "ST43Q03", "ST43Q04", "ST44Q05")]

parents_luxuries <- student2012[which(CNT=="China-Shanghai"), ][c("CNT", "STIDSTD", "ST03Q02", "ST04Q01", "ST13Q01", "ST17Q01", "ST26Q13", "ST27Q02", "ST27Q03", "ST27Q04", "ST27Q05", "ST28Q01")]

parents_stu_math <- student2012[which(CNT=="China-Shanghai"), ][c("CNT", "STIDSTD", "ST03Q02", "ST04Q01", "ST29Q01", "ST29Q02", "ST29Q03", "ST29Q04", "ST29Q05", "ST29Q06", "ST29Q07", "ST29Q08", "ST35Q04", "ST35Q05", "ST35Q06")]

parents_edu_att_math <- student2012[which(CNT=="China-Shanghai"), ][c("CNT", "STIDSTD", "ST03Q02", "ST04Q01", "ST35Q04", "ST35Q05", "ST35Q06", "ST13Q01", "ST17Q01")]

write.csv(confidence_external_factors, "confidence_external_factors.csv")
write.csv(parents_stu_math, "parents_stu_math.csv")
write.csv(job_interest, "job_interest.csv")
write.csv(truancy, "truancy.csv")
write.csv(parents_luxuries, "parents_luxuries.csv")
write.csv(parents_edu_att_math, "parents_edu_att_math.csv")

