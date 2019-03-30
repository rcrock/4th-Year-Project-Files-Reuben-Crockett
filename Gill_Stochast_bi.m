function [T,P]=Gill_Stochast_bi(Time,Initial,Parameters)
q=zeros(1000,11);
for i=1:11
v= -0.05:0.01:0.05;



n=[v(i)];
m=repmat(n,1,1000);
for a=1:1000 

x = [1 2 3 4 5 6 7 8 9 10 11 12]; %treatment times
y = (m(a)*x) + 0.7 - (6.5*m(a)) ; %treatment coverage levels


 r = 0.5*365*[1:26];
 y = [0 y 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

I=Initial(1);
T=0; P(1)=I;
b=1;
k=1;
while (T(k)<Time(2)&& I>0)

    [step,new]=Iterate(I,Parameters);
    k=k+1;
    T(k)= T(k-1) + step;
	if     T(k) > r(b) && T(k-1) < r(b) 

        I = I-floor(I*y(b));
        T(k)=r(b);
	b=b+1;
     
   P(k)=I;
    else
    I = new;
    P(k)=I;
    
    end
    
	
	if I <= 0
        h=T(k);
		break
     else 
        h = 12*365;
	end

    if k>=length(T)
        T(k*2)=0;
        P(k*2)=0;
    end

end

T=T(1:k); P=P(1:k);

    q(a,i)= h;





end


end
q=q/365;
f = zeros(1,11);
n = zeros(1,11);
for i = 1:11
    d = 0;
        a = 0;
    for j = 1:1000
        
        if q(j,i) ~= 12
            d = d +  q(j,i);
            a = a+1;
        end
    end
    f(i) = d/a;
    n(i) = a;
end
      
z=-0.05:0.01:0.05;



plot(z,f)
xlabel('Treatment Plan Gradient')
ylabel('Time To Extinction')

A = 'Time to extinction = ';
B = 'Number of simulations that go extinct =';


disp(A)
disp(f) %average time to extinction
disp(B)
disp(n) %number that go extinct
