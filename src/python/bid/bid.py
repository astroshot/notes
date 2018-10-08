# coding=utf-8

from random import randint
import argparse
import numpy as np


def bidding_model(P1, avg, scale, num):
    # P1_MAX = 6000  # 拦标价最大值 11000 6000
    # P1_MIN = 5000  # 拦标价最小值 10000 5000

    # AVG = 4400  # 均价 9400 4400
    # SCALE = 600  # 1600 600
    BID_NUM = 10  # 多于 10 家投标则取前 10 家算平均值

    # num = 8  # 模拟投标的数量
    # if type(num) is not int or num < 1:
    #     raise Exception('num should be an integer')

    # P1 = randint(P1_MIN, P1_MAX)
    # P1 = 5.4 * 351e3
    # P1 = 10.6 * 134e3
    # print('P1 is {}'.format(P1))
    # max0 = 2161750
    # min0 = 1517390
    # max0 = 1554400
    # min0 = 1287400
    price = np.random.normal(loc=avg, scale=scale, size=num)
    # print('origin price before sort: {}'.format(price))

    price = np.sort(price)
    # print('price after sort: {}'.format(price))

    if num > BID_NUM:  # 若投标人数超过了 10，则取
        price = price[0:BID_NUM]
        num = BID_NUM

    total = np.sum(price)
    P2 = np.average(price)  # 应该等于 AVG
    # print('summary is {}, avg is {}'.format(total, P2))

    P3 = P1 * 0.5 + P2 * 0.5
    infimum = 0.97 * P3
    # print('infimumest price is {}'.format(infimum))

    index = np.where(price >= infimum)  # 筛掉低于评审基准价的投标  returns a tuple
    filtered = price[index]
    if filtered.size > 0:  # 过滤掉一次失败的模拟
        # print('who can continue bidding: {}'.format(filtered))
        # print('{} wins the bidding!'.format(filtered[0]))
        return (P1, P2, infimum, filtered[0])


def make_bids(P1, avg, scale, num):
    # mock_bidding = list()
    # num = 10
    BID_COUNT = 100000
    count = 0
    avg_p1 = 0
    avg_p2 = 0
    infimum = 0
    winner = np.zeros(BID_COUNT)
    while count < BID_COUNT:
        each_mock = bidding_model(P1, avg, scale, num)
        if each_mock:
            avg_p1 += each_mock[0] / BID_COUNT
            avg_p2 += each_mock[1] / BID_COUNT
            infimum += each_mock[2] / BID_COUNT
            winner[count] = each_mock[3]
            count += 1

    print(u'投标次数 {}, 投标人数 {}, 到站价 {:.2f}, 投标均价 {:.2f}, 价格下限 {:.2f};'.format(
        BID_COUNT, num, avg_p1, avg_p2, infimum))
    print(u'中标价平均值 {:.2f}, 最大值 {:.2f}, 最小值 {:.2f}, 标准差 {:.2f};'.format(
        np.mean(winner), np.max(winner), np.min(winner), np.std(winner)))


if __name__ == '__main__':

    description_msg = """
    python command line test
    """
    parser = argparse.ArgumentParser()
    parser.add_argument('--P1', type=float)
    # parser.add_argument('--avg', type=float)
    # parser.add_argument('--scale', type=float)
    parser.add_argument('--num', type=int)
    parser.add_argument('--m', type=float)
    parser.add_argument('--p2max', type=float)
    parser.add_argument('--p2min', type=float)

    args = parser.parse_args()

    P1 = args.P1 * args.m
    avg = (args.p2max + args.p2min) / 2 * args.m
    scale = (args.p2max - args.p2min) / 2 * args.m
    num = args.num

    make_bids(P1, avg, scale, num)
