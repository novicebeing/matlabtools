function linkallxyaxes()
    hs = get(0,'Children');
    has = [];
    for i = 1:numel(hs)
        hasa = get(hs(i),'Children');
        for j = 1:numel(hasa)
            if strcmp(get(hasa(j),'Type'),'axes')
                if isempty(has)
                    has = hasa(j);
                else
                    has(end+1) = hasa(j);
                end
            end
        end
    end
    linkaxes(has,'xy');
end