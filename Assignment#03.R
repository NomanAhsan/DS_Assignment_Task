install.packages("dplyr")
install.packages("Hmisc")
install.packages("corrplot")
install.packages("lattice")
install.packages('reticulate')
library(dplyr)                
library(Hmisc)                
library(corrplot)
setwd("C:\\Users\\This PC\\Desktop\\Mid\\Data")
getwd()
usedcars <- read.csv("vehicles_small.csv")
usedcars
dim(usedcars)                 
head(usedcars,4L)             
colnames(usedcars)            

lengths(lapply(usedcars, unique))
summary(usedcars$price)
summary(usedcars$year)
summary(usedcars$odometer)
unique(usedcars$condition)
for (i in usedcars$condition){
  usedcars$condition[usedcars$condition=="like new"]<-"EXCELLENT"
  usedcars$condition[usedcars$condition=="fair"]<-"Good"
}

unique(usedcars$condition)
usedcars$condition


df_cleaned <- select(usedcars,-c(url,region_url,image_url))
df_cleaned
# variable/column selection

discard<-c()

for (i in 1:length(df_cleaned)){
  if(length(which(is.na(df_cleaned[,i]))) > 0.4*nrow(usedcars))
    discard<-append(discard,i)
}
df_cleaned<-df_cleaned[,-discard]
dim(df_cleaned)



df_cleaned<-filter(df_cleaned, between(price, 999.99, 99999.00))
df_cleaned<-filter(df_cleaned,year>1990)
df_cleaned<-filter(df_cleaned,odometer < 899999.00)

summary(df_cleaned$price)
summary(df_cleaned$odometer)
summary(df_cleaned$year)





Data<-subset(df_cleaned,select = -c(id,region,manufacturer,model,condition,cylinders,
                                    fuel,title_status,transmission,state,
                                    vin,drive,size,type,paint_color,description))


dim(Data)

correlation<-cor(Data)

corrplot(correlation,method = "number",title="Correlation Matrix",bg = "honeydew",mar = c(2,2,2,2),
         addgrid.col = "lightcyan2",tl.col = "black")

plot(Data$odometer,Data$price,xlab = "Odometer",ylab = "Price",col=2)
title("Scatter Plot")

plot(Data$year,Data$price,xlab = "Year",ylab = "Price")
title("Scatter Plot")


hist(Data$odometer,col = 10,border = 4,xlab = "ODOMETER")

hist(Data$year,col = 8,border = 4,xlab = "Year")


boxplot(Data$price,xlab= "Price",main = "Boxplot of Price",col=10)
