function varargout = App_Sphere(varargin)
% APP_SPHERE MATLAB code for App_Sphere.fig
%      APP_SPHERE, by itself, creates a new APP_SPHERE or raises the existing
%      singleton*.
%
%      H = APP_SPHERE returns the handle to a new APP_SPHERE or the handle to
%      the existing singleton*.
%
%      APP_SPHERE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP_SPHERE.M with the given input arguments.
%
%      APP_SPHERE('Property','Value',...) creates a new APP_SPHERE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before App_Sphere_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to App_Sphere_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help App_Sphere

% Last Modified by GUIDE v2.5 08-Nov-2019 19:31:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @App_Sphere_OpeningFcn, ...
                   'gui_OutputFcn',  @App_Sphere_OutputFcn, ...
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


global isCtrl;

% --- Executes just before App_Sphere is made visible.
function App_Sphere_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to App_Sphere (see VARARGIN)

% Choose default command line output for App_Sphere
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes App_Sphere wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global isCtrl;
isCtrl = false;
hold on;
RefreshAxes(handles);

% --- Outputs from this function are returned to the command line.
function varargout = App_Sphere_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider_z_Callback(hObject, eventdata, handles)
% hObject    handle to slider_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
RefreshAxes(handles)

% --- Executes during object creation, after setting all properties.
function slider_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_theta_Callback(hObject, eventdata, handles)
% hObject    handle to slider_theta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
RefreshAxes(handles)

% --- Executes during object creation, after setting all properties.
function slider_theta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_theta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in btn_control.
function btn_control_Callback(hObject, eventdata, handles)
% hObject    handle to btn_control (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global isCtrl;
isCtrl = ~isCtrl;
RefreshAxes(handles);

function RefreshAxes(handles)
global isCtrl;
cla(handles.axes);
theta = 2 * pi * handles.slider_theta.Value;
scale = 2;
handles.axes.CameraPosition(1) = scale*cos(theta);
handles.axes.CameraPosition(2) = scale*sin(theta);
handles.axes.CameraPosition(3) = handles.slider_z.Value;
R = zeros(4,4,8);
Ry = makehgtform('yrotate', pi);
for i=1:4
    Rzi = makehgtform('zrotate', (i-1) * pi/2);
    R(:,:,i) = Rzi;
    R(:,:,i+4) = Rzi * Ry;
end
for i = 1: size(R,3)
    DrawSphere(R(:,:,i), isCtrl);
end
