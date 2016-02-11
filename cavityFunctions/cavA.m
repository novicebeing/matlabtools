function A = cavA(Asp,F,Phicav)
    % Art = Single Pass Complex Attenuation
    
    %Asp = Asp.*pi./F;
    r = 1-pi./F;
    AspA = exp(-Asp.*pi./F./2-1i.*Phicav);
    Asp0 = exp(-1i.*Phicav);
    cavTransRatio = (real(AspA)./(1-2.*real(AspA).*r+abs(AspA).^2.*r.^2))./(real(Asp0)./(1-2.*real(Asp0).*r+abs(Asp0).^2.*r.^2));
    A = -log(cavTransRatio);

    %E0 = exp(1i*Phicav/2)./(1-r.*exp(1i*Phicav));
    %Ea = exp(1i*Phicav/2-Art/2-1i*imag(Art)/2)./(1-r.*exp(1i*Phicav-Art-1i*imag(Art)));
    %A = -log(Ea.*conj(Ea)./(E0.*conj(E0)));
end