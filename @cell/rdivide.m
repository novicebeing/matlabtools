function Aout = rdivide(A,B)
    if iscell(A) && all(cellfun(@isnumeric,A)) && iscell(B)
        if all(cellfun(@isnumeric,B)) && numel(A) == numel(B)
            Aout = {};
            for i = 1:numel(A)
                Aout{i} = A{i}./B{i};
            end
        end
        return
    elseif iscell(A) && all(cellfun(@isnumeric,A)) && isscalar(B)
        Aout = {};
        for i = 1:numel(A)
            Aout{i} = A{i}./B;
        end
        return
    end
    
    error('Not defined for this type')
end