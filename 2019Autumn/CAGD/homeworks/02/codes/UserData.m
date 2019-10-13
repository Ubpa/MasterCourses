classdef UserData
    %USERDATA �û�����
    %   �����˿��Ƶ���Ϣ
    
    properties(Access = private) % default public
        P = zeros(0, 2);
    end
    
    methods
        function obj = UserData()
            %USERDATA ���캯��
            %   ���Ƶ��ʼ��Ϊ�� zeros(0, 2)
        end
        
        function obj = Clear(obj)
            %CLEAR ������п��Ƶ�
            %   ������п��Ƶ�
            obj.P = zeros(0, 2);
        end
        
        function obj = Push(obj, p)
            %PUSH ���ӿ��Ƶ�
            %   ���ӿ��Ƶ㣬 p : n x 2
            obj.P = [obj.P;p];
        end
        
        function obj = Pop(obj)
            %POP ɾ����һ�����Ƶ�
            %    ɾ����һ�����Ƶ㣬���Ϊû�п��Ƶ���ɾ��
            obj.P = obj.P(1:(size(obj.P,1)-1), :);
        end
        
        function P = GetP(obj)
            %GETP �������п��Ƶ�
            %    �������п��Ƶ�
            P = obj.P;
        end
    end
end

