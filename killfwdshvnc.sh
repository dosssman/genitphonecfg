#!/bin/bash
pkill -f "ssh -L 25324:localhost:25324 foster -fNT"
pkill -f "ssh -L 25850:localhost:25850 foster -fNT"
