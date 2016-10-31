#!bin/bash

matlab -nodesktop -nosplash -r "test('windows');exit" && python predict_final.py && rm test*.csv && rm train*.csv && rm *OnlyOrg.csv
