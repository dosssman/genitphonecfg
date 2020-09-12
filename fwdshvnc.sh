#!/bin/bash
pkill -f "ssh -L 25324:localhost:25324 foster -fNT"
pkill -f "ssh -L 25850:localhost:25850 foster -fNT"

ssh -L 25324:localhost:25324 foster -fNT # then run ssh localhost -p 33222 on your side to enter the rev shelll
ssh -L 25850:localhost:25850 foster -fNT # then run ssh localhost -p 33222 on your side to enter the rev shelll
