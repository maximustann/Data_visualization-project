#!/bin/env python
import pandas as pd
import sys
import csv

edu_level = {
        0:"NotFinishedPrimary",
        1:"Primary",
        2:"Junior_secondary",
        3:"Vocational",
        4:"General_secondary",
        }

item = {
        0:"Tv",
        1:"Showers",
        2:"Computers",
        3:"Cars",
        }

option_app = {
        0:"None",
        1:"One",
        2:"Two",
        3:"Threeormore",
        }
option_dish = {
        0:"No",
        1:"Yes",
        }
option_book = {
        0:"0-10",
        1:"11-25",
        2:"26-100",
        3:"101-200",
        4:"201-500",
        5:"Morethan500",
    }

def _counting_app(df, i, count, flag):
    if df.ix[i].ix[item[flag]] == option_app[0]:
        count[0] += 1
    elif df.ix[i].ix[item[flag]] == option_app[1]:
        count[1] += 1
    elif df.ix[i].ix[item[flag]] == option_app[2]:
        count[2] += 1
    elif df.ix[i].ix[item[flag]] == option_app[3]:
        count[3] += 1
    count[4] += 1
    return count

def _counting_dish(df, i, count):
    if df.ix[i].ix["Dishwasher"] == option_dish[0]:
        count[0] += 1
    elif df.ix[i].ix["Dishwasher"] == option_dish[1]:
        count[1] += 1
    count[2] += 1
    return count

def _counting_books(df, i, count):
    if df.ix[i].ix["Books"] == option_book[0]:
        count[0] += 1
    elif df.ix[i].ix["Books"] == option_book[1]:
        count[1] += 1
    elif df.ix[i].ix["Books"] == option_book[2]:
        count[2] += 1
    elif df.ix[i].ix["Books"] == option_book[3]:
        count[3] += 1
    elif df.ix[i].ix["Books"] == option_book[4]:
        count[4] += 1
    elif df.ix[i].ix["Books"] == option_book[5]:
        count[5] += 1
    count[6] += 1
    return count

def counting(df):
    mother_app = []
    count_mother_not_finished_pri = [ [0 for i in range(5)] for i in range(4) ]
    count_mother_primary = [ [0 for i in range(5)] for i in range(4) ]
    count_mother_junior = [ [0 for i in range(5)] for i in range(4) ]
    count_mother_vocational = [ [0 for i in range(5)] for i in range(4) ]
    count_mother_secondary = [ [0 for i in range(5)] for i in range(4) ]

    mother_dish = []
    count_mother_not_dish = [ 0 for i in range(3) ]
    count_mother_primary_dish = [ 0 for i in range(3) ]
    count_mother_junior_dish = [ 0 for i in range(3) ]
    count_mother_vocational_dish = [ 0 for i in range(3) ]
    count_mother_secondary_dish = [ 0 for i in range(3) ]

    father_dish = []
    count_father_not_dish = [ 0 for i in range(3) ]
    count_father_primary_dish = [ 0 for i in range(3) ]
    count_father_junior_dish = [ 0 for i in range(3) ]
    count_father_vocational_dish = [ 0 for i in range(3) ]
    count_father_secondary_dish = [ 0 for i in range(3) ]

    father_app = []
    count_father_not_finished_pri = [ [0 for i in range(5)] for i in range(4) ]
    count_father_primary = [ [0 for i in range(5)] for i in range(4) ]
    count_father_junior = [ [0 for i in range(5)] for i in range(4) ]
    count_father_vocational = [ [0 for i in range(5)] for i in range(4) ]
    count_father_secondary = [ [0 for i in range(5)] for i in range(4) ]

    mother_books = []
    count_mother_not_books = [ 0 for i in range(7) ]
    count_mother_primary_books = [ 0 for i in range(7) ]
    count_mother_junior_books = [ 0 for i in range(7) ]
    count_mother_vocational_books = [ 0 for i in range(7) ]
    count_mother_secondary_books = [ 0 for i in range(7) ]

    father_books = []
    count_father_not_books = [ 0 for i in range(7) ]
    count_father_primary_books = [ 0 for i in range(7) ]
    count_father_junior_books = [ 0 for i in range(7) ]
    count_father_vocational_books = [ 0 for i in range(7) ]
    count_father_secondary_books = [ 0 for i in range(7) ]

    size = len(df)
    for i in range(size):
        if df.ix[i].ix["MotherEducation"] == edu_level[0]:
            count_mother_not_dish = _counting_dish(df, i, count_mother_not_dish)
            count_mother_not_books = _counting_books(df, i, count_mother_not_books)
            for flag in range(4):
                count_mother_not_finished_pri[flag] = _counting_app(df, i,
                                                count_mother_not_finished_pri[flag], flag)
        elif df.ix[i].ix["MotherEducation"] == edu_level[1]:
            count_mother_primary_dish = _counting_dish(df, i, count_mother_primary_dish)
            count_mother_primary_books = _counting_books(df, i, count_mother_primary_books)
            for flag in range(4):
                count_mother_primary[flag] = _counting_app(df, i,
                                                count_mother_primary[flag], flag)
        elif df.ix[i].ix["MotherEducation"] == edu_level[2]:
            count_mother_junior_dish = _counting_dish(df, i, count_mother_junior_dish)
            count_mother_junior_books = _counting_books(df, i, count_mother_junior_books)
            for flag in range(4):
                count_mother_junior[flag] = _counting_app(df, i,
                                                count_mother_junior[flag], flag)
        elif df.ix[i].ix["MotherEducation"] == edu_level[3]:
            count_mother_vocational_dish = _counting_dish(df, i, count_mother_vocational_dish)
            count_mother_vocational_books = _counting_books(df, i, count_mother_vocational_books)
            for flag in range(4):
                count_mother_vocational[flag] = _counting_app(df, i,
                                                count_mother_vocational[flag], flag)
        elif df.ix[i].ix["MotherEducation"] == edu_level[4]:
            count_mother_secondary_dish = _counting_dish(df, i, count_mother_secondary_dish)
            count_mother_secondary_books = _counting_books(df, i, count_mother_secondary_books)
            for flag in range(4):
                count_mother_secondary[flag] = _counting_app(df, i,
                                                count_father_secondary[flag], flag)

        if df.ix[i].ix["FatherEducation"] == edu_level[0]:
            count_father_not_dish = _counting_dish(df, i, count_father_not_dish)
            count_father_not_books = _counting_books(df, i, count_father_not_books)
            for flag in range(4):
                count_father_not_finished_pri[flag] = _counting_app(df, i,
                                                count_father_not_finished_pri[flag], flag)
        elif df.ix[i].ix["FatherEducation"] == edu_level[1]:
            count_father_primary_dish = _counting_dish(df, i, count_father_primary_dish)
            count_father_primary_books = _counting_books(df, i, count_father_primary_books)
            for flag in range(4):
                count_father_primary[flag] = _counting_app(df, i,
                                                count_father_primary[flag], flag)
        elif df.ix[i].ix["FatherEducation"] == edu_level[2]:
            count_father_junior_dish = _counting_dish(df, i, count_father_junior_dish)
            count_father_junior_books = _counting_books(df, i, count_father_junior_books)
            for flag in range(4):
                count_father_junior[flag] = _counting_app(df, i,
                                                count_father_junior[flag], flag)
        elif df.ix[i].ix["FatherEducation"] == edu_level[3]:
            count_father_vocational_dish = _counting_dish(df, i, count_father_vocational_dish)
            count_father_vocational_books = _counting_books(df, i, count_father_vocational_books)
            for flag in range(4):
                count_father_vocational[flag] = _counting_app(df, i,
                                                count_father_vocational[flag], flag)
        elif df.ix[i].ix["FatherEducation"] == edu_level[4]:
            count_father_secondary_dish = _counting_dish(df, i, count_father_secondary_dish)
            count_father_secondary_books = _counting_books(df, i, count_father_secondary_books)
            for flag in range(4):
                count_father_secondary[flag] = _counting_app(df, i,
                                                count_father_secondary[flag], flag)

    mother_app.append(count_mother_not_finished_pri)
    mother_app.append(count_mother_primary)
    mother_app.append(count_mother_junior)
    mother_app.append(count_mother_vocational)
    mother_app.append(count_mother_secondary)

    father_app.append(count_father_not_finished_pri)
    father_app.append(count_father_primary)
    father_app.append(count_father_junior)
    father_app.append(count_father_vocational)
    father_app.append(count_father_secondary)

    mother_dish.append(count_mother_not_dish)
    mother_dish.append(count_mother_primary_dish)
    mother_dish.append(count_mother_junior_dish)
    mother_dish.append(count_mother_vocational_dish)
    mother_dish.append(count_mother_secondary_dish)

    father_dish.append(count_father_not_dish)
    father_dish.append(count_father_primary_dish)
    father_dish.append(count_father_junior_dish)
    father_dish.append(count_father_vocational_dish)
    father_dish.append(count_father_secondary_dish)

    mother_books.append(count_mother_not_books)
    mother_books.append(count_mother_primary_books)
    mother_books.append(count_mother_junior_books)
    mother_books.append(count_mother_vocational_books)
    mother_books.append(count_mother_secondary_books)

    father_books.append(count_father_not_books)
    father_books.append(count_father_primary_books)
    father_books.append(count_father_junior_books)
    father_books.append(count_father_vocational_books)
    father_books.append(count_father_secondary_books)


    return mother_app, father_app, mother_dish, father_dish, mother_books, father_books

def write_file(result, filename, flag):
    if flag == 0:
        title = ["None", "One", "Two", "ThreePlus", "TotalNumber"]
    elif flag == 1:
        title = ["No", "Yes", "TotalNumber"]
    else:
        title = ["0-10", "11-25", "26-100", "101-200", "200-500", "500Plux", "TotalNumber"]

    with open(filename, 'w') as f:
        write = csv.writer(f)
        write.writerow(title)
        for i in range(len(result)):
            write.writerow(result[i])
if __name__ == "__main__":
    df = pd.read_csv("parents_luxuries.csv", sep = ',')
    mother_app, father_app, mother_dish, father_dish, mother_books, father_books\
            = counting(df)
    write_file(mother_dish, "mother" + "_dish.csv", 1)
    write_file(mother_books, "mother" + "_books.csv", 2)
    write_file(father_dish, "father" + "_dish.csv", 1)
    write_file(father_books, "father" + "_books.csv", 2)
    for i in range(len(mother_app)):
        write_file(mother_app[i], "mother" + edu_level[i] + "_app.csv", 0)
        write_file(father_app[i], "father" + edu_level[i] + "_app.csv", 0)
