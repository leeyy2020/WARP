import os
import sys
import numpy as np

if __name__=="__main__":



    np_list = []
    for line in sys.stdin:

        result = line.strip().split(" ")
        np_list.append(float(result[-1]))
        # print(result[-1])

    for i in range(5):
        tmp = 0
        for j in range(30):
            tmp = max(np_list[i * 30 + j], tmp)
        print(tmp)
