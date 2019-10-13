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
        
        function n = Size(obj)
            %SIZE ���ؿ��Ƶ����
            %    ���ؿ��Ƶ����
            n = size(obj.P, 1);
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
        
        function P = GetPat(obj, i)
            %GETP �������п��Ƶ�
            %    �������п��Ƶ�
            P = obj.P(i, :);
        end
        
        function obj = SetPat(obj, i, pos)
            %GETP �������п��Ƶ�
            %    �������п��Ƶ�
            obj.P(i, :) = pos;
        end
        
        function P = GetLastP(obj)
            %GETP �������п��Ƶ�
            %    �������п��Ƶ�
            P = obj.P(size(obj.P,1), :);
        end
        
        function P = GetFirstP(obj)
            %GETP �������п��Ƶ�
            %    �������п��Ƶ�
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

