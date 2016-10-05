#This file contains all the functions I will commonly use

import matplotlib.pyplot as plt
from IPython.display import *
import os
import numpy as np
from nibabel.testing import data_path
import nibabel as nib



def displayPlot(plt):
    plt.savefig("temp_plot.png")
    display(Image(filename='temp_plot.png'))
    

def scatterPlotGrid(data_x, data_y,grid_height ,grid_width, x_names, y_name):
    x = data_x #should be a list of lists
    y = data_y #should be a list
    
    fig1 = plt.figure()
    ax = [fig1.add_subplot( str(grid_height) + str(grid_width)  + str(i+1)   ) for i in range(0, len(x)  ) ]
    
    
    property_name = ['mean', 'variance' , 'standard variance', 'median', 'skewness', 'kurtosis']
    
    for i in range(0, len(x)):       
        ax[i].scatter(x[i],y,color='blue',s=5,edgecolor='none')
        ax[i].set_aspect(1./ax[i].get_data_ratio() )
        ax[i].set_ylabel('Brain Age')
        ax[i].set_xlabel(property_name[i])
            
    fig1.tight_layout()
    displayPlot(fig1)