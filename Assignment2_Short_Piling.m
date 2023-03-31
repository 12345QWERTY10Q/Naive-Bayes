clc;
clear all;
%%
Short_Pile_Probability=zeros(1, 5);
Probabilities=zeros(5,5);
%%
% Five Scenarios Probabilities
% Y-axis
Y=[0.3 0.4 0.15 0.1 0.05];    %Prior State  
%%
% Observed Data->Likelihood Function {X1; X2} 
% X-axis  
X1=[0.2 0.4 0.6 0.8 1];       %Short Piling 
X2=[0.8 0.6 0.4 0.2 0];       %Normal Piling  
%%
Short_Pile_Probability(1,1)=Y*X1';
Probabilities(1,:)=Y;
%%
subplot(1,6,1)
fprintf('Prior Probabilities');
disp(Y*X1')
fprintf('Short Pile Probability');
disp(Y)
bar(X1,Y,'LineWidth',0.1,'BarWidth',0.15);
xlabel("p")
ylabel("P(p=pi)")
xlim([0 1.1])
ylim([0 0.5])
title("Priorprobability Mass Function of  'p'")
hold on;
%%
n=2;
while n<=3
      X=X2;
%%
    Y=(Y.*X)/(Y*X');            %Posterior State  
    P_ShortPiling=Y*X';
    %Ends:State Update(From Prior To Posterior)
    %Means:Naive Bayes
%%
    Short_Pile_Probability(1,n)=P_ShortPiling;
    Probabilities(n,:)=Y;
%%
    subplot(1,6,n)
    fprintf('Short Pile Probability');
    disp(P_ShortPiling)
    fprintf('Posterior Probabilities');
    disp(Y)
    bar(X1,Y,'LineWidth',0.1,'BarWidth',0.15);
    xlabel("p")
    ylabel("P(p=pi)")
    xlim([0 1.1])
    ylim([0 0.5])
    title("Priorprobability Mass Function of  'p'")
    hold on;
    n=n+1;
    while n <= 6
       X=X1;
       Y=(Y.*X)/(Y*X'); 
       P_ShortPiling=Y*X';
       Short_Pile_Probability(1,n)=P_ShortPiling;
       Probabilities(n,:)=Y;
       subplot(1,6,n)
       fprintf('Short Pile Probability');
       disp(P_ShortPiling)
       fprintf('Posterior Probabilities');
       disp(Y)
       bar(X1,Y,'LineWidth',0.1,'BarWidth',0.15);
       xlabel("p")
       ylabel("P(p=pi)")
       xlim([0 1.1])
       ylim([0 0.5])
       title("Priorprobability Mass Function of  'p'")
       hold on; 
       n=n+1;
    end
end
fprintf('Collection of Short_Pile_Probability');
disp(Short_Pile_Probability)
fprintf('Collection of Probabilities');
disp(Probabilities)