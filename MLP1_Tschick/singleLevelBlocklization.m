function [outputBlock] = singleLevelBlocklization(data)
blockLevel = 1;


outputBlock = [];
count = 0;
if iscell(data)
    numInput = length(data);
    for ll = 1:1:numInput
        temp = data{ll};
        [row, col, page] = size(temp);
        halfSpace = round([row, col, page]./2);
        spaceDivision = cat(1, ones(1,3), halfSpace, halfSpace+1, [row, col, page]);
        for ii = 1:1:2^blockLevel
            for jj = 1:1:2^blockLevel
                for kk = 1:1:2^blockLevel
                    count = count + 1;
                    outputBlock{count} = temp(spaceDivision(2*ii-1,1):spaceDivision(2*ii,1),...
                        spaceDivision(2*jj-1,2):spaceDivision(2*jj,2),...
                        spaceDivision(2*kk-1,3):spaceDivision(2*kk,3));
                end;
            end;    
        end;
    end;
else
    [row, col, page] = size(data);
    halfSpace = round([row, col, page]./2);
    spaceDivision = cat(1, ones(1,3), halfSpace, halfSpace+1, [row, col, page]);
    for ii = 1:1:2^blockLevel
        for jj = 1:1:2^blockLevel
            for kk = 1:1:2^blockLevel
                count = count + 1;
                outputBlock{count} = data(spaceDivision(2*ii-1,1):spaceDivision(2*ii,1),...
                    spaceDivision(2*jj-1,2):spaceDivision(2*jj,2),...
                    spaceDivision(2*kk-1,3):spaceDivision(2*kk,3));
            end;
        end;    
    end;
end;

