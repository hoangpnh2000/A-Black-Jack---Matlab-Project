function [playervalue]=convert_index_to_value(position)

switch position
    case {1,2,3,4}
       playervalue=1;
    case {5,6,7,8}
        playervalue=2;
        case {9,10,11,12}
        playervalue=3;
        case {13,14,15,16}
        playervalue=4;
        case {17,18,19,20}
        playervalue=5;
        case {21,22,23,24}
        playervalue=6;
        case {25,26,27,28}
        playervalue=7;
        case {29,30,31,32}
        playervalue=8;
        case {33,34,35,36}
        playervalue=9;
       case {37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52}
        playervalue=10;
    %case{41,42,43,44,45,46,47,48,49,50,51,52}
       % player=11;
 end
end

