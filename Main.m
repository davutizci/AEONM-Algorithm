% Zhao, W., Wang, L., & Zhang, Z. (2019). Artificial ecosystem-based optimization: a novel nature-inspired meta-heuristic algorithm. Neural Computing and Applications, 1-43.
clc;
clear;
run=1;
for mm=1:run 
MaxIteration=1000; 
PopSize=50;
FunIndex=5;
[BestX,BestF,HisBestF]=AEO(FunIndex,MaxIteration,PopSize);
Score(mm)=BestF
end

% display(['F_index=', num2str(FunIndex)]);
% display(['The best fitness is: ', num2str(BestF)]);
% %display(['The best solution is: ', num2str(BestX)]);
%  if BestF>0
%      semilogy(HisBestF,'r','LineWidth',2);
%  else
%      plot(HisBestF,'r','LineWidth',2);
%  end
%  xlabel('Iterations');
%  ylabel('Fitness');
%  title(['F',num2str(FunIndex)]);
min(Score); 
max(Score); 
std(Score); 
mean(Score);
median(Score);







