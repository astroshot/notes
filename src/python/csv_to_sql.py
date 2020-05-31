# coding=utf-8

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
