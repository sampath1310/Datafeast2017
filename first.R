setwd('3042017/')
train<- read.csv('Train/train.csv')
user <- read.csv('Train/user.csv')
artic <- read.csv('Train/article.csv')
test <- read.csv('test.csv')
######USER csv######
plot(user$Var1)
###filling na for var1 to A mean of Var1
user$Var1[user$Var1=='']<-'A'
user$Var1 <- factor(user$Var1)
str(user)
####filling na for Age
plot(user$Age)
## age with 15-20  like to have more time
user$Age[user$Age==""]<- "15-20"
user$Age <- factor(user$Age)
####Artical######
artic$VintageMonths[is.na(artic$VintageMonths)] <- 18
###3Merging all csvs together and test

##merging train and useer



train <- merge(train,user,by="User_ID")
test <- merge(test,user,by="User_ID")
#merging train and artical
train <- merge(train,artic,by="Article_ID")
test <- merge(test,artic,by="Article_ID")

#### Preparing train for final model 
train <- train[,c(1,3,4,5,6,2)]
test <- test[,c(3,4,5,6,7)]
write.csv(train,file = "finaltrain.csv")
write.csv(test,file = "finaltest.csv")
