classdef UserData
    %USERDATA �˴���ʾ�йش����ժҪ
    %   �˴���ʾ��ϸ˵��
    
    properties % default public
        isInUser = false;
        X = [];
        Y = [];
    end
    
    methods
        function obj = UserData()
            %USERDATA ��������ʵ��
            %   �˴���ʾ��ϸ˵��
        end
        
        function obj = Clear(obj)
            %METHOD1 �˴���ʾ�йش˷�����ժҪ
            %   �˴���ʾ��ϸ˵��
            obj.X = [];
            obj.Y = [];
            obj.isInUser = false;
        end
    end
end

