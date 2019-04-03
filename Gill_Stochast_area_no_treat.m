function [T,P,q]=Gill_Stochast_area_no_treat(Time,Initial,Parameters)

for a=1:1000 






r = 365*[1 2 3 4 5 6 7 8 9 10 11 12];
v = 1:1:365*12;
I=Initial(1);
T=0; P(1)=I;
b=1;
s=1;
k=1;
o = 0;

y = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

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
q(a) = h;
u(a) = o;
end

T=T(1:k); P=P(1:k);

z =1;
q = mean(q/365);
o = mean(o);
A = 'Total number of days spent by population infected when there is no treatment';
disp(A)
disp(o)

