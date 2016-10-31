#!bin/bash

matlab -nodesktop -nosplash -r "test('mac');exit" && python predict_final.py && rm test*.csv && rm train*.csv && rm *OnlyOrg.csv

