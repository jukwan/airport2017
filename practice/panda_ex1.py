import pandas as pd
import matplotlib.pyplot as pylpot
import numpy as np
from matplotlib import style
style.use('ggplot')
web_stats = {'Day': [1,2,3,4,5,6],
            'Visitors' : [ 43,53,34,45,64,34] ,
            'Bounce_Rate' : [ 65,72,62,64,54,66 ]}

df = pd.DataFrame(web_stats)
# print(df)
# print(df.head) #first five
# print(df.tail(2)) # last five
# print(df.set_index('Day')) # set a specific variable as index.like ID
df.set_index('Day', inplace=True) # no need to define it.
print( df['Visitors'])
print(df.Visitors)

print(df[['Bounce_Rate','Visitors']]) # select multiple column within df.
print(df.Visitors.tolist()) # df to list
print(np.array(df[['Bounce_Rate','Visitors']])) # df to array

df2 = pd.DataFrame(np.array(df[['Bounce_Rate','Visitors']])) # array to numpy
print(df2)


###########input output of Pandas
