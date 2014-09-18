import argparse
import sys,os
from pylab import *
from scipy import stats as st
import csv

'get args
'parser=argparse.ArgumentParser()

#read in small data from .csv file
'filepath='../'
filepath='E:/USworks/FACE-IT/GisHub/WeatherPlotting/R/'

#load data
data=[] #define empty list for data reading
for row in csv.reader(open(filepath+"KEMBKAXA.csv"),delimiter=','):
    data.append(row) #read data raw by raw

#split data input header and values
header=data[2]

    
