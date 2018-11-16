#!/usr/bin/env python


def load_file(file_path):
    with open(file_path, 'r') as f:
        data = set()
        while True:
            row = f.readline()
            if not row:
                break
            data.add(row)
        return data


def main():
    file1 = '/Users/liuzhao/Desktop/push/1.txt'
    data1 = load_file(file1)
    set1 = set(data1)

    file2 = '/Users/liuzhao/Desktop/push/3.txt'
    data2 = load_file(file2)
    set2 = set(data2)

    result = set2 - set1
    result = sorted(result)
    with open('/Users/liuzhao/Desktop/push/result.txt', 'w') as ofile:
        for item in result:
            ofile.write(str(item))


if __name__ == '__main__':
    main()
