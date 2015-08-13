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
    
    if ((first == 0) && (second == 0) && (third == 0) && (fourth == 0))
        output = 1;
    elseif ((first == 0) && (second == 0) && (third == 0) && (fourth == 1))
        output = 2;
    elseif ((first == 0) && (second == 0) && (third == 1) && (fourth == 0))
        output = 3;
    elseif ((first == 0) && (second == 1) && (third == 0) && (fourth == 0))
        output = 4;
    elseif ((first == 0) && (second == 1) && (third == 0) && (fourth == 1))
        output = 5;
    elseif ((first == 0) && (second == 1) && (third == 1) && (fourth == 0))
        output = 6;
    elseif ((first == 1) && (second == 0) && (third == 0) && (fourth == 0))
        output = 7;
    elseif ((first == 1) && (second == 0) && (third == 0) && (fourth == 1))
        output = 8;
    elseif ((first == 1) && (second == 0) && (third == 1) && (fourth == 0))
        output = 9;
    else
        output = -1;
    end
        
    yVals = [yVals; output];
end

end
