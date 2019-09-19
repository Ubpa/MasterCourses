function varargout = FitApp(varargin)
% FITAPP MATLAB code for FitApp.fig
%      FITAPP, by itself, creates a new FITAPP or raises the existing
%      singleton*.
%
%      H = FITAPP returns the handle to a new FITAPP or the handle to
%      the existing singleton*.
%
%      FITAPP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FITAPP.M with the given input arguments.
%
%      FITAPP('Property','Value',...) creates a new FITAPP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FitApp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FitApp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FitApp

% Last Modified by GUIDE v2.5 19-Sep-2019 16:48:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FitApp_OpeningFcn, ...
                   'gui_OutputFcn',  @FitApp_OutputFcn, ...
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

global userData;

% --- Executes just before FitApp is made visible.
function FitApp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FitApp (see VARARGIN)

% Choose default command line output for FitApp
global userData;

set(handles.axes,'XLim',[0 1],'YLim',[-2 2]);

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

userData = UserData();

clc;

% UIWAIT makes FitApp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FitApp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_auto.
function btn_auto_Callback(hObject, eventdata, handles)
% hObject    handle to btn_auto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global userData;

cla(handles.axes);
userData = userData.Clear();
auto();

% --- Executes on button press in btn_user.
function btn_user_Callback(hObject, eventdata, handles)
% hObject    handle to btn_user (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global userData;

cla(handles.axes);
delete(handles.axes.Legend);
userData = userData.Clear();
userData.isInUser = true;


% --- Executes on mouse press over axes background.
function axes_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global userData;

if ~userData.isInUser
    return;
end

cla(handles.axes);

curP = get(handles.axes, 'CurrentPoint');
userData.X = [userData.X; curP(1, 1)];
userData.Y = [userData.Y; curP(1, 2)];

Fit(userData.X, userData.Y);
