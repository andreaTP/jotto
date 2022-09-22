#! /bin/bash
set -euxo pipefail

OUTPUT_DIR=$1

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

EXTRA_INCLUDE=""
if [ "$(uname)" == "Darwin" ]; then
  EXTRA_INCLUDE="-I /Library/Developer/CommandLineTools/usr/include/c++/v1 -I /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"
fi

# using the bundled
# jextract ${EXTRA_INCLUDE} --source -t tech.jotto --include-function hello_world -l jotto -d ${OUTPUT_DIR} -- ${SCRIPT_DIR}/../native/lib.h
# compiled from source
jextract ${EXTRA_INCLUDE} --source -t tech.jotto --include-function hello_world -l jotto --output ${OUTPUT_DIR} ${SCRIPT_DIR}/../native/lib.h
