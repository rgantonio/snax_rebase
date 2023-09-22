# How to use this test directory?

This test directory is used for testing for all other things that we need to use for workbench.

* `/sim` - you need to create a sim directory and run your tcl scripts in here
* `/tcl` - contains the tcl scripts made for quick start
* `/tb` - contains all the testbenches for use
* `/mem` - contains all the data, instructions, and assembly codes. This is where you also run the `assembler.py`
```bash
python assembler.py <asm file without extension>
```
For example:
```bash
python assembler.py mac-test
```
After invocation it dumps a text file for instruction reading.
* `/flists` - contains the filelists to use for whatever test you are doing
* `/do` - do directory contains all the do files for waveforms