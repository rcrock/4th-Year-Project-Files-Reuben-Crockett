function [T,P]=Gill_Stochast_var_bi(Time,Initial,Parameters)

for i=1:11

j = (i)/12;

for a=1:1000 

n = 0.7;
m=repmat(n,1,12);

y = [0 m 0 0 0 0 0 0 0 0 0 0 0];


r = 365*[1 (1+j) 2 (2+j) 3 (3+j) 4 (4+j) 5 (5+j) 6 (6+j) 7 (7+j) 8 (8+j) 9 (9+j) 10 (10+j) 11 (11+j) 12];

I=Initial(1);
T=0; P(1)=I;
b=1;
k=1;
while (T(k)<Time(2)&& I>0)

    [step,new]=Iterate(I,Parameters);
    k=k+1;
    T(k)= T(k-1) + step;
	if     T(k) > r(b) && T(k-1) < r(b) %T(k) == r(b)
   % new = new - floor(new*y(b));
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
%q(a) = h;
    q(a,i)= h;





end


end
z=1:11;

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
      




plot(z,f)
xlabel('Month Of Treatment Subsequent To Annual Treatment ')
ylabel('Time To Extinction')
A = 'Time to extinction = ';
B = 'Number of simulations that go extinct =';
disp(A)
disp(f)
disp(B)
disp(n)


xlim([0 12])
ylim([4.4 5.4])
