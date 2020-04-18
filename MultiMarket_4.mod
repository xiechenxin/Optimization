param N; 
param M;
param alpha; 
param K;

param r{1..N, 1..M}; 
param q{1..N,1..N, 1..M}; 

var x{1..N, 1..M} >=0;
var y{1..M} binary;

maximize Return: sum{j in 1..M} ( alpha*(sum{i in 1..N} r[i,j]*x[i,j]) - (1-alpha)*(sum{i in 1..N, h in 1..N} (q[i,h,j]*x[i,j]*x[h,j])));


subject to TotalBudget: sum{j in 1..M, i in 1..N} x[i,j]= 1;

subject to MarketBudget {j in 1..M}:
	sum{i in 1..N} x[i,j] <= y[j];
	
subject to NumMarketInvest:
    sum{j in 1..M} y[j] <= K;
