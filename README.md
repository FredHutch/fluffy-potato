# R/Matrix/EB toolchain test case

## The Calculation

Generate a matrix with dimension 300x300 with sequential values from 1 to 90,000:

    1   2   3 ... 300
    301 302 303 ...

Generate a transpose of this matrix and multiply (dot-product) M x Mt.  Return the value and location of the maximum

## Use

The two shell scripts `matrix-test-py.sh` and `matrix-test-R.sh` are used to test the python and R versions of this calculation

Submit the job setting the environment variable `MODULE` to the desired module name:

    sbatch --export=MODULE=R/3.6.2-foss-2019b ./matrix-test-R.sh


