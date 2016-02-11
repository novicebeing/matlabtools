function [] = scaleyaxis(scalevalue)
    h = gca;
    
    h = get(h,'Children');
    x = get(h,'XData');
    y = get(h,'YData');
    ylimits = get(gca,'YLim');
    if iscell(y)
        for i = 1:numel(y)
            set(h(i),'YData',y{i}.*scalevalue);
            if isprop(h(i),'LData')
                Ldata = get(h(i),'LData');
                set(h(i),'LData',Ldata*scalevalue);
            end
            if isprop(h(i),'UData')
                Udata = get(h(i),'UData');
                set(h(i),'UData',Udata*scalevalue);
            end
        end
    else
        set(h,'YData',y.*scalevalue);
    end
    set(gca,'YLim',ylimits*scalevalue);
end

