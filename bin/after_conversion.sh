#!/bin/bash

chmod g+rw *.mzML
SUBMIT_PATH=`readlink -f *.raw | xargs -I [] dirname []`
ln *.mzML "$SUBMIT_PATH"
