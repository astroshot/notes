# coding=utf-8

import paddle.fluid as fluid
import numpy as np


def main():
    train_data = np.array([[1.0], [2.0], [3.0], [4.0]]).astype('float32')
    y_true = np.array([[2.0], [4.0], [6.0], [8.0]]).astype('float32')

    x = fluid.layers.data('x', shape=(1,), dtype='float32')
    y_predict = fluid.layers.fc(input=x, size=1, act=None)

    cpu = fluid.core.CPUPlace()

    exe = fluid.Executor(cpu)
    exe.run(fluid.default_main_program)

    out = exe.run(feed={'x': train_data}, fetch_list=[y_predict.name])

    print(out)


if __name__ == '__main__':
    main()
