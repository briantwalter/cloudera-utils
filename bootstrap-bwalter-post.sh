#!/bin/bash

echo "...Starting Custom Post-Bootstrap"

sudo adduser -u 1501 -p cloudera brian
sudo adduser -u 1501 -p cloudera oryx

echo "...Ending Custom Post-Bootstrap"
exit 0
