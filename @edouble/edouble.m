classdef edouble
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        value
        errorbar
    end
    
    methods
        function obj = edouble(value,errorbar)
            obj.value = value;
            obj.errorbar = errorbar;
        end
        function obj = plus(a,b)
            if isa(a,'double')
                a = edouble(a,0);
            end
            if isa(b,'double')
                b = edouble(b,0);
            end
            
            if ~isa(a,'edouble') || ~isa(b,'edouble')
                error('must have class edouble');
            end
            
            obj = edouble(0,0);
            obj.value = a.value + b.value;
            obj.errorbar = sqrt(a.errorbar.^2+b.errorbar.^2);
        end
        function obj = minus(a,b)
            if isa(a,'double')
                a = edouble(a,0);
            end
            if isa(b,'double')
                b = edouble(b,0);
            end
            
            if ~isa(a,'edouble') || ~isa(b,'edouble')
                error('must have class edouble');
            end
            
            obj = edouble(0,0);
            obj.value = a.value - b.value;
            obj.errorbar = sqrt(a.errorbar.^2+b.errorbar.^2);
        end
        function obj = mtimes(a,b)
            if isa(a,'double')
                a = edouble(a,0);
            end
            if isa(b,'double')
                b = edouble(b,0);
            end
            
            if ~isa(a,'edouble') || ~isa(b,'edouble')
                error('must have class edouble');
            end
            
            obj = edouble(0,0);
            obj.value = a.value.*b.value;
            obj.errorbar = abs(obj.value).*sqrt((a.errorbar/a.value).^2+(b.errorbar/b.value).^2);
        end
        function obj = mrdivide(a,b)
            if isa(a,'double')
                a = edouble(a,0);
            end
            if isa(b,'double')
                b = edouble(b,0);
            end
            
            if ~isa(a,'edouble') || ~isa(b,'edouble')
                class(a)
                class(b)
                error('must have class edouble');
            end
            
            obj = edouble(0,0);
            obj.value = a.value./b.value;
            obj.errorbar = abs(obj.value).*sqrt((a.errorbar/a.value).^2+(b.errorbar/b.value).^2);
        end
    end
    
end

