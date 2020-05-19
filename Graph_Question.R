library(dplyr)                
library(Hmisc)                
library(corrplot)
hotel<-read.csv('Hotelbooking.csv')        
summary(hotel)
colnames(hotel)   
CleanData <- na.omit(hotel)
CleanData
dim(CleanData)
ggplot(CleanData, aes(x=hotel,fill= arrival_date_month))+
  theme_bw()+
  geom_bar()
boxplot(CleanData$adr,data=CleanData,
        ylab = "Daily Rate", main = "Box Plot")
