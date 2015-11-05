function y = odconc(t,OD0,r1,r2,convolvebool)

    %y = OD0.*boxconvolve(t,@(x) exp(-r1.*t).*(1-exp(-r2.*t)));
    y = OD0.*(t>=0).*exp(-r1.*t).*(1-exp(-r2.*t));
    
    if convolvebool == 1
       y = zeros(size(t));
       b = linspace(0,50,100); 
       for i = 1:numel(t)
           tt = b+t(i);
           y(i) = mean(OD0.*(tt>=0).*exp(-r1.*tt).*(1-exp(-r2.*tt)));
       end
    end
end