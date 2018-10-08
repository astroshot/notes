# coding=utf-8
import numpy as np
import click


class Bid(object):
    BID_LIMIT = 5
    E_high = 2
    E_low = 1

    def __init__(self, max_val, min_val, max_range, min_range, num=10, score=60, max_iter=100000):
        """

        :param max_val: 最高投标价
        :param min_val: 最低投标价
        :param max_range: 合理的投标上限
        :param min_range: 合理的投标下限
        :param num: 投标厂商数目
        :param score: 投标得分
        :param max_iter: 最大迭代次数
        """
        self.max_val = max_val
        self.min_val = min_val
        self.max_range = max_range
        self.min_range = min_range
        self.num = num
        self.score = score
        self.max_iter = max_iter
        self.base_price = 0
        self.changed = False

    def single_fit(self):
        avg = (self.max_range + self.min_range) / 2
        scale = (self.max_range - self.min_range) / 2
        prices = np.random.normal(avg, scale, self.num)
        prices = np.sort(prices)

        if not self.changed:
            if self.num > self.BID_LIMIT:
                prices = prices[1:self.num - 1]
                self.num = self.num - 2
                self.changed = True
                if self.num != len(prices):
                    raise Exception('Not Equal: {} != {}'.format(self.num, len(prices)))

        avg_price = np.average(prices)
        self.base_price = avg_price * 0.98
        high_prices = prices[np.where(prices >= self.base_price)]
        low_prices = prices[np.where(prices < self.base_price)]
        new_prices = np.hstack((high_prices, low_prices))

        high_scores = self.score - (high_prices - self.base_price) / self.base_price * self.E_high
        low_scores = self.score + (low_prices - self.base_price) / self.base_price * self.E_low
        new_scores = np.hstack((high_scores, low_scores))

        max_score = np.max(new_scores)
        index = np.where(new_scores == max_score)
        return new_prices[index][0]

    def fit(self):
        winner = np.zeros(self.max_iter)
        for i in range(self.max_iter):
            winner[i] = self.single_fit()
        return winner


@click.command()
@click.option('--max_iter')
def main(max_iter):
    max_iter = int(max_iter)
    print(max_iter)
    b = Bid(17.5, 12, 17, 14, max_iter=max_iter)
    winner = b.fit()
    print(u'中标价平均值 {:.2f}, 最大值 {:.2f}, 最小值 {:.2f}, 标准差 {:.2f};'.format(
        np.mean(winner), np.max(winner), np.min(winner), np.std(winner)))


if __name__ == '__main__':
    main()
