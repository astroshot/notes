# coding=utf-8
import numpy as np
import click


class Bid(object):
    P = 0.01
    AVG = 10000
    STANDARD = 100

    def __init__(self, num=10, max_iter=1000000):
        self.num = num
        self.max_iter = max_iter


    def single_fit(self):
        prices = np.random.random(size=self.num)
        prices = prices * 0.1 * self.STANDARD + 0.9 * self.STANDARD
        #  print('prices:')
        #  print(prices)
        score = np.ones(self.num)
        avg = np.average(prices) * (1 - self.P)

        diff = (prices - avg) / avg
        positive_index = np.where(diff > 0)
        score[positive_index] = 100 - 200 * diff[positive_index]

        negtive_index = np.where(diff <= 0)
        score[negtive_index] = 100 + 100 * diff[negtive_index]
        #  print('score')
        #  print(score)

        max_score = np.max(score)
        index = np.where(score == max_score)

        return prices[index]

    def fit(self):
        winner = np.zeros(self.max_iter)
        for i in range(self.max_iter):
            winner[i] = self.single_fit()
        return winner


@click.command()
@click.option('--max_iter')
def main(max_iter):
    max_iter = int(max_iter)
    b = Bid(max_iter=max_iter)
    #  print(b.single_fit())
    winner = b.fit()
    print(u'中标价平均值 {:.2f}, 最大值 {:.2f}, 最小值 {:.2f}, 标准差 {:.2f};'.format(
        np.mean(winner), np.max(winner), np.min(winner), np.std(winner)))


if __name__ == '__main__':
    main()
