#!/bin/env python

import pandas as pd
import sys
import csv

Skip = {
            0:"None",
            1:"Oneortwotimes",
            2:"Threeorfourtimes",
            3:"Fiveormoretimes",
        }

def counting_skip_school_people(df, i, count):
    for j in range(4):
        if df.ix[i].ix["SkipWholeDay"] == Skip[j]:
            count[j] += 1
    return count

def counting_skip_classes_people(df, i, count):
    for j in range(4):
        if df.ix[i].ix["SkipClasses"] == Skip[j]:
            count[j] += 1
    return count


def counting_late_school_people(df, i, count):
    for j in range(4):
        if df.ix[i].ix["LateForSchool"] == Skip[j]:
            count[j] += 1
    return count

def counting_skip_school_fail_grade(df, i, count_fail_grade):
    for j in range(4):
        if df.ix[i].ix["SkipWholeDay"] == Skip[j]:
            if df.ix[i].ix["Repeat01"] != "never" and df.ix[i].ix["Repeat01"] != "nan":
                count_fail_grade[j] += 1
            elif df.ix[i].ix["Repeat02"] != "never" and df.ix[i].ix["Repeat02"] != "nan":
                count_fail_grade[j] += 1
            elif df.ix[i].ix["Repeat03"] != "never" and df.ix[i].ix["Repeat03"] != "nan":
                count_fail_grade[j] += 1
    return count_fail_grade


def counting_skip_classes_fail_grade(df, i, count_fail_grade):
    for j in range(4):
        if df.ix[i].ix["SkipClasses"] == Skip[j]:
            if df.ix[i].ix["Repeat01"] != "never" and df.ix[i].ix["Repeat01"] != "nan":
                count_fail_grade[j] += 1
            elif df.ix[i].ix["Repeat02"] != "never" and df.ix[i].ix["Repeat02"] != "nan":
                count_fail_grade[j] += 1
            elif df.ix[i].ix["Repeat03"] != "never" and df.ix[i].ix["Repeat03"] != "nan":
                count_fail_grade[j] += 1
    return count_fail_grade

def counting_late_school_fail_grade(df, i, count_fail_grade):
    for j in range(4):
        if df.ix[i].ix["LateForSchool"] == Skip[j]:
            if df.ix[i].ix["Repeat01"] != "never" and df.ix[i].ix["Repeat01"] != "nan":
                count_fail_grade[j] += 1
            elif df.ix[i].ix["Repeat02"] != "never" and df.ix[i].ix["Repeat02"] != "nan":
                count_fail_grade[j] += 1
            elif df.ix[i].ix["Repeat03"] != "never" and df.ix[i].ix["Repeat03"] != "nan":
                count_fail_grade[j] += 1
    return count_fail_grade

def count_fail_and_skip_and_late(df):
    count = []
    count_skip_school_people = [0 for i in range(4)]
    count_skip_classes_people = [0 for i in range(4)]
    count_skip_school_fail_grade = [0 for i in range(4)]
    count_skip_classes_fail_grade = [0 for i in range(4)]
    count_late_school_people = [0 for i in range(4)]
    count_late_school_fail_grade = [0 for i in range(4)]
    size  = len(df)
    for i in range(size):
        count_skip_school_people = counting_skip_school_people(df, i, count_skip_school_people)
        count_skip_classes_people = counting_skip_classes_people(df, i, count_skip_classes_people)
        count_skip_school_fail_grade = counting_skip_school_fail_grade(df, i, count_skip_school_fail_grade)
        count_skip_classes_fail_grade = counting_skip_classes_fail_grade(df, i, count_skip_classes_fail_grade)
        count_late_school_people = counting_late_school_people(df, i, count_late_school_people)
        count_late_school_fail_grade = counting_late_school_fail_grade(df, i, count_late_school_fail_grade)

    count.append(count_skip_school_people)
    count.append(count_skip_school_fail_grade)
    count.append(count_skip_classes_people)
    count.append(count_skip_classes_fail_grade)
    count.append(count_late_school_people)
    count.append(count_late_school_fail_grade)
    return count

def write_file(result, filename):
    title = ["NoneSkip", "One_Two", "Three_Four", "Five_more"]
    with open(filename, 'w') as f:
        write = csv.writer(f)
        write.writerow(title)
        for i in range(len(result)):
            write.writerow(result[i])
if __name__ == "__main__":
    df = pd.read_csv('truancy.csv', sep = ',')
    result = count_fail_and_skip_and_late(df)
    write_file(result, "truancy_summary.csv")

