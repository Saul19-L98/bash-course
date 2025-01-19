# /bin/bash

echo "Package all scripts in one directory named shellCourse"
tar -cvf shellCourse.tar *.sh

#When you use gzip to make a package, this command deletes the previous package
gzip shellCourse.tar

echo "Package one file with a 9 ratio."
gzip -9 9_options.sh

