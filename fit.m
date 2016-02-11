function [fitobj,goodness,output,warnstr,errstr,convmsg] = fit(xdatain,ydatain,fittypeobj,varargin)
%% Wrapper for MATLAB fit function
    fitFcn = function_handle(fullfile(toolboxdir('curvefit'),'curvefit\fit.m'));
    [fitobj,goodness,output,warnstr,errstr,convmsg] = fitFcn(xdatain,ydatain,fittypeobj,varargin{:});
end