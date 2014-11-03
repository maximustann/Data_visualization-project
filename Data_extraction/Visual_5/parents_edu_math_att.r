library(data.table)
par <- fread("parents_edu_att_math.csv", header=T, sep=',')
attach(par)
mother_not_finish <- ParentsBelieveImportant[MotherEducation=="NotFinishedPrimary"]
father_not_finish <- ParentsBelieveImportant[FatherEducation=="NotFinishedPrimary"]
parents_not_finish <- table(mother_not_finish)
parents_not_finish <- rbind(parents_not_finish, table(father_not_finish))


mother_primary<- ParentsBelieveImportant[MotherEducation=="Primary"]
father_primary<- ParentsBelieveImportant[FatherEducation=="Primary"]

parents_not_finish <- rbind(parents_not_finish, table(mother_primary))
parents_not_finish <- rbind(parents_not_finish, table(father_primary))

#parents_primary<- table(mother_primary)
#parents_primary<- rbind(parents_primary, table(father_primary))
#3write.csv(parents_primary, "parents_att_math_primary.csv")

mother_junior<- ParentsBelieveImportant[MotherEducation=="Junior_secondary"]
father_junior<- ParentsBelieveImportant[FatherEducation=="Junior_secondary"]

parents_not_finish <- rbind(parents_not_finish, table(mother_junior))
parents_not_finish <- rbind(parents_not_finish, table(father_junior))
#parents_junior<- table(mother_junior)
#parents_junior<- rbind(parents_junior, table(father_junior))
#write.csv(parents_junior, "parents_att_math_junior.csv")

mother_vocational<- ParentsBelieveImportant[MotherEducation=="Vocational"]
father_vocational<- ParentsBelieveImportant[FatherEducation=="Vocational"]

parents_not_finish <- rbind(parents_not_finish, table(mother_vocational))
parents_not_finish <- rbind(parents_not_finish, table(father_vocational))
#parents_vocational<- table(mother_vocational)
#parents_vocational<- rbind(parents_vocational, table(father_vocational))
#write.csv(parents_vocational, "parents_att_math_vocational.csv")

mother_general<- ParentsBelieveImportant[MotherEducation=="General_secondary"]
father_general<- ParentsBelieveImportant[FatherEducation=="General_secondary"]

parents_not_finish <- rbind(parents_not_finish, table(mother_general))
parents_not_finish <- rbind(parents_not_finish, table(father_general))
#parents_general<- table(mother_general)
#parents_general<- rbind(parents_general, table(father_general))
#write.csv(parents_general, "parents_att_math_general.csv")


write.csv(parents_not_finish, "parents.csv")
