#!/bin/bash
# This is running under Ubuntu 16.04
# Install necessary packages.
sudo apt-get install blablabla -y

# Replace your C compiler command like `gcc` with `kcc`,
# Use `-fissue-report` flag to collect errors to `my_errors.json` file.
kcc -fissue-report=./my_errors.json main.c -o a.out

# Run the compiled program and collect run-time errors to `my_errors.json` file, which
# will be used next step to generate HTML report.
./a.out

if [ -f ./my_errors.json ]; then
  # Generate HTML report with `rv-html-report` command,
  # and output the HTML report to `./report` directory.
  rv-html-report ./my_errors.json -o report

  # Upload your HTML report to RV-Toolkit website with `rv-upload-report` command.
  # Please note that `rv-upload-report` only accepts absolute path of HTML report.
  rv-upload-report `pwd`/report

else
  echo "No errors found"
fi
# Done.
