#final project

library(readr)

mydata <- read.csv("schooldata.csv")
head(mydata)

mydata$WFT2 <- as.numeric(gsub('\\$|,', '', mydata$WFT2))
mydata$WFT3 <- as.numeric(gsub('\\$|,', '', mydata$WFT3))
mydata$WFT4 <- as.numeric(gsub('\\$|,', '', mydata$WFT4))
mydata$PFT2 <- as.numeric(mydata$PFT2)
mydata$PFT3 <- as.numeric(mydata$PFT3)
mydata$PFT4 <- as.numeric(mydata$PFT4)


head(mydata)
str(mydata)
dim(mydata)
glimpse(mydata)
stat.desc(mydata)
summary(mydata)

library(ggplot2)

ggplot(mydata, aes(x = Instructional.Program.Title, y = PFT2)) + geom_point()
ggplot(mydata, aes(x = Instructional.Program.Title, y = PFT3)) + geom_point()
ggplot(mydata, aes(x = Instructional.Program.Title, y = PFT4)) + geom_point()

ggplot(data = mydata, mapping = aes(x = PFT2, y = PFT4)) +
  geom_point(mapping = aes(color = Instructional.Program.Title)) +
  geom_smooth()

library(pastecs)

model1 <- lm(PFT4 ~ PFT2, data = mydata)
#regress pft4 on pft2
#for every extra bit of pft2, we expect an extra 0.8262 bit in pft4
#for every additional $? earned after 2 years working full-time, we expect an additional 0.8262 earned in the 4th year after graduation while working full-time.
#this tells us that it does matter to obtain a higher-paying position just after graduation, but it may not matter all that much.

model1
summary(model1)

library(DataExplorer)
DataExplorer::create_report(mydata)
#Data Explorer report is also attached

install.packages("psych")
library(psych)
describe(mydata)
cor(mydata)

#The data dictionary for this data can be found in the State of Minnesota [Data Tool
#(https://apps.deed.state.mn.us/lmi/etd/Results.aspx)



