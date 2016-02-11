function y = areaNormPseudoVoigt(x,GammaG,GammaL)
    % GammaG: Gaussian FWHM
    % GammaL: Lorentz FWHM

    Gamma = (GammaG.^5 + ...
        2.69269.*GammaG.^4.*GammaL + ...
        2.42843.*GammaG.^3.*GammaL.^2 + ...
        4.47163.*GammaG.^2.*GammaL.^3 + ...
        0.07842.*GammaG.^1.*GammaL.^4 + ...
        GammaL.^5).^(1./5);
    GammaRatio = GammaL./Gamma;
    eta = 1.36603.*GammaRatio - ...
        0.47719.*GammaRatio.^2 + ...
        0.11116.*GammaRatio.^3;

    y = (1-eta).*areaNormGaussian(x,GammaG) + ...
        eta.*areaNormLorentzian(x,GammaL);