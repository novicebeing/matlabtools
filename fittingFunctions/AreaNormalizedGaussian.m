function y = AreaNormalizedGaussian( x,x0,FWHM )
    y = exp(-(x-x0).^2/(FWHM/sqrt(2*log(2))/2)^2/2)/(FWHM/sqrt(2*log(2))/2)/sqrt(2*pi);
end

