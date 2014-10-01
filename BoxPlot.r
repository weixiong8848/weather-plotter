
source("GetCliSceName.r")
Weather_Boxplot<-function(fileDir,infile){
    setwd(fileDir)
    my<-read.csv(infile,skip=2)
    x<-as.POSIXct(paste(my$W_DATE),format="%Y%m%d")
    mo<-strftime(x,"%m")
    yr<-strftime(x,"%Y")
    dd<-data.frame(yr,mo,my$SRAD,my$TMAX,my$TMIN,my$RAIN)
    dd<-dd[-11323,]
    
    Rad<-aggregate(my.SRAD~yr+mo,dd,sum)
    MaxT<-aggregate(my.TMAX~yr+mo,dd,mean)
    MinT<-aggregate(my.TMIN~yr+mo,dd,mean)
    RAIN<-aggregate(my.RAIN~yr+mo,dd,sum)
    #out<-merge(my.Rad,my.MaxT,MinT,RAIN,by=c('yr','mo'))
    
    png("Boxplot.png",height=500,width=800)
    #png(paste(outfile,".png",sep=''))
    #Boxplot
    attach(mtcars)
    
    oldpar<-par(mfrow=c(2,2),oma=c(1,1,3,1))
    
    boxplot(my.SRAD ~ mo, data = Rad,
    xlab = "Month", xaxt="n",whiskcol="red",col="red",outline=TRUE,ylab = "MJ",
    main = "SRAD"
    )
    axis(1,at=1:12,labels=c("J","F","M","A","M","J","J","A","S","O","N","D"))
    mtext(paste(substr(infile,1,4),GetCliSceName(infile)), outer=TRUE, side=3,cex=1.5)
    

    boxplot(my.TMAX ~ mo, data = MaxT,
    xlab = "Month", xaxt="n",whiskcol="red",col="red",outline=TRUE,ylab = "°C",
    main = "MAXT"
    )
    axis(1,at=1:12,labels=c("J","F","M","A","M","J","J","A","S","O","N","D"))
    
    boxplot(my.TMIN ~ mo, data = MinT,
    xlab = "Month", xaxt="n",whiskcol="red",col="red",outline=TRUE,ylab = "°C",
    main = "MINT"
    )
    axis(1,at=1:12,labels=c("J","F","M","A","M","J","J","A","S","O","N","D"))
    
    boxplot(my.RAIN ~ mo, data = RAIN,
    xlab = "Month", xaxt="n",whiskcol="red",col="red",outline=TRUE,ylab = "mm",
    main = "RAIN"
    )
    axis(1,at=1:12,labels=c("J","F","M","A","M","J","J","A","S","O","N","D"))
    
    dev.off()
}


args<-commandArgs(trailingOnly=TRUE)
fileDir<-args[1]
infile<-args[2]
#"Boxplot"
Weather_Boxplot(fileDir,infile)


#ggplot
#require(ggplot2)
#ggplot(Rad, aes(mo, Max.Temp)) + geom_boxplot() +
#  ylab("Maximum Temperature") +
#  opts(title = "Temperature at Southampton Weather Station (1950-1999)")>jpeg('rplot.jpg')

