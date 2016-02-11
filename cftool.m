function varargout = cftool(varargin)
%% Wrapper for MATLAB cftool functionality
    cftoolFcn = function_handle(fullfile(toolboxdir('curvefit\cftoolgui'),'cftool.m'));
    if nargin == 2
        if iscell(varargin{1}) && iscell(varargin{2})
            x = varargin{1};
            y = varargin{2};
            for i = 1:numel(varargin{1})
                varargout = cftoolFcn(x{i},y{i});
            end
            return
        end
    end
    
    varargout = cftoolFcn(varargin);
end