# coding=utf-8
import logging

def use_logging(level):
    def decorator(func):
        def wrapper(*args, **kwargs):
            """
            args and kwargs are passed here
            """
            print('args: {}, kwargs: {}'.format(args, kwargs))
            if level == "warn":
                logging.warning("%s is running" % func.__name__)
            elif level == "info":
                logging.info("%s is running" % func.__name__)
            return func(*args, **kwargs)
        return wrapper
    
    return decorator

@use_logging(level="warn")
def foo(a, b, name='foo'):
    print('args: {}, {}'.format(a, b))
    print("i am %s" % name)


if __name__ == '__main__':
    foo(1, 'a', name='name')
