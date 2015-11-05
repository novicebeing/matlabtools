function turnofferrorbars()
    h = get(gca,'Children');
    set(h,'UData',NaN*zeros(size(get(h,'XData'))));
    set(h,'LData',NaN*zeros(size(get(h,'XData'))));
end