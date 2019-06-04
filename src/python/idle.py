#!/usr/bin/env python
# coding: utf-8

import os
import math
import time, random
import multiprocessing


def f(q, r, t, k):
    n = (3 * q + r) / t
    if (4 * q + r) / t == n:
        return (10 * q, 10 * (r - n * t), t, k, n)
    else:
        return (q * k, q * (4 * k + 2) + r * (2 * k + 1), t * (2 * k + 1),
                k + 1)


def pi(n=-1):
    out = ''
    printed = False
    r = f((1, 0, 1, 1))
    out = ''
    while (n != 0):
        if len(r) == 5:
            out += str(r[4])
            if not printed:
                out += '.'
                printed = True
            n -= 1
        r = f(r[:4])
    return out


def main():
    cpu_nums = int(os.popen("grep 'cpu cores' /proc/cpuinfo -c").read()[:-1])
    records = []
    #print len(pi(5000))
    #pi(5000)
    for i in range(0, int(math.floor(cpu_nums / 10))):
        t = multiprocessing.Process(target=pi, args=(10000, ))
        t.start()
        records.append(t)

    for thread in records:
        thread.join()


if __name__ == "__main__":
    while 1:
        idle_str = os.popen(
            "ps aux|grep -w idle.py|grep -v -E 'grep|ssh|bash|rsync'|wc -l").read()[:-1]
        if idle_str.isdigit():
            ps_idle = int(idle_str)
        else:
            ps_idle = 0
        if ps_idle > 1:
            time.sleep(3)
            continue
        #current_load=int(os.popen("host=$(hostname|sed 's/.baidu.com//g') && monquery -n ${host} -i CPU_SERVER_LOADAVG_1|grep ${host}|awk '{print $2}'|sed 's/\..*(.*)//g'").read()[:-1])
        current_idle = int(
            os.popen(
                "host=$(hostname|sed 's/.xxxxx.com//g') && monquery -n ${host} -i CPU_IDLE|grep ${host}|awk '{print $2}'|sed 's/\..*(.*)//g'"
            ).read()[:-1])
        if current_idle < 90:
            print("current_idle:", current_idle)
            time.sleep(3)
            continue
        start_time = time.time()
        print("-------------------------------")
        print("Begin at: ", time.strftime("%Y-%m-%d %X", time.localtime()))
        main()
        print("End   at: ", time.strftime("%Y-%m-%d %X", time.localtime()))
        print("Time elapsed: ", time.time() - start_time, "s")
        time.sleep(3)
