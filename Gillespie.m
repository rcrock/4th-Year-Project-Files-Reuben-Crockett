function [] = Gillespie(beta,gamma,I0,N0,MaxTime)


% Sets up default parameters if necessary.
if nargin == 0
   beta=1/45;
   gamma=1/50;
   mu=0;
   N0=10000;
   I0=ceil(N0*(1-(gamma + mu)/beta));
  
   MaxTime=12*365;
end

%Uncomment one of the following


%Annual treatments according to a line function
%[t, po]=Gill_Stochast([0 MaxTime],[I0],[beta gamma N0]);

%Biannual treatments according to a line function
%[t, po]=Gill_Stochast_bi([0 MaxTime],[I0],[beta gamma N0]);

%Biannual treatments with varying months of treatmetn between annual
%treatments
%[t, po]=Gill_Stochast_var_bi([0 MaxTime],[I0],[beta gamma N0]);

%Total number of people days spent infected with no treatment
%[t, po]=Gill_Stochast_area_no_treat([0 MaxTime],[I0],[beta gamma N0]);

%Total number of people days spent infected for treatment at varying
%gradients
%[t, po]=Gill_Stochast_area_treat([0 MaxTime],[I0],[beta gamma N0]);

%Tau-leap model with no treatment
%tau=1;
% S0= N0-I0;
%[t, po]=Gill_stochast_tau([0 MaxTime],[S0 I0],[beta gamma mu N0 tau]);
%T=t/365; S=po(:,1); I=po(:,2);
%plot(T,I,'-b');
%xlabel 'Time(years)';
%ylabel 'Number Of Infected Individuals'
%xlim([0 20])
%ylim([0 10000])

%Direct model with no treatment
%[t, po]=Gill_Stochast_direct([0 MaxTime],[I0],[beta gamma N0]);
%T=t/365; I=po;
 %plots the graphs with scaled colours
%h=plot(T,I,'-r');
%xlabel 'Years';
%ylabel 'Infectious'

%Plot the analytic and the simulation quasi-stationary steady state
%MaxTime=200*365;
% The main iteration 
%[t, po]=Gill_Stochast_quas_stat([0 MaxTime],[I0],[beta gamma N0]);

%Checking the simulated probability of extinction
%MaxTime = 20*365;
%N0 = 1000;
%I0=1;
%[t, po]=Gill_Stochast_P_ext([0 MaxTime],[I0],[beta gamma N0]);
T=t/365; I=po;