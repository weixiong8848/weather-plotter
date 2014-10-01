################################################################
##
## Retrieve the scenario full name from the weather csv file
##
################################################################

GetCliSceName<-function(csvfilename) {
    fifthchar<-substr(csvfilename,5,5)
    sixthchar<-substr(csvfilename,6,6)
    seventhchar<-substr(csvfilename,7,7)
    eigthchar<-substr(csvfilename,8,8)
    # the fifthchar
    df1<-data.frame(charname=c(0:6,'S',LETTERS[1:13]),value=c('1980-2009 baseline','A2-2005-2035 (Near-term)','B1-2005-2035 (Near-term)','A2-2040-2069 (Mid-Century)','B1-2040-2069 (Mid-Century)','A2-2070-2099 (End-of-Century)','B1-2070-2099 (End-of-Century)','sensitivity scenarios','observational time period (determined in file)','RCP3PD 2010-2039 (Near-term)','RCP45 2010-2039 (Near-term)','RCP60 2010-2039 (Near-term)','RCP85 2010-2039 (Near-term)','RCP3PD 2040-2069 (Mid-Century)','RCP45 2040-2069 (Mid-Century)','RCP60 2040-2069 (Mid-Century)','RCP85 2040-2069 (Mid-Century)','RCP3PD 2070-2099 (End-of-Century)','RCP45 2070-2099 (End-of-Century)','RCP60 2070-2099 (End-of-Century)','RCP85 2070-2099 (End-of-Century)'))
    df2<-data.frame(charname=c('X','0','Q','T',LETTERS[22:26]),value=c('no GCM used','imposed values (sensitivity tests)','Bias-corrected MERRA','NASA POWER','NARR','ERA-INTERIM','MERRA','NCEP CFSR','NCEP/DoE Reanalysis-2'))
    df3<-data.frame(charname=c('X','0',LETTERS[1:16]),value=c('no GCM used','imposed values (sensitivity tests)','bccr','cccma cgcm3','cnrm','csiro','gfdl 2.0','gfdl 2.1','giss er','inmcm 3.0','ipsl cm4','miroc3 2 medres','miub echo g','mpi echam5','mri cgcm2','ncar ccsm3','ncar pcm1','ukmo hadcm3'))
    df4<-data.frame(charname=c('0',LETTERS[1:20]),value=c('imposed values (sensitivity tests)','ACCESS1-0','bcc-csm1-1','BNU-ESM','CanESM2','CCSM4','CESM1-BGC','CSIRO-Mk3-6-0','GFDL-ESM2G','GFDL-ESM2M','HadGEM2-CC','HadGEM2-ES','inmcm4','IPSL-CM5A-LR','IPSL-CM5A-MR','MIROC5','MIROC-ESM','MPI-ESM-LR','MPI-ESM-MR','MRI-CGCM3','NorESM1-M'))
    df5<-data.frame(charname=c('X',LETTERS[1:20]),value=c('imposed values (sensitivity tests)','ACCESS1-0','bcc-csm1-1','BNU-ESM','CanESM2','CCSM4','CESM1-BGC','CSIRO-Mk3-6-0','GFDL-ESM2G','GFDL-ESM2M','HadGEM2-CC','HadGEM2-ES','inmcm4','IPSL-CM5A-LR','IPSL-CM5A-MR','MIROC5','MIROC-ESM','MPI-ESM-LR','MPI-ESM-MR','MRI-CGCM3','NorESM1-M'))
    df6<-data.frame(charname=c('X',LETTERS[1:11]),value=c('Observations (no scenario)','Mean Change from GCM','Mean Change from RCM','Mean Change from GCM modified by RCM','Mean Temperature Changes Only','Mean Precipitation Changes Only','Mean and daily variability change for Tmax,Tmin,and P','P,Tmax and Tmin daily variability change only','Tmax and Tmin daily variability and mean change only','P daily variability and mean change only','Tmax and Tmin daily variability change only','P daily variability change only'))
    #fifth char
    for (thisid in 1:nrow(df1)){
        if (fifthchar==df1[thisid,1]) time_emission<-df1[thisid,2]
    }
    #sixth char
    if (fifthchar=='0'){
        for (thisid1 in 1:nrow(df2)){
            if (sixthchar==df2[thisid1,1]) source<-df2[thisid1,2]
        }
    } else if (fifthchar %in% c(1:6)){
        for (thisid1 in 1:nrow(df3)){
            if (sixthchar==df3[thisid1,1]) source<-df3[thisid1,2]
        }
    } else {
        for (thisid1 in 1:nrow(df4)){
            if (sixthchar==df4[thisid1,1]) source<-df4[thisid1,2]
        }
    }
    # Seventh char
    for (thisid in 1:nrow(df5)){
        if (seventhchar==df5[thisid,1]) method<-df5[thisid,2]
    }
    # Eighth char
    for (thisid in 1:nrow(df6)){
        if (eigthchar==df6[thisid,1]) type<-df6[thisid,2]
    }
    
    return(paste(time_emission,source,method,type,sep="_"))
}
