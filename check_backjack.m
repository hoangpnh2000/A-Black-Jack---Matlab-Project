function [Total] = check_backjack(player)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

 if (player(1)==10 && player(2)==1) || (player(1)==1 && player(2)==10)
     Total=21;
 elseif sum(player)==2
    Total=21;
    
 else
     Total=0;
 end
 
end

