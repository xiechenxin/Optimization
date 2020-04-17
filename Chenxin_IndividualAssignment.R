# Maximum Likelihood Estimation on Poisson Regression
# Chenxin XIE

#---------------------- simulate a data set----------------------------------#

n <- c(20, 30, 32, 40, 45, 52, 58, 35, 34, 21, 25, 35, 56, 50)
Y <- c(5, 7, 2, 1, 0, 7, 9, 5, 3, 2, 0, 5, 9, 4)
X <- rep(n,Y)

plot(table(X), main="Count data")

#---------------define a likelihood function for poisson----------------------#

Likelihood_Poisson <- function(x, lambda) {
  
  -sum(x * log(lambda) - log(factorial(x)) - lambda) 
}


# check likelihood with different lambda

Likelihood_Poisson(X, 3)  # 4581.972

Likelihood_Poisson(X, 10)  # 1987.448

# find the best lambda by plot the poisson ditribution 
pp = seq(20, 60, by = 2)
LL = c()
for (i in pp) {
lp = Likelihood_Poisson(X,i)
LL = append(LL, lp)
}
max_point = which.min(LL)

plot(pp, LL, type = 'l')
abline( v = pp[max_point], col = 3, lwd = 3)

pp[max_point] # 42

#-------------------use optim to get the maximum likelihood--------------------#

optim(par = 2, fn = Likelihood_Poisson, x = X, method = "Brent", lower = 10, upper = 60)

# $par
# [1] 42.33898
# 
# $value
# [1] 290.5263


#-------------------------compare with fitdistr--------------------------------#

library(MASS)
fitdistr(X, "Poisson")
#    lambda  
#  42.3389831 
# ( 0.8471186)

mean(X) # 42.33898
