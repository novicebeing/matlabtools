function [] = scaleyaxis(scalevalue)
    h = gca;
    
    h = get(h,'Children');
    x = get(h,'XData');
    y = get(h,'YData');
    set(h,'YData',y.*scalevalue);
    Ldata = get(h,'LData');
    set(h,'LData',Ldata*scalevalue);
    Udata = get(h,'UData');
    set(h,'UData',Udata*scalevalue);
    err = (Ldata+Udata)/2;
end

