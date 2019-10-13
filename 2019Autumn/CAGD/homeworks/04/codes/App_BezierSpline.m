function varargout = App_BezierSpline(varargin)
% APP_BEZIERSPLINE MATLAB code for App_BezierSpline.fig
%      APP_BEZIERSPLINE, by itself, creates a new APP_BEZIERSPLINE or raises the existing
%      singleton*.
%
%      H = APP_BEZIERSPLINE returns the handle to a new APP_BEZIERSPLINE or the handle to
%      the existing singleton*.
%
%      APP_BEZIERSPLINE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP_BEZIERSPLINE.M with the given input arguments.
%
%      APP_BEZIERSPLINE('Property','Value',...) creates a new APP_BEZIERSPLINE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before App_BezierSpline_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to App_BezierSpline_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help App_BezierSpline

% Last Modified by GUIDE v2.5 13-Oct-2019 21:27:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @App_BezierSpline_OpeningFcn, ...
                   'gui_OutputFcn',  @App_BezierSpline_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

global userData recentPress complete radius inControl;

% --- Executes just before App_BezierSpline is made visible.
function App_BezierSpline_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to App_BezierSpline (see VARARGIN)

% Choose default command line output for App_BezierSpline
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes App_BezierSpline wait for user response (see UIRESUME)
% uiwait(handles.figure1);

clc;

hold on;

global userData complete radius inControl;
userData = UserData();
complete = false;
radius = 0.5;
inControl = true;

% --- Outputs from this function are returned to the command line.
function varargout = App_BezierSpline_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in menuEC.
function menuEC_Callback(hObject, eventdata, handles)
% hObject    handle to menuEC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menuEC contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menuEC
global userData inControl;
cla(handles.axes1);
DrawBezierSpline(userData.GetP(), handles.menuP.Value, handles.menuEC.Value, inControl);


% --- Executes during object creation, after setting all properties.
function menuEC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menuEC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menuP.
function menuP_Callback(hObject, eventdata, handles)
% hObject    handle to menuP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menuP contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menuP
global userData;
cla(handles.axes1);
DrawBezierSpline(userData.GetP(), handles.menuP.Value, handles.menuEC.Value, inControl);

% --- Executes during object creation, after setting all properties.
function menuP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menuP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnBack.
function btnBack_Callback(hObject, eventdata, handles)
% hObject    handle to btnBack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1);
global userData complete inControl;
complete = false;
userData = userData.Pop();
DrawBezierSpline(userData.GetP(), handles.menuP.Value, handles.menuEC.Value, inControl);

% --- Executes on button press in btnReset.
function btnReset_Callback(hObject, eventdata, handles)
% hObject    handle to btnReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global userData complete;
userData = UserData();
complete = false;
cla(handles.axes1);

% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global userData complete radius inControl;

if complete
    return;
end

curP = handles.axes1.CurrentPoint;
curP = [curP(1, 1), curP(1, 2)];

% out of range
if curP(1) < handles.axes1.XLim(1) || curP(1) > handles.axes1.XLim(2) || curP(2) < handles.axes1.YLim(1) || curP(2) > handles.axes1.YLim(2)
    cla(handles.axes1);
    DrawBezierSpline(userData.GetP(), handles.menuP.Value, handles.menuEC.Value, inControl);
    return;
end

cla(handles.axes1);

if userData.Size() > 0
    nearEnd = sqrt(sum((curP-userData.GetLastP()).^2)) < 0.01;
    nearStart = sqrt(sum((curP-userData.GetFirstP()).^2)) < radius;
    if nearEnd
        k = userData.GetP();
    elseif (handles.menuEC.Value == 3) && nearStart && userData.Size() > 1
        k = [userData.GetP(); userData.GetFirstP()];
        DrawCircle(userData.GetFirstP(), radius);
    else
        k = [userData.GetP(); curP];
    end
else
    k = curP;
end

DrawBezierSpline(k, handles.menuP.Value, handles.menuEC.Value, inControl);


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global userData recentPress complete radius inControl;

if complete
    return;
end

cla(handles.axes1);

%TODO
%1. mouse key type
%2. min dist

curP = handles.axes1.CurrentPoint;
curP = [curP(1, 1), curP(1, 2)];

if userData.Size() > 1 && handles.menuEC.Value == 3 && sqrt(sum((curP-userData.GetFirstP()).^2)) < radius
    curP = userData.GetFirstP();
    complete = true;
end

% out of range
if curP(1) < handles.axes1.XLim(1) || curP(1) > handles.axes1.XLim(2) || curP(2) < handles.axes1.YLim(1) || curP(2) > handles.axes1.YLim(2)
    return;
end

recentPress = true;
userData = userData.Push(curP);

DrawBezierSpline(userData.GetP(), handles.menuP.Value, handles.menuEC.Value, inControl);

if strcmp(handles.figure1.SelectionType, 'alt')
    complete = true;
end


% --- Executes on button press in btnControl.
function btnControl_Callback(hObject, eventdata, handles)
% hObject    handle to btnControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global userData inControl;
inControl = ~inControl;
cla(handles.axes1);
DrawBezierSpline(userData.GetP(), handles.menuP.Value, handles.menuEC.Value, inControl);
