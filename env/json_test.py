import os
import sys
import json

args_len = len(sys.argv)

if args_len == 1:
    print("json string is null")
else: 
    formatted_json = json.dumps(sys.argv[1], indent=4)
    print(formatted_json)
