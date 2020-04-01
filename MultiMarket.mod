
param N;
param M;
param alpha;
param K;

param q {1..N, 1..N, 1..M};
param r {1..N,1..N};

var x {1..N} >= 0;
var y {1..M} binary;


maximize Return:  alpha*sum {i in 1..N, j in 1..M} r[i,j]*x[i,j] - 
					(1-alpha)*sum {i in 1..N, j in 1..N} q[i,j,h]*x[i,j]*x[j,h]*q[j,h];
  
subject to c1:
	sum {i in 1..N, j in 1..M} x[i,j] = 1;

subject to c2 {j in 1..M}:
	sum {i in 1..N} x[i,j] <= y[j];
	
subject to c3:
	sum{j in 1..M} y[j] <= K;
	
