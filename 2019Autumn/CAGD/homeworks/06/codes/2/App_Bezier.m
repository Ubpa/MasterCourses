function varargout = App_Bezier(varargin)
% APP_BEZIER MATLAB code for App_Bezier.fig
%      APP_BEZIER, by itself, creates a new APP_BEZIER or raises the existing
%      singleton*.
%
%      H = APP_BEZIER returns the handle to a new APP_BEZIER or the handle to
%      the existing singleton*.
%
%      APP_BEZIER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP_BEZIER.M with the given input arguments.
%
%      APP_BEZIER('Property','Value',...) creates a new APP_BEZIER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before App_Bezier_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to App_Bezier_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help App_Bezier

% Last Modified by GUIDE v2.5 20-Sep-2019 21:56:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @App_Bezier_OpeningFcn, ...
                   'gui_OutputFcn',  @App_Bezier_OutputFcn, ...
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


global userData drawCtrl;

% --- Executes just before App_Bezier is made visible.
function App_Bezier_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to App_Bezier (see VARARGIN)

% Choose default command line output for App_Bezier
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes App_Bezier wait for user response (see UIRESUME)
% uiwait(handles.figure1);

clc;
hold on;

global userData drawCtrl;
userData = UserData();
b = [
    -2 0.5
    -2/3 3
    8/3 4
    4 2.5
    ];
for i=1:size(b,1)
    userData = userData.Push(b(i,:));
end
DrawBezierCurve(userData.GetP(), drawCtrl);
drawCtrl = false;


% --- Outputs from this function are returned to the command line.
function varargout = App_Bezier_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in btn_clear.
function btn_clear_Callback(hObject, eventdata, handles)
% hObject    handle to btn_clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global userData;
userData = userData.Clear();
cla(handles.axes);

% --- Executes on button press in btn_back.
function btn_back_Callback(hObject, eventdata, handles)
% hObject    handle to btn_back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global userData drawCtrl;
userData = userData.Pop();
cla(handles.axes);
DrawBezierCurve(userData.GetP(), drawCtrl);


% --- Executes on mouse press over axes background.
function axes_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% curP = get(handles.axes, 'CurrentPoint');
% curP = [curP(1, 1), curP(1, 2)];
% global userData drawCtrl;
% userData = userData.Push(curP);
% cla(handles.axes);
% DrawBezierCurve(userData.GetP(), drawCtrl);


% --- Executes on button press in btn_tip.
function btn_tip_Callback(hObject, eventdata, handles)
% hObject    handle to btn_tip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global userData drawCtrl;
drawCtrl = ~drawCtrl;
cla(handles.axes);
DrawBezierCurve(userData.GetP(), drawCtrl);
