#!/bin/bash
cd /EyeSpy
python3.6 eyespy.py --docker --name "Tate"

#now copy the result
yes | cp -rf /EyeSpy/*.pdf /result/
