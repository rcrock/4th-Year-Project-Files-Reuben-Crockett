function [T,P]=Gill_Stochast_area_treat(Time,Initial,Parameters)
q=zeros(1000,11);
u = zeros(1000,11);
for i=1:11
v= -0.05:0.01:0.05;



n=[v(i)];
m=repmat(n,1,1000);
for a=1:1000 

x = [1 2 3 4 5 6 7 8 9 10 11 12];
y = (m(a)*x) + 0.7 - (6.5*m(a)) ; 




r =365*[1 2 3 4 5 6 7 8 9 10 11 12];
v = 1:1:365*12;
I=Initial(1);
T=0; P(1)=I;
b=1;
s=1;
k=1;
o = 0;
while (T(k)<Time(2)&& I>0)

    [step,new]=Iterate(I,Parameters);
    k=k+1;
    T(k)= T(k-1) + step;
    if     T(k) > v(s) && T(k-1) < v(s)
        o = o +I;
        s = s+1;
    end
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
    u(a,i)= o;





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
e = mean(u);
      
z=-0.05:0.01:0.05;



plot(z,f)
xlabel('Treatment Plan Gradient')
ylabel('Time To Extinction')
%disp(u)
A = 'Total number of days spent by population infected for each gradient';
disp(A)
disp(e)