classdef UserData
    %USERDATA 用户数据
    %   包含了控制点信息
    
    properties(Access = private) % default public
        P = zeros(0, 2);
    end
    
    methods
        function obj = UserData()
            %USERDATA 构造函数
            %   控制点初始化为空 zeros(0, 2)
        end
        
        function obj = Clear(obj)
            %CLEAR 清除所有控制点
            %   清除所有控制点
            obj.P = zeros(0, 2);
        end
        
        function n = Size(obj)
            %SIZE 返回控制点个数
            %    返回控制点个数
            n = size(obj.P, 1);
        end
        
        function obj = Push(obj, p)
            %PUSH 增加控制点
            %   增加控制点， p : n x 2
            obj.P = [obj.P;p];
        end
        
        function obj = Pop(obj)
            %POP 删除上一个控制点
            %    删除上一个控制点，如果为没有控制点则不删除
            obj.P = obj.P(1:(size(obj.P,1)-1), :);
        end
        
        function P = GetP(obj)
            %GETP 返回所有控制点
            %    返回所有控制点
            P = obj.P;
        end
        
        function P = GetPat(obj, i)
            %GETP 返回所有控制点
            %    返回所有控制点
            P = obj.P(i, :);
        end
        
        function obj = SetPat(obj, i, pos)
            %GETP 返回所有控制点
            %    返回所有控制点
            obj.P(i, :) = pos;
        end
        
        function P = GetLastP(obj)
            %GETP 返回所有控制点
            %    返回所有控制点
            P = obj.P(size(obj.P,1), :);
        end
        
        function P = GetFirstP(obj)
            %GETP 返回所有控制点
            %    返回所有控制点
            P = obj.P(1, :);
        end
        
        function idx = GetCloseP(obj, pos, radius)
            idx = -1;
            for i = 1:obj.Size()
                if sqrt(sum((obj.P(i, :) - pos).^2)) < radius
                    idx = i;
                    return;
                end
            end
        end
    end
end

