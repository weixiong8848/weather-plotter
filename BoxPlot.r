
my<-read.csv("KEMBKAXA.csv",skip=2)
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

jpeg('rplot.jpg')
#Boxplot
attach(mtcars)
par(mfrow=c(2,2))
boxplot(my.SRAD ~ mo, data = Rad,
  xlab = "Month", ylab = "Radiation",
  main = "SRAD"
)
boxplot(my.TMAX ~ mo, data = MaxT,
  xlab = "Month", ylab = "MaxT(oC)",
  main = "TMAX"
)
boxplot(my.TMIN ~ mo, data = MinT,
  xlab = "Month", ylab = "MinT(oC)",
  main = "TMIN"
)
boxplot(my.RAIN ~ mo, data = RAIN,
  xlab = "Month", ylab = "Precipitation(mm)",
  main = "RAIN"
)
dev.off()

#ggplot
#require(ggplot2)
#ggplot(Rad, aes(mo, Max.Temp)) + geom_boxplot() +
#  ylab("Maximum Temperature") +
#  opts(title = "Temperature at Southampton Weather Station (1950-1999)")>jpeg('rplot.jpg')

