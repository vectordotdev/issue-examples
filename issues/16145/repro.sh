#/bin/bash

./gen_log.py | docker run --rm -i -v `pwd`:/etc/vector timberio/vector:latest-alpine
