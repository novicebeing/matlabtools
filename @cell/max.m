function Aout = max(A)
    if iscell(A) && all(cellfun(@isnumeric,A))
        Aout = {};
        for i = 1:numel(A)
            Aout{i} = max(A{i});
        end
        return
    end
    
    error('Not defined for this type')
end