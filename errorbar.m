function hh = errorbar(varargin)
%% Wrapper for MATLAB errorbar functionality
    errorbarFcn = function_handle(fullfile(toolboxdir('matlab\specgraph'),'errorbar.m'));
    % Check second parameter for edouble 
    if isa(varargin{2},'edouble')
        %varargin{3} = varargin{2}.errorbar;
        %varargin{2} = varargin{2}.value;
        args = {varargin{1}, varargin{2}.value, varargin{2}.errorbar, varargin{3:end}};
        hh = errorbarFcn(args{:});
    else
        hh = errorbarFcn(varargin{:});
    end
end