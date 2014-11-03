#!/bin/env python

import pandas as pd
import sys
import csv

item = {
        0:"EnjoyReading",
        1:"WorthwhileWork",
        2:"LookForwardLesson",
        3:"EnjoyMath",
        4:"CareerChances",
        5:"Interested",
        6:"FutureStudy",
        7:"GetJob",
        }
def _counting(df, i, count, flag):
    if df.ix[i].ix[item[flag]] == "Agree" or df.ix[i].ix[item[flag]] == "Stronglyagree":
        if df.ix[i].ix["Gender"] == "Male":
            count[0] += 1
        else:
            count[1] += 1
    return count

def counting(df):
    count = [ [0 for i in range(2)] for i in range(8)]
    size = len(df)
    for i in range(size):
        for flag in range(8):
            count[flag] = _counting(df, i, count[flag], flag)
    return count

def write_file(result, filename):
    title = ["male", "female"]
    with open(filename, 'w') as f:
        write = csv.writer(f)
        write.writerow(title)
        for i in range(len(result)):
            write.writerow(result[i])

if __name__ == "__main__":
    df = pd.read_csv("job_interest.csv", sep = ',')
    result = counting(df)
    write_file(result, "job_interest_summary.csv")
