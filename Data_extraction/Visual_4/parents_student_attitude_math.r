library(data.table)
par <- fread("parents_stu_math.csv", header=T, sep=',')
attach(par)
student_interest <- table(EnjoyMath)
student_interest <- rbind(student_interest, table(EnjoyReading))
student_interest <- rbind(student_interest, table(LookForwardLesson))
student_interest <- rbind(student_interest, table(Interested))

student_career <- table(WorthwhileWork) 
student_career <- rbind(student_career, table(CareerChances))
student_career <- rbind(student_career, table(FutureStudy))
student_career <- rbind(student_career, table(GetJob))

parents <- table(ParentsLikeMath)
parents <- rbind(parents, table(ParentsBelieveImportant))
parents <- rbind(parents, table(ParentsBelieveCareer))

write.csv(student_interest, "student_interest.csv")
write.csv(student_career, "student_career.csv")
write.csv(parents, "parents_attitude.csv")


