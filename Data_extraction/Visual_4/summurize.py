#!/bin/env python

import pandas as pd
import sys
import csv
import json
import io

def summurize(parents, df_stu_int, df_stu_car):
    parents_like_math = parents.ix[0].ix["Agree"] + parents.ix[0].ix["Stronglyagree"]
    parents_important = parents.ix[1].ix["Agree"] + parents.ix[1].ix["Stronglyagree"]
    parents_career = parents.ix[2].ix["Agree"] + parents.ix[2].ix["Stronglyagree"]

    parents_n_like_math = -(parents.ix[0].ix["Disagree"] + parents.ix[0].ix["Stronglydisagree"])
    parents_n_important = -(parents.ix[1].ix["Disagree"] + parents.ix[1].ix["Stronglydisagree"])
    parents_n_career = -(parents.ix[2].ix["Disagree"] + parents.ix[2].ix["Stronglydisagree"])

    student_int = df_stu_int.ix[3].ix["Agree"] + df_stu_int.ix[3].ix["Stronglyagree"]
    student_n_int = -(df_stu_int.ix[3].ix["Disagree"] + df_stu_int.ix[3].ix["Stronglydisagree"])

    student_wor = df_stu_car.ix[0].ix["Agree"] + df_stu_car.ix[1].ix["Stronglyagree"]
    student_n_wor = -(df_stu_car.ix[0].ix["Disagree"] + df_stu_car.ix[1].ix["Stronglydisagree"])

    student_car = df_stu_car.ix[3].ix["Agree"] + df_stu_car.ix[3].ix["Stronglyagree"]
    student_n_car = -(df_stu_car.ix[3].ix["Disagree"] + df_stu_car.ix[3].ix["Stronglydisagree"])

    summary_obj = [
            {
                "key": "Negative Attitude",
                "color": "#d67777",
                "values": [
                    {
                        "label": "Parents Like Math",
                        "value": parents_n_like_math
                    },
                    {
                        "label": "Student Like Math",
                        "value": student_n_int
                        },
                    {
                        "label": "Parents think Math is Useful",
                        "value": parents_n_important
                        },
                    {
                        "label": "Students think Math is worthwhile to learn",
                        "value": student_n_wor
                        },
                    {
                        "label": "Parents think Math is Important for career",
                        "value": parents_n_career
                        },
                    {
                        "label": "Students think Math is Important for career",
                        "value": student_n_car
                        }
                    ]
                },
            {
                "key": "Positive Attitude",
                "color": "#4f99b4",
                "values": [
                    {
                        "label": "Parents Like Math",
                        "value": parents_like_math
                        },
                    {
                        "label": "Student Like Math",
                        "value": student_int
                        },
                    {
                        "label": "Parents think Math is Useful",
                        "value": parents_important
                        },
                    {
                        "label": "Students think Math is worthwhile to learn",
                        "value": student_wor
                        },
                    {
                        "label": "Parents think Math is Important for career",
                        "value": parents_career
                        },
                    {
                        "label": "Students think Math is Important for career",
                        "value": student_car
                        }
                    ]
                }
            ]
    return summary_obj

if __name__ == "__main__":
    df_parents = pd.read_csv("parents_attitude.csv", sep = ',')
    df_stu_int = pd.read_csv("student_interest.csv", sep = ',')
    df_stu_car = pd.read_csv("student_career.csv", sep = ',')
    summary_obj = summurize(df_parents, df_stu_int, df_stu_car)
    with io.open("summary.json", "w") as f:
        f.write(unicode(json.dumps(summary_obj)))
