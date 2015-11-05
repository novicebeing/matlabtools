function [ x,y,err ] = getdatafromplot()
    h = gca;
    
    h = get(h,'Children');
    x = get(h,'XData');
    y = get(h,'YData');
    Ldata = get(h,'LData');
    Udata = get(h,'UData');
    err = (Ldata+Udata)/2;
end

