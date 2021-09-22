function [player,k,Total,count] = take_card_host(Total,player,hostcard_index,card1,card2,card3)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

 
k=3;
i=3;
count=0;
card(3)=card1;
card(4)=card2;
card(5)=card3;

while Total < 17 
    if i==6 || k==6
        break
    else
player(k)=card(i);
k=k+1;
Total=sum(player);
i=i+1;
count=count+1;
    end
 for M=1:length(hostcard_index)
if hostcard_index(M)==1 || hostcard_index(M)==2 || hostcard_index(M)==3 || hostcard_index(M)==4
player(M)=11;
if sum(player)>21
    player(M)=10;
    if sum(player)>21
   player(M)=1;
end
end
end
 end
Total=sum(player)
end
   

while Total>17
choose1=randi([0,1],1);
if k==6 || i==6
    break
elseif Total>19
    break
elseif choose1==1 
    player(k)=card(i);
    k=k+1;
    Total=sum(player);
    i=i+1;
    count=count+1;
elseif choose1==0
    break
end

for M=1:length(hostcard_index)
if hostcard_index(M)==1 || hostcard_index(M)==2 || hostcard_index(M)==3 || hostcard_index(M)==4
player(M)=11;
if sum(player)>21
    player(M)=10;
    if sum(player)>21
   player(M)=1;
end
end
end
end
Total=sum(player)
end
end

