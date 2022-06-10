#Post-syn and Post-apr Verification Simulations

Contains folders to run post-synthesis and post-apr verification testbenchs. Both are configured to randomize their memories to random numbers between -300 and 300 and sort the first 30 addresses by value. A python script checks that the memory is indeed sorted and can be verfied by opening the `BUBBLE_SORT_RESULT.log` file.

Running make at the top level will have already done this, but to rerun the test simply run `make` in the appropriate folder. 