function [Efield,Intensity] = cavityTransmission(F,Asp)
    Efield = exp(1i*Phicav/2)./(1-r.*exp(1i*Phicav));
    Intensity = Efield.*conj(Efield);
end