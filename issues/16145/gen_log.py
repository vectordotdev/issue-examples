#!/usr/bin/env python3

import random
import json
import time


def main():
    while True:
        u = random.randint(2, 5)
        d = {
            "user": f"usr-{u}",
            "pkts": random.randint(0, 9) + 100 ** (u-1)
        }
        print(json.dumps(d), flush=True)
        time.sleep(0.4)


main()
