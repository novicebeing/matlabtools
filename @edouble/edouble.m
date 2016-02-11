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
%         function disp(obj)
%             sigfigs = ceil(log10(obj.value/obj.errorbar));
%             printerror = obj.errorbar
%             s = sprintf('');
%         end
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
        function obj = uminus(a)
            if isa(a,'double')
                a = edouble(a,0);
            end
            
            if ~isa(a,'edouble')
                class(a)
                class(b)
                error('must have class edouble');
            end
            
            obj = edouble(0,0);
            obj.value = -a.value;
            obj.errorbar = abs(a.errorbar);
        end
        function obj = exp(a)
            if isa(a,'double')
                a = edouble(a,0);
            end
            
            if ~isa(a,'edouble')
                class(a)
                error('must have class edouble');
            end
            
            obj = edouble(0,0);
            obj.value = exp(a.value);
            obj.errorbar = abs(obj.value)*abs(a.errorbar);
        end
        function s = string(obj)
            % Get first two sig figs of errorbar
            valueExponent = floor(log10(obj.value));
            errorbarExponent = floor(log10(obj.errorbar));
            
            if errorbarExponent > valueExponent
                s = 'NaN';
                return;
            end
            
            roundedValue = obj.value/10^valueExponent;
            roundedErrorbar = round(obj.errorbar/10^(errorbarExponent-1));
%             if valueExponent == 0
%                 valueFormat = sprintf('%%0.%.1dg(%%0.2d)',valueExponent-errorbarExponent);
%                 s = sprintf(valueFormat,roundedValue,roundedErrorbar);
%             else
%                 valueFormat = sprintf('%%0.%.1dg(%%0.2d)e%%d',valueExponent-errorbarExponent);
%                 s = sprintf(valueFormat,roundedValue,roundedErrorbar,valueExponent);
%             end
            if valueExponent == 0
                valueFormat = sprintf('%%#.%.1dg(%%0.2d)',valueExponent-errorbarExponent+2);
                s = sprintf(valueFormat,roundedValue,roundedErrorbar);
            else
                valueFormat = sprintf('%%#.%.1dg(%%0.2d)e%%d',valueExponent-errorbarExponent+2);
                s = sprintf(valueFormat,roundedValue,roundedErrorbar,valueExponent);
            end
        end
    end
    
end

