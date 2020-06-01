# coding=utf-8
"""
Convert csv file to SQLs.
Columns should be placed as the first row.

Require: Python 3 and pandas
Before usage: `python3 -m pip install pandas`

Here is an example for your csv file content:

```
"id","code","name","create_time","update_time"
1,370000,"山东省","2020-03-26 16:42:00","2020-03-26 16:42:00"
2,410000,"河南省","2020-03-26 16:42:00","2020-03-26 16:42:00"
3,710000,"台湾省","2020-03-26 16:42:00","2020-03-26 16:42:00"
4,500000,"重庆市","2020-03-26 16:42:00","2020-03-26 16:42:00"
5,630000,"青海省","2020-03-26 16:42:00","2020-03-26 16:42:00"
6,650000,"新疆维吾尔自治区","2020-03-26 16:42:00","2020-03-26 16:42:00"
7,220000,"吉林省","2020-03-26 16:42:00","2020-03-26 16:42:00"
8,320000,"江苏省","2020-03-26 16:42:00","2020-03-26 16:42:00"
9,210000,"辽宁省","2020-03-26 16:42:00","2020-03-26 16:42:00"
10,450000,"广西壮族自治区","2020-03-26 16:42:00","2020-03-26 16:42:00"
```

PS: CSV example data can be exported by Sequel Pro on MAC OS.
"""

import argparse

import pandas as pd


def main(file_path: str, table_name: str) -> list:
    df = pd.read_csv(file_path, dtype=str, keep_default_na=False)
    sql_template = """INSERT INTO `{table_name}` ({cols}) VALUES ({vals});"""
    cols = []
    for col in df.columns:
        new_col = '`{}`'.format(col)
        cols.append(new_col)

    col_str = ", ".join(cols)

    sqls = []
    for i, row in df.iterrows():
        row_vals = []
        for text in row:
            new_text = '"{}"'.format(text)
            row_vals.append(new_text)
        row_str = ", ".join(row_vals)
        sql = sql_template.format(table_name=table_name, cols=col_str, vals=row_str)
        sqls.append(sql)

    return sqls


def print_list(row: list):
    for i in row:
        print(i)


if __name__ == '__main__':
    help_msg = """
    example: python csv_to_sql.py --file=/path/to/data.csv --table_name=table
    """
    parser = argparse.ArgumentParser(description=help_msg)
    parser.add_argument('--file', type=str, help='Input csv file')
    parser.add_argument('--table_name', type=str, help='table name')

    args = parser.parse_args()
    csv_file = args.file
    table_name = args.table_name
    sqls = main(csv_file, table_name)
    print_list(sqls)
