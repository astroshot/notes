# coding=utf-8
import argparse


def calc_pi(num):
    num0 = int(num)
    num = num0 + 10

    b = 10 ** num
    x1 = b * 4 // 5
    x2 = b // -239
    sum_x = x1 + x2

    num0 *= 2
    for i in range(3, num0, 2):
        x1 //= -25
        x2 //= 57121
        x = (x1 + x2) // i
        sum_x += x

    pi = sum_x << 2
    pi //= 10**10
    pi_str = str(pi)
    res = pi_str[0] + '.' + pi_str[1:]
    print(res)


if __name__ == '__main__':
    help_msg = r"""
    usage: python pi.py --n=100
    and pi will be print
    """
    parser = argparse.ArgumentParser(description=help_msg)
    parser.add_argument('--n', type=int, help=u'precision of pi')

    args = parser.parse_args()
    calc_pi(args.n)
