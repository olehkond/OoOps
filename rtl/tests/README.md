## RTL Verification
This folder contains all the testbenches for submodules as well as top-level module. Most submodule testbenches are out of date as functionality has been added and have been disabled in the make file.

Top level testbench is configured to randomize the initial memories to random numbers between -300 and 300 and sort the first 30 addresses by value. A python script checks that the memory is indeed sorted and can be verfied by opening the `BUBBLE_SORT_RESULT.log` file.

A DVE window can be opened by changing to the vcs folder and running `make`, though that is unnecessary to verfiy the results (which is done automatically via the `BUBBLE_SORT_RESULT.log` file)