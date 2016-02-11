function [Aout,Bout] = weightedLinearLeastSquares(x,y,yError)
    % Formula taken from Taylor Error Analysis
    % Fits a line of form y = A + Bx
    xsum = sum(x./yError.^2);
    xsumSquare = sum(x.^2./yError.^2);
    ysum = sum(y./yError.^2);
    ysumSquare = sum(y.^2./yError.^2);
    xysum = sum(x.*y./yError.^2);
    wsum = sum(1./yError.^2);
    
    Delta = wsum*xsumSquare-xsum^2;
    A = (xsumSquare*ysum-xsum*xysum)/Delta;
    B = (wsum*xysum-xsum*ysum)/Delta;
    sigmaA = sqrt(xsumSquare/Delta);
    sigmaB = sqrt(wsum/Delta);
    
    Aout = edouble(A,sigmaA);
    Bout = edouble(B,sigmaB);
end