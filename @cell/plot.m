function hh = plot(varargin)
%% Wrapper for MATLAB plot functionality
    args = varargin;
    % Check second parameter for edouble 
    if nargin>1 && iscell(args{1}) && iscell(args{2})
        x = args{1};
        y = args{2};
        for i = numel(x):-1:1
            builtin('plot',x{i},y{i},args{3:end}); hold on;
        end
        return
    end
    
    if isa(args{1},'char') && strcmp(args{1},'ConvertXUnits')
        units = args{2};
        hh = builtin('plot',args{3}.*units,args{4:end});
    else
        hh = builtin('plot',args{:});
    end
end