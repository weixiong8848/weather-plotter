#! /bin/bash


#set -x

if [ $# -ne 2 ]
then
  echo "Usage: `basename $0` {acebfile} {outputfile}"
  exit -1
fi


export WORK_DIR=$PWD
cd $WORK_DIR
#cp /home/galaxy/galaxy-python/galaxy/tools/myTools/aceb2csv-1.0-beta1.jar $WORK_DIR
#cp /home/galaxy/galaxy-python/galaxy/tools/myTools/boxplot.r $WORK_DIR

acebfile=$1

# Run the java scrip to transfer the wether data from .aceb to .cvs file
java -Xms256m -Xmx768m -jar aceb2csv-1.0-beta1.jar $acebfile $WORK_DIR

# Plot the cvs
# Ensure R executable is found
which R > /dev/null || fail "'R' is required by this tool but was not found on path" 


for file in ./*.csv;do
# Invoke R passing file named by first argument to stdin
#filename=echo $file | cut -d'/' -f 2
echo ${file:(-12)}
R --vanilla --slave --args $PWD "${file:(-12)}" < "BoxPlot.r"
rm -f ${file:(-12)}

done



