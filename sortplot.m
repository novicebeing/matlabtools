function sortplot()
    h = gca;
    
    h = get(h,'Children');
    
    for i = 1:numel(h)
        x = get(h(i),'XData');
        y = get(h(i),'YData');
        [~,idx] = sort(x);
        set(h(i),'XData',x(idx));
        set(h(i),'YData',y(idx));
    end
end

