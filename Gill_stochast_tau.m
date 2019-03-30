function [T,P]=Gill_stochast_tau(Time,Initial,Pa)
m=0;

x = [1 2 3 4 5 6 7 8 9 10 11 12];
y = (m*x) + 0.7 - (6.5*m) ; 



r =365*[1 2 3 4 5 6 7 8 9 10 11 12];

 
b=1;

S=Initial(1); I=Initial(2); 
tau=Pa(5);

T=[0:tau:Time(2)]; P(1,:)=[S I];
orig=[S I];


k=1;
while (T(k)<Time(2))  
    [adjusted]=t_leap(orig,Pa);
	      k=k+1;
         if     T(k) > r(b) && T(k-1) < r(b) %T(k) == r(b)

        I = I-floor(I*0.7);
        T(k)=r(b);
	b=b+1;
     
   P(k)=I;
    else
   P(k,:)=adjusted; orig=adjusted;
    end
    
	
end