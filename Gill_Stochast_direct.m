function [T,P]=Gill_Stochast(Time,Initial,Parameters)


%end


I=Initial(1);
T=0; P(1)=I;
b=1;
k=1;
while (T(k)<Time(2)& I>0);

    [step,new]=Iterate(I,Parameters);
	
    k=k+1;
	
    T(k)=T(k-1)+step;
    
    P(k)=new; I=new;
	
	
	

    if k>=length(T)
        T(k*2)=0;
        P(k*2)=0;
    end
end

T=T(1:k); P=P(1:k);
