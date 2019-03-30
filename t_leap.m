function [val]=t_leap(orig, Pa);

beta=Pa(1);
gamma=Pa(2);
mu=Pa(3);
N=Pa(4);
tau=Pa(5);
S=orig(1);
I=orig(2);
%updating theparameters based on the reaction that took place
R(1) = mu*N;       Change(1,:)=[+1 0];  
R(2) = beta*S*I/N;  Change(2,:)=[-1 +1];
R(3) = gamma*I;     Change(3,:)=[+1 -1];


val=orig;
%update time to next closest reaction
for i=1:3
    Num=poissrnd(R(i)*tau);
    Use=min([Num val(find(Change(i,:)<0))]);
    val=val+Change(i,:)*Use;
end