function database = voters(varargin)
    orgnldb = varargin{1};
    if rem(nargin, 2) == 0 | length(varargin) < 3
        %fprintf("Incorrect input. Dabase is left as is");
        database=orgnldb;
    else
        
        if isempty(varargin{1})
            database.Name = "";
            database.ID = [];
            start = 1
        else
            database = orgnldb;
            start = length(database) + 1;
        end
        for i = 2:2:length(varargin)-1
            Name = string(varargin{i});
            ID = varargin{i + 1};
            if (~ischar(Name) & ~isstring(Name)) ...
                    | (~isnumeric(ID) | round(ID) ~= ID)
                %fprintf("Incorrect input. Dabase is left as is");
                database=orgnldb;
                break
            else
                database(start).Name = Name;
                database(start).ID = ID;
                start = start + 1;
            end
        end
    end
    
end