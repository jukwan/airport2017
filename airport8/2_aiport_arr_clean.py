

import numpy as np
import pandas as pd
import datetime as datetime
# laod the data
airports= ['BOS',
            'PVD',
            'MHT',
            'ORH',
            'LAX',
            'SNA',
            'BUR',
            'LGB']

path ="F:/Dropbox/Flight/DATA/"
df = pd.read_excel(path+"8_airports_arr.xlsx")
df['key']= range(1,(len(df)+1),1)
for code in airports:
    print(code)
    # df1.dtypes
    df1=df[df["arr_airport_code"]==code]
    
    df2 = pd.read_excel(path+"air_"+code+".xlsx")
    # df1=df[df["dep_airport_code"]=='BOS']
    # df2 = pd.read_excel("F:/Dropbox/Flight/DATA/air_BOS.xlsx")
    print(len(df1))
    # df2.dtypes
    df2['next_obs']= df2['time'].shift(-1)
    df2['next_obs'].head(n=3)
    df2['obs1']= pd.to_timedelta(df2['time'])
    df2['obs2']= pd.to_timedelta(df2['next_obs'])
    df2['mid'] = df2['next_obs']-(df2['obs2']-df2['obs1'])/2
    df2['mid'].fillna(method= 'ffill',inplace=True)
    df2['next_obs'].fillna(method= 'ffill',inplace=True)
    df2['id']= pd.Series(np.arange(len(df2)+1))
    del df2['date']
    del df2['obs1']
    del df2['obs2']
    df2.to_csv('df2.csv')
    # df1.index= range(1,len(df1)+1) % error occured.

    df1.date=pd.to_datetime(df1['scheduled_arrival_date'])
    df1.time=pd.to_datetime(df1['scheduled_arrival_time'])

    df1.hours= df1.time.dt.hour
    df1.min = df1.time.dt.minute
    df1.sec = df1.time.dt.second
    
    # df1['time']=pd.to_datetime(df1.date)+pd.to_timedelta(df1.hours,unit='h')+pd.to_timedelta(df1.min,unit='m')+pd.to_timedelta(df1.min,unit='s')
    time = pd.DataFrame({'time': pd.to_datetime(df1.date)+pd.to_timedelta(df1.hours,unit='h')+pd.to_timedelta(df1.min,unit='m')+pd.to_timedelta(df1.sec,unit='s')})

    df1= pd.concat([df1,time],axis=1)

    # df1.to_csv('df1.csv')
#     ##This will work only 1:1 merge
#     # df1= df1.set_index("time")
#     # print(df1)
#     # df2= df2.set_index("date")
#     # print(df2)
#     # df1.reindex(df2.index, method='nearest')
#     # print(df1.head())

    d_time= df1[['time','key']]
    a_time= df2[['time','id','mid']]
    aa= d_time.append(a_time, ignore_index=True)
    aa.index= range(1,len(aa)+1)

    aa= aa.sort_values('time')
    aa['new_id']= aa['id']
    aa['mid_id']= aa['id']
    aa['mid'].fillna(method= 'ffill', inplace=True)
    aa.iat[-1,2] =aa.iat[-1,3] # replace last midtime as real time
    
    aa['mid_id'].fillna(method= 'ffill', inplace = True)
    aa['new_id']= np.where((( aa['time'] < aa['mid'] )),aa['mid_id'],aa['mid_id']+1)
    aa.to_csv('aa.csv')
    ab= aa[aa['id'].isnull()==True]
    # print(ab.head())
    ab.to_csv('ab.csv')

    df3= pd.merge(df1,ab,on='key',indicator=False)
    del df3['id']
    del df3['mid']
    del df3['mid_id']
    df3.to_csv('df3.csv')

    # print(df3.head())
   
    result = pd.merge(df3,df2, left_on='new_id', right_on= 'id',indicator=True)

    result.to_excel(path+'results_'+code+'_arr.xlsx')