function y = ODfitFunction( A,r1,r2,W,t )
%ODfitfunction

    tPrime = t.*(t<=0);
    fcn = @(A,r1,r2,t) A.*r2.*exp(-r2.*tPrime).*(t<=0)./(-OD0.*r1.*exp(-r2.*tPrime) + OD0.*r1 + r2);
    
    b = linspace(0,W,100);
    yout = arrayfun(@(x) mean(fcn(varargin{1:end},b+x),xin));

end