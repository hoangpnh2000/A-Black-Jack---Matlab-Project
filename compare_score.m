function [A] = compare_score(i1,total1,i2,total2)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
if i1==6 && i2==6
    if total1 < total2
        A=('Host wins the game')
    elseif total1 > total2
         A=('You win the game')
    elseif total1 == total2
        A=('TIE !!! ') 
    end
elseif i1==6 && total1<=21
    A=('Host wins the game')
elseif i2==6 && total2<=21
   A=('You win the game')
%% final
elseif total1==21 && total2==21
    A=('TIE')   
elseif total1==21
    A=('Host wins the game ')
elseif total2==21
      A=('You wins the game ')  
elseif total1==total2
    A=('TIE')
elseif total1 >21 && total2 >21
    A=('TIE !!! ') 
elseif total1 >21
     A=('You win the game ') 
elseif total2 >21
     A=('Host wins the game ')
elseif total1>total2
    A=('The Host wins the game ')
elseif total2>total1
    A=('You win the game ')
    
end
end

