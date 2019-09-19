classdef UserData
    %USERDATA 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties % default public
        isInUser = false;
        X = [];
        Y = [];
    end
    
    methods
        function obj = UserData()
            %USERDATA 构造此类的实例
            %   此处显示详细说明
        end
        
        function obj = Clear(obj)
            %METHOD1 此处显示有关此方法的摘要
            %   此处显示详细说明
            obj.X = [];
            obj.Y = [];
            obj.isInUser = false;
        end
    end
end

