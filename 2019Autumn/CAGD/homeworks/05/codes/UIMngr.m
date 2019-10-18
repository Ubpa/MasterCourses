classdef UIMngr < handle
    
    properties % default public
        handles;
        radius = 0.75;
        pd;
        isCtrl;
        complete;
        hoverIdx;
    end
    
    methods
        function obj = UIMngr(handles)
            hold on;
            obj.pd = PointData();
            obj.handles = handles;
            obj.isCtrl = true;
            obj.complete = false;
            obj.hoverIdx = -1;
        end
        
        function isComplete = IsComplete(obj)
            isComplete = obj.complete;
        end
        function SetComplete(obj, isComplete)
            obj.complete = isComplete;
        end
        
        function pd = GetPointData(obj)
            pd = obj.pd;
        end
        
        function Reset(obj)
            obj.pd.Reset();
            obj.RefreshAxes();
            obj.complete = false;
            obj.isCtrl = true;
            obj.hoverIdx = -1;
        end
        
        function RefreshAxes(obj)
            cla(obj.handles.axes);
            [axesP, isInRange] = obj.GetAxesP();
            curP = [axesP, obj.GetMultiplicity()];
            if obj.complete
                if obj.hoverIdx ~= -1
                    obj.pd.SetPat(obj.hoverIdx, curP);
                    DrawCircle(axesP, obj.radius);
                else
                    [c, found] = obj.pd.GetCloseP(axesP, obj.radius);
                    if  found && obj.isCtrl
                        DrawCircle(c, obj.radius);
                    end
                end
            end
            
            if isInRange && ~obj.complete % track mouse
                p = [obj.pd.GetAllP(); curP];
            else
                p = obj.pd.GetAllP();
            end
            DrawBSpline(p, obj.isCtrl);
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

