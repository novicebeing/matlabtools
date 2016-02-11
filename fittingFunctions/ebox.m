function y = ebox( x, b, W )
    y = zeros(size(x));
    
    if b == 0
        y(x>=-W & x<0) = x(x>=-W & x<0)/W+1;
        y(x>=0) = 1;
        return
    end
    
    y(x>=-W & x<0) = 1./b./W.*(1-exp(-b.*(W+x(x>=-W & x<0))));
    y(x>=0) = 1./b./W.*(-exp(-b.*(W+x(x>=0)))+exp(-b.*x(x>=0)));
    
    if sum(isnan(y)>0)
        b
        W
        error('ebox returned NaN')
    end
end

