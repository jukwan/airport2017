import pandas as pd

# df = pd.read_csv('D:\Dropbox\Flight\Code\ZILLOW-Z99163_ZRISFRR.csv')

# print(df.head()) 

# df.set_index('Date', inplace = True)

# df.to_csv('newcsv2.csv')

# print(df.head())

# df = pd.read_csv('newcsv2.csv')
# print(df.head())
# df = pd.read_csv('newcsv2.csv', index_col = 0) # first column be a index.
# print(df.head())

# df.columns = ['Austin_HPI']
# print(df.head())

# df.to_csv("newcsv3.csv")
# df.to_csv("newcsv4.csv", header = False)

# df = pd.read_csv('newcsv4.csv', names =['Date', 'Pullman_HPI'], index_col =0)

# print(df.head())
# df.to_html('example.html')

df = pd.read_csv('newcsv4.csv',names =['Date', 'Pullman_HPI'])
print(df.head())

df.rename(columns = { 'Pullman_HPI':'Hustion_HPI'}, inplace = True)
print(df.head())