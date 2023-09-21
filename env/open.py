import os
import sys

args_len = len(sys.argv)

if args_len == 1:
    print("args is null")
else:
    for i in range(1, args_len):
        os.startfile(sys.argv[i])

