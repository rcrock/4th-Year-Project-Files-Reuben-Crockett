function [step, new_value]=Iterate(I, Parameters);

beta=Parameters(1); gamma=Parameters(2); N=Parameters(3);

RInfect = beta*(N-I)*I/N;
RRecov = gamma*I;

r1=rand(1,1);
r2=rand(1,1);

step = -log(r2)/(RInfect+RRecov);

if r1<RInfect/(RInfect+RRecov)
    new_value=I+1;  % do infection
else
    new_value=I-1;  % do recovery
end
