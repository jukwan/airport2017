import os
import glob
import pandas as pd

def appender(indir= "F:/Dropbox/Flight/DATA/", output = 'F:/Dropbox/Flight/DATA/cleaned_data/clean_data.csv'):
    os.chdir(indir)
    fileList= glob.glob("results_*.xlsx")
    #creating empty list
    dfList= []
    print(fileList)
    
    for filename in fileList:
        print(filename)
        df= pd.read_excel(filename) 
        dfList.append(df)
    appendDf= pd.concat(dfList, axis=0)
    appendDf.to_csv(output)
    
appender()



