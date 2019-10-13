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
    end
end

