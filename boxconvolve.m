function yout = boxconvolve(xin,fcn,W,varargin)

    if numel(xin) == 0
        yout = [];
        return;
    end
    
    b = linspace(0,W,100);
    yout = arrayfun(@(x) mean(fcn(varargin{1:end},b+x),xin));
    
%     %x = 0:1e-6:50e-6;
%     x = -25:0.1:25;
%     yout = zeros(size(yin));
%     for i = 1:numel(yout)
%         yout(i) = mean(interp1(xin,yin,x+xin(i),'linear',0));
%     end
end