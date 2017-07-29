#/bin/bash

#remove current documentation
rm docs/*.*
rm -r docs/src

#copy new documentation
cp -r .stack-work/install/x86_64-linux-nopie/lts-8.23/8.0.2/doc/qchas-0.1.0.0/*.* docs/
mkdir docs/src
cp -r .stack-work/install/x86_64-linux-nopie/lts-8.23/8.0.2/doc/qchas-0.1.0.0/src/*.* docs/src