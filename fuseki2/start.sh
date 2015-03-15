#!/bin/bash

export PATH=$PATH:/fuseki2
service ssh start
./fuseki-server --config=config.ttl
