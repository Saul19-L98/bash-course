# /bin/bash

echo "Package all scripts in one directory named shellCourse"
tar -cvf shellCourse.tar *.sh
pbzip2 -f shellCourse.tar

echo "Make a package directory with the help of tar and pbzip2"
tar -cf *.sh -c > shellCourseTwo.tar.bz
