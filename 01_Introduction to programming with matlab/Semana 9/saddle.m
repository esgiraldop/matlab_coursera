function indices = saddle(M)
    indices = [];
    [x, y] = size(M);
    for i = 1:x
        row = M(i,:)
        [maxVal, maxVal_ColNum] = max(row);
        filter = (row == maxVal); % In case there are more max values in the row
        idxs = find(filter);
        for j = 1:length(idxs)
            maxVal_ColNum =  idxs(j);
            currntCol = M(:,maxVal_ColNum);
            [minValCol, minValCol_RowNum] = min(currntCol);         
            if maxVal == minValCol
                currntIdxs = [minValCol_RowNum, maxVal_ColNum];
                if length(indices) > 0
                    % Checking the index has not been taken already
                    equalIndex_filter = sum(currntIdxs == indices, 2) > 1;
                    equalIndex = indices(equalIndex_filter,:); % There should not be more than one row
                    while ~isempty(equalIndex)
                        currntCol = M(:,maxVal_ColNum);
                        currntCol = currntCol(equalIndex(1)+1:end); % Updating
                        [minValCol, minValCol_RowNum] = min(currntCol);
                        minValCol_RowNum = minValCol_RowNum + equalIndex(1);
                        currntIdxs = [minValCol_RowNum, maxVal_ColNum];
                        equalIndex_filter = sum(currntIdxs == indices, 2) > 1;
                        equalIndex = indices(equalIndex_filter,:); % There should not be more than one row
                    end
                end
                indices = [indices; currntIdxs];
            end
        end
    end
end

%% Another solution

function s = saddle_shorter(M)
    [r, c] = size(M);
    % Initialize the saddle points to an empty array
    s = [];
    % Check the dimensions to see if input is a row or column vector
    if r > 1
        cols = min(M);          % find the min value in each column if more than 1 row
    else
        cols = M;               % vector is a special case, min would give a single value
    end
    if c > 1
        rows = max(M');         % find the max value in each row
    else
        rows = M;               % vector is a special case, max would give a single value
    end
    for ii = 1:c                % visit each column
        for jj = 1:r            % and each row, that is, each element of M
            if M(jj,ii) == cols(ii) && M(jj,ii) == rows(jj) % if both conditions hold
                s = [s; jj ii];                             % saddle point! Let's add it!
            end
        end
    end
end
%% Even shorter

function s = saddle_evenShorter(M)   
    % Create logical vector that are true for each saddle condition separately 
        minLocs = M <= min(M, [], 1);
        maxLocs = M >= max(M, [], 2);
    % Find the indices where both conditions are true!
        [row, col] = find(minLocs & maxLocs);
    % If the input is a row vector, row and col returned from the find
    % function need to be transposed to fit the output format
        if isrow(M)
            s = [row', col'];
        else
            s = [row, col];
        end
end

%% Some test inputs

% [0; -1; -2; -1; 0; -1; -2; -1; 0]
% [6; 5; 4; 3; 2; 1; 0; 1; 2; 3; 4]
% [1 2 3 4 4 3 2 1]
% zeros(randi([3 6]),randi([3 6]))