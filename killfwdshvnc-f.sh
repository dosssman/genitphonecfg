#!/bin/bash
pkill -f "ssh -L 25325:127.0.0.1:25325 foster -fNT"
pkill -f "ssh -L 25851:127.0.0.1:25851 foster -fNT"
