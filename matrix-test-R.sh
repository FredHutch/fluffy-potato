#!/bin/bash

module load ${MODULE}
module load OpenBLAS/0.3.1-GCC-7.3.0-2.30

hostname
./matrix-test.R
