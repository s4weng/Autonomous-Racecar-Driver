function yVals = RoadParse(y)

rows = size(y, 1);
yVals = [];

%% assign values to represent output

% Up Brake Left Right Output
%  0   0    0     0      1
%  0   0    0     1      2
%  0   0    1     0      3
%  0   1    0     0      4
%  0   1    0     1      5
%  0   1    1     0      6
%  1   0    0     0      7
%  1   0    0     1      8
%  1   0    1     0      9
%%

for i = 1:rows

    first = y(i, 1);
    second = y(i, 2);
    third = y(i, 3);
    fourth = y(i, 4);
    
    if ((first == 1) && (second == 1) && (third == 1) && (fourth == 1))
        output = 1;
    elseif ((first == 1) && (second == 1) && (third == 1) && (fourth == 2))
        output = 2;
    elseif ((first == 1) && (second == 1) && (third == 2) && (fourth == 1))
        output = 3;
    elseif ((first == 1) && (second == 2) && (third == 1) && (fourth == 1))
        output = 4;
    elseif ((first == 1) && (second == 2) && (third == 1) && (fourth == 2))
        output = 5;
    elseif ((first == 1) && (second == 2) && (third == 2) && (fourth == 1))
        output = 6;
    elseif ((first == 2) && (second == 1) && (third == 1) && (fourth == 1))
        output = 7;
    elseif ((first == 2) && (second == 1) && (third == 1) && (fourth == 2))
        output = 8;
    elseif ((first == 2) && (second == 1) && (third == 2) && (fourth == 1))
        output = 9;
    else
        output = -1;
    end
        
    yVals = [yVals; output];
end

end
