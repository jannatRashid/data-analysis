
```{r }
data()
#to see the list of all available data sets 
```


```{r }
data( trees)
#for loading the desired data set 

head(trees)
# to print the top most values of data 

dim(trees)
# it gives the dimensions  of the data that means the total rows and columns of data 

print(summary(trees))
#this command gives the summary of the data set which is in consideration

table(trees$Height)
#it gives the data of the desired column in the table form 
table(trees$Girth,trees$Height)
# we can make table by using more than one column 

```

# Basic plots 
#----------------

```{r}

plot(trees$Volume, trees$Height, col = "Blue")
# it is a simple basic plot which is represented in a shape of a dot we can also say it a dot plot and the col() command is used to make a plot representative it adds some colour to the graph  

library(ggplot2)
#it is a system for declaratively cresting graphics ,based on the grammar of graphics 
boxplot(trees$Height , trees$Volume, main="Fig.-1: Boxplot of height and volume of trees", col= rainbow(2))
#this commands presents the graph of a data in a box form this graph is plotted between the height and the volume of trees 

boxplot(trees,col = rainbow(5),main="boxplot of trees database")
# this is to show the box plot of complete  trees data base 

hist(trees$Height, breaks= 5, col = 'navy blue',
     xlab= 'height of trees', 
     main = 'Histogram for height of trees for the trees dataset')
# this  a command for histogram for the height of trees ,xlab means on x-axis,main means the title we want to give to our graph ,col() will put any colour of your choice to your graph ,breaks means the the width of the bars 

barplot(trees$Height , horiz=FALSE)
# this is a bar plot of height , and the bars are in vertical position

barplot(trees$Height , horiz=TRUE)
# this is a same bar plot for the height of trees but in horizontal position 
```
# Correlation
# ---------------

```{r}
cor(trees)
#it measures the correlation coeefitiont value between two vectors
# all the values of correlation coefficient  are positive 
library(corrplot)
# this library is used to make a correlation plot 
cor.mat.trees = cor(trees)
corrplot(cor.mat.trees)

```

# Confidence interval
# -------------------
```{r}
library(Rmisc)

CI(trees$Height, ci = 0.95)


var(trees$Height)


mean(trees$Height)


```

# Hypothesis testing
# -------------------
```{r}
t.test(trees)

t.test(trees , conf.level = 0.1)

prop.test(65,100,0.75)

t.test(trees$Height, mu = 20)

t.test(trees$Height, mu =20 , alternative = 'greater')






```

# Chi-square test
# ---------------
```{r}
chisq.test(trees$Height, trees$Volume)

#there is no association between height and volume of trees 

chisq.test(trees$Girth, trees$Height)
#there is  a slight association between Girth and HEIGHT OF TREES 
```
# Analysis of Variance
# --------------------

```{r}
library(tree)

boxplot(trees$Girth , trees$Height, col= rainbow(7))
model1 <- aov(trees$Girth ~ trees$Height)
summary(model1)

```

# Linear and Multiple Regression Models:
# --------------------------------------

```{r}
attach(trees)
 boxplot(trees$Girth , trees$Height, data =trees, col = rainbow(4))
fit.LR <- lm(trees$Girth ~ trees$Height, data = trees)
summary(fit.LR) 
# intercept is not significant for this regression because p-value is greater than 0.05
#the height has an significant impact on the Girth of tress because it has a p-value less than 0.05
#as the coefficient is positive we can say that higher the height higher will be the Girth 
#the F-test shows that the regression model is very good because the p-value is less than 0.05



fit.MR <- lm(trees$Girth ~ trees$Height + trees$Volume)
summary(fit.MR)
#the p-value of intercept is less than 0.05 and it is significant
#there is 96 percent correlation between all independent and dependent variable
#volume of the data set trees is highly significant
#the F-test shows thst the regression model is very good because the p-value is less than 0.05

anova(fit.LR)

```
