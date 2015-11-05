function y = exprisedecay(x,r1,r2)

    y = exp(-r1.*x).*(1-exp(-r2.*x));
end