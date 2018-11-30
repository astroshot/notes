# coding=utf-8
import argparse
import os
import re


def get_filename_ext(filepath):
    name, ext = os.path.splitext(filepath)
    return name, ext


def process(filepath):
    fname, ext = get_filename_ext(filepath)
    outfile = fname + '_replaced' + ext

    pat = re.compile(r'(SPIWrite\t)(.{3}),(.{2})')
    content = []
    with open(filepath, 'r') as f:
        while True:
            line = f.readline()
            if not line:
                break

            res = pat.findall(line)
            if res:
                match_tuple = res[0]
                new_str = '{}(0x{},0x{});'.format(match_tuple[0], match_tuple[1], match_tuple[2])
                out = pat.sub(new_str, line)
                content.append(out)
            else:
                content.append(line)

    with open(outfile, 'w') as ofile:
        ofile.writelines(content)


if __name__ == '__main__':
    help_msg = r"""
    usage: python data_clk.py --file=D:\folder\Data_clk_xxxx.txt
    and a file with name `Data_clk_xxxx_replaced.txt` will be writen in current path.
    """
    parser = argparse.ArgumentParser(description=help_msg)
    parser.add_argument('--file', type=str, help=u'Input file')

    args = parser.parse_args()
    process(args.file)
