#!/bin/bash
pkill -f "ssh -L 25324:127.0.0.1:25324 foster -fNT"
pkill -f "ssh -L 25850:127.0.0.1:25850 foster -fNT"

ssh -L 25324:127.0.0.1:25324 foster -fNT # then run ssh 127.0.0.1 -p 33222 on your side to enter the rev shelll
ssh -L 25850:127.0.0.1:25850 foster -fNT # then run ssh 127.0.0.1 -p 33222 on your side to enter the rev shelll
