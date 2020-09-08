# R/Matrix/EB toolchain test case

## The Calculation

Generate a matrix with dimension 300x300 with sequential values from 1 to 90,000:

    1   2   3 ... 300
    301 302 303 ...

Generate a transpose of this matrix and multiply (dot-product) M x Mt.  Return the value and location of the maximum

## The Error

The product of this operation should result in the largest value in the last cell of the matrix.  The value should be 814054500000.

In our environment, using R version 3.6.2 built against the EasyBuild foss-2018b toolchain returns unpredictable and changing values when the matrix is above a dimention between 200 and 250.  The returned largest value changes with most every execution as does the cell where that largest value is found. For example, these were run as jobs on multiple different nodes:

```
[1] 966440835000
     row col
[1,] 300 263

[1] 965189576400
     row col
[1,] 263 226

[1] 965695860000
     row col
[1,] 300 208

[1] 963398250000
     row col
[1,] 150 263

[1] 1.419787e+12
     row col
[1,] 300 188

[1] 9.65425e+11
     row col
[1,] 300 188

[1] 1.420539e+12
     row col
[1,] 150 300

[1] 1.421468e+12
     row col
[1,] 224 125
```

Running this same code using the R 3.6.2 built with the 2019b toolchain yields consistent (correct) results.

## Discussion

 - This is the only matrix operation I've tried.  It does appear that the matrix and transpose are generated properly in the error case, but during the dot-product something is going sideways.  Other operations should be tested.

 - This does look like a problem of uninitialized values in the target matrix for the dot-product.

 - The fact that it only seems to occur at larger dimensions is curious

## Use

The two shell scripts `matrix-test-py.sh` and `matrix-test-R.sh` are used to test the python and R versions of this calculation

Submit the job setting the environment variable `MODULE` to the desired module name:

    sbatch --export=MODULE=R/3.6.2-foss-2019b ./matrix-test-R.sh

# Other Information

## AVX/OpenBLAS Bug 2168

[Bug 2168](https://github.com/xianyi/OpenBLAS/issues/2168) indicates issues with OpenBLAS and the AVX-512 instruction set.  A test case was given that uses a small snippet that returns unpredictable results in some cases on hosts with AVX-512 features on the CPU.

This does not seem to be the case here.  First, this happens on non-AVX512 hosts (the F class hosts). I have also run this code on AVX-512 and non-AVX-512 hosts and gotten consistent answers.

The [script](https://github.com/xianyi/OpenBLAS/issues/2168#issuecomment-512959445) `rgb-lab-convert.R` contains this test case.
