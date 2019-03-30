function [T,P]=Gill_Stochast(Time,Initial,Parameters)



for a = 1:1000
% plot(x,y);
% %plot([1 2 3 4 5 6 7 8 9],[0.50 0.55 0.60 0.65 0.70 0.75 0.80 0.85 0.90]);
% xlabel 'year';
% ylabel 'treatment level';
r =365*[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];
I=Initial(1);
T=0; P(1)=I;
b=1;
k=1;
m = 0.00;
x = [1 2 3 4 5 6 7 8 9 10 11 12];
%y = (m*x) + 0.7 - (6.5*m);
y = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

while (T(k)<Time(2))

    [step,new]=Iterate(I,Parameters);
    if I > 0.1*1000
       
        h = 12*365;
    elseif I <= 0
        h= k;
       
		break
     
	end
    k=k+1;
    T(k)= T(k-1) + step;
    
	
    I = new;
    P(k)=I;
    
    
    
	
	

    if k>=length(T)
        T(k*2)=0;
        P(k*2)=0;
    end

end
q(a) = h;
end
%disp(q)
%b = sum( q <= 2);
%disp(b)
r = sum( q <= (12*365-1));
A = 'Simulations that go extinct given that there is no (Major epidemic)';
disp(A)
disp(r)
%for i =1:1000
 %   if q(i) <= 0.01
  %      b = b+1;
   % end
%end
%disp(b)

T=T(1:k); P=P(1:k);
