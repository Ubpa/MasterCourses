classdef PointData < handle
    
    properties(Access = private) % default public
        % x, y, multiplicity
        P = zeros(0, 3);
    end
    
    methods
        function obj = PointData()
        end
        
        function Reset(obj)
            obj.P = zeros(0, 3);
        end
        
        function n = Size(obj)
            n = size(obj.P, 1);
        end
        
        function Push(obj, p)
            obj.P = [obj.P; p];
        end
        
        function Pop(obj)
            obj.P = obj.P(1:(size(obj.P,1)-1), :);
        end
        
        function P = GetAllP(obj)
            P = obj.P;
        end
        
        function P = GetPat(obj, i)
            P = obj.P(i, :);
        end
        
        function SetPat(obj, i, pos)
            obj.P(i, :) = pos;
        end
        
        function P = GetLastP(obj)
            P = obj.P(size(obj.P,1), :);
        end
        
        function P = GetFirstP(obj)
            P = obj.P(1, :);
        end
        
        function idx = GetCloseP(obj, pos, radius)
            idx = -1;
            for i = 1:obj.Size()
                if pdist(obj.P(i,1:2), pos) < radius
                    idx = i;
                    return;
                end
            end
        end
        
    end
end

