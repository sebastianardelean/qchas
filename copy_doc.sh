#/bin/bash

#remove current documentation
rm docs/*.*
rm -r docs/src

#copy new documentation
cp -r .stack-work/install/x86_64-linux/lts-12.4/8.4.3/doc/qchas-1.1.0.0/*.* docs/
mkdir docs/src
cp -r .stack-work/install/x86_64-linux/lts-12.4/8.4.3/doc/qchas-1.1.0.0/src/*.* docs/src
