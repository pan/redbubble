[![Code Climate](https://codeclimate.com/github/pan/redbubble/badges/gpa.svg)]
(https://codeclimate.com/github/pan/redbubble)

# Installation

## Ruby

Please use ruby version 1.9.2 above to run this program. The current stable
verion is recommended.

## The required gems 

  `$ bundle install`

# Usage Notes

You may get the help like below by invoking it with option '-h' or '--help'.
It will abort the execution if all the required options are not provided.

```
$ ./batch_processor.rb -h
Usage: batch_processor <options>
    -i, --input works.xml            Full path to the works file
    -o, --output directory           Output to this directory
    -h, --help                       Show this help message
```

Once the program finishes the generation, navigate to the output directory and
open index.html with a modern browser.

# Testing

The code is tested with ruby v2.1.2 on a Linux.  Run all the test cases, type

`$ rake`

Or run a particular test. For example, 

`$ ruby test/test_camera.rb -n test_set_maker`

# Performance

The time consuming part is multi-threaded in order to get the best concurrency.

# Tuning

Please make sure the user having proper rights and enough space to create lots
of new files and open as many as it is needed when running it against a large 
data set.

If you experience too many opened files issue, some tunning may help.
On Linux, verify and change how many files are allowed to be opened.

`$ ulimit -n`

On Mac, this can be done with launchctl.
