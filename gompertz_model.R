#read dataset
tumdata <- read.table("TUMspher.txt", header=TRUE,sep=",")
attach(tumdata)

#lntumvol to tumvol
tumvol = exp(tumdata[,4])
tumdata = cbind(tumdata,tumvol)

#check assumption for lda
#dataframe
tumdata_sub = as.data.frame(cbind(tumdata[,3],tumdata[,5],tumdata[,2]))
names(tumdata_sub) = c("day","tumvol","id")
tumdata_sub$id = as.factor(tumdata_sub$id)

#plot data
plot(day, tumvol)


#remove outliers above 1200 in volume
yout=tumvol>1200   # some logical rule for identifying an outlier
day2 = day[!yout]
tumvol2 = tumvol[!yout]
id2 = id[!yout]
outlier_rm = cbind(day2,tumvol2)
mydata = as.data.frame(outlier_rm[1:55,])

#plot with outliers removed
plot(mydata$day2,mydata$tumvol2)




# Model accuracy

#growthmodels in r

library(easynls)

#fit data to the exponential model
model1 = nlsfit(mydata, model = 6, start = c(a=200, b =.1))
model1


#plot data
nlsplot(mydata, model = 6, start = c(a = 200, b = .1), 
        xlab = "Days" , ylab = "Tumor Volume", position = 1)

#fit data to the gompertz model
model2 = nlsfit(mydata, model = 10, start = c(a = 200, b = 2, c = .1))
model2


#plot data
nlsplot(mydata, model = 10, start = c(a = 200, b = 2, c = .1), 
        xlab = "Days" , ylab = "Tumor Volume", position = 1)

