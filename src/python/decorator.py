# coding=utf-8
from functools import wraps


def deco(func):
    @wraps(func)  # use wraps to keep the meta info of func.
    def warpper(*args, **kwargs):
        print('Before warp')
        print(func.__name__)
        print(func.__doc__)
        func(*args, **kwargs)
        print('After wrap')
    return warpper


@deco
def square(x):
    """square returns the square of value x
    """
    print('Square of {} is {}'.format(x, x**2))


def main():
    square(5.3)


if __name__ == '__main__':
    main()
