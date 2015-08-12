function yVals = parse(y)

rows = size(y, 1);
yVals = [];

%% assign values to represent output

% Up Brake Left Right Output
%  0   0    0     0      1
%  0   0    0     1      2
%  0   0    1     0      3
%  0   0    1     1      4
%  0   1    0     0      5
%  0   1    0     1      6
%  0   1    1     0      7
%  0   1    1     1      8
%  1   0    0     0      9
%  1   0    0     1      10
%  1   0    1     0      11
%  1   0    1     1      12
%  1   1    0     0      13
%  1   1    0     1      14
%  1   1    1     0      15
%  1   1    1     1      16

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
    elseif ((first == 0) && (second == 0) && (third == 1) && (fourth == 1))
        output = 4;
    elseif ((first == 0) && (second == 1) && (third == 0) && (fourth == 0))
        output = 5;
    elseif ((first == 0) && (second == 1) && (third == 0) && (fourth == 1))
        output = 6;
    elseif ((first == 0) && (second == 1) && (third == 1) && (fourth == 0))
        output = 7;
    elseif ((first == 0) && (second == 1) && (third == 1) && (fourth == 1))
        output = 8;
    elseif ((first == 1) && (second == 0) && (third == 0) && (fourth == 0))
        output = 9;
    elseif ((first == 1) && (second == 0) && (third == 0) && (fourth == 1))
        output = 10;
    elseif ((first == 1) && (second == 0) && (third == 1) && (fourth == 0))
        output = 11;
    elseif ((first == 1) && (second == 0) && (third == 1) && (fourth == 1))
        output = 12;
    elseif ((first == 1) && (second == 1) && (third == 0) && (fourth == 0))
        output = 13;
    elseif ((first == 1) && (second == 1) && (third == 0) && (fourth == 1))
        output = 14;
    elseif ((first == 1) && (second == 1) && (third == 1) && (fourth == 0))
        output = 15;
    elseif ((first == 1) && (second == 1) && (third == 1) && (fourth == 1))
        output = 16;
    else
        output = -1;
    end
        
    yVals = [yVals; output];
end

end
