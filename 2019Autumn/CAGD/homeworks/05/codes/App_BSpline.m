function varargout = App_BSpline(varargin)
% APP_BSPLINE MATLAB code for App_BSpline.fig
%      APP_BSPLINE, by itself, creates a new APP_BSPLINE or raises the existing
%      singleton*.
%
%      H = APP_BSPLINE returns the handle to a new APP_BSPLINE or the handle to
%      the existing singleton*.
%
%      APP_BSPLINE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP_BSPLINE.M with the given input arguments.
%
%      APP_BSPLINE('Property','Value',...) creates a new APP_BSPLINE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before App_BSpline_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to App_BSpline_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help App_BSpline

% Last Modified by GUIDE v2.5 19-Oct-2019 03:01:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @App_BSpline_OpeningFcn, ...
                   'gui_OutputFcn',  @App_BSpline_OutputFcn, ...
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

global data;

% --- Executes just before App_BSpline is made visible.
function App_BSpline_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to App_BSpline (see VARARGIN)

% Choose default command line output for App_BSpline
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes App_BSpline wait for user response (see UIRESUME)
% uiwait(handles.figure);
clc;
global uiMngr;
uiMngr = UIMngr(handles);


% --- Outputs from this function are returned to the command line.
function varargout = App_BSpline_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnControl.
function btnControl_Callback(hObject, eventdata, handles)
% hObject    handle to btnControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global uiMngr;
uiMngr.FlipCtrl();
uiMngr.RefreshAxes();

% --- Executes on button press in btnBack.
function btnBack_Callback(hObject, eventdata, handles)
% hObject    handle to btnBack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global uiMngr;
uiMngr.GetPointData().Pop();
uiMngr.RefreshAxes();
uiMngr.SetComplete(false);


% --- Executes on button press in btnReset.
function btnReset_Callback(hObject, eventdata, handles)
% hObject    handle to btnReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global uiMngr;
uiMngr.Reset();

% --- Executes on selection change in menuC.
function menuC_Callback(hObject, eventdata, handles)
% hObject    handle to menuC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menuC contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menuC

% --- Executes during object creation, after setting all properties.
function menuC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menuC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global uiMngr;

if uiMngr.IsComplete()
    return;
end

[p, isInRange] = uiMngr.GetAxesP();
if ~isInRange
    return;
end

pd = uiMngr.GetPointData();
pd.Push([p,uiMngr.GetMultiplicity()]);
if strcmp(handles.figure.SelectionType, 'alt')
    uiMngr.SetComplete(true);
end
uiMngr.RefreshAxes();


% --- Executes on mouse motion over figure - except title and menu.
function figure_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global uiMngr;
uiMngr.RefreshAxes();
