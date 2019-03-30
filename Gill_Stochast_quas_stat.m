function [T,P]=Gill_Stochast(Time,Initial,Parameters)




% plot(x,y);
% %plot([1 2 3 4 5 6 7 8 9],[0.50 0.55 0.60 0.65 0.70 0.75 0.80 0.85 0.90]);
% xlabel 'year';
% ylabel 'treatment level';
c = 1:0.01:200;
r = 365*c;
m = zeros(1,10);
r = 365*c;

I=Initial(1);
T=0; P(1)=I;
b=1;
k=1;


w = zeros(1,20);
while (T(k)<Time(2)&& I>0)

    [step,new]=Iterate(I,Parameters);
    k=k+1;
    T(k)= T(k-1) + step;
	if     T(k) > r(b) && T(k-1) < r(b) %T(k) == r(b)
   I = I;
   w(b) = I;
        T(k)=r(b);
	b=b+1;
     
   P(k)=I;
    else
    I = new;
    P(k)=I;
    
    end
    
	
	
    if k>=length(T)
        T(k*2)=0;
        P(k*2)=0;
    end

end
%disp(w)
disp(w)

data = w;           %# Sample data
xRange = 0:10000;                %# Range of integers to compute a probability for
N = hist(data,xRange);        %# Bin the data
plot(xRange,N./numel(data),'r');  %# Plot the probabilities for each integer
xlabel('Number of Infected Individuals');
ylabel('Probability');
hold on
q = 1:10000;
N = 10000;
u = ((1/45)/(1/50))/N;
x = sum(exp((q - 1)*log(u) + gammaln(N-1 + 1) - gammaln(N - q + 1) - log(q)));
x = 1/x;
disp(x)
y = x.*(exp((q - 1)*log(u) + gammaln(N-1 + 1) - gammaln(N - q + 1) - log(q)));
plot(q,y,'b')
xlim([0 2000])
ylim([0 0.01])
hold off
%ylim([0 1]);
%xlim([0 10])
T=T(1:k); P=P(1:k);