function pairs_cell = name_value_pairs(varargin)
    %disp("Number of input arguments: " + nargin)
    %celldisp(varargin)
    if nargin==0 || rem(nargin,2) ~= 0
        pairs_cell = {};
    else
        pairs_cell = cell(nargin/2,2);
        for i=1:2:nargin
            if ~strcmp(class(varargin{i}),'char') && ~strcmp(class(varargin{i+1}),'char')
                pairs_cell = {};
                break;
            end
            pairs_cell{ceil(i/2),1} = varargin{i};
            pairs_cell{ceil(i/2),2} = varargin{i+1};
        end
    end
end


%strcmp(varargin{i},'name') && 