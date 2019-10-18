classdef UIMngr < handle
    
    properties(Access = private) % default public
        handles;
        pd;
        isCtrl;
    end
    
    methods
        function obj = UIMngr(handles)
            hold on;
            obj.pd = PointData();
            obj.handles = handles;
            obj.isCtrl = true;
        end
        
        function pd = GetPointData(obj)
            pd = obj.pd;
        end
        
        function Reset(obj)
            obj.pd.Reset();
            obj.RefreshAxes();
        end
        
        function RefreshAxes(obj)
            cla(obj.handles.axes);
            DrawBSpline(obj.pd.GetAllP(), obj.isCtrl);
        end
        
        function [p, isInRange] = GetAxesP(obj)
            p = obj.handles.axes.CurrentPoint;
            p = [p(1, 1), p(1, 2)];
            isInRange = p(1) >= obj.handles.axes.XLim(1) && p(1) <= obj.handles.axes.XLim(2)...
                && p(2) >= obj.handles.axes.YLim(1) && p(2) <= obj.handles.axes.YLim(2);
        end
        
        function multiplicity = GetMultiplicity(obj)
            multiplicity = obj.handles.menuC.Value;
        end
        
        function FlipCtrl(obj)
            obj.isCtrl = ~obj.isCtrl;
        end
    end
end

