#!/bin/bash

export PATH=$PATH:/fuseki
service ssh start
./fuseki-server --config=config.ttl
