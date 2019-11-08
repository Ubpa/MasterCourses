function varargout = App_Ellipse(varargin)
% APP_ELLIPSE MATLAB code for App_Ellipse.fig
%      APP_ELLIPSE, by itself, creates a new APP_ELLIPSE or raises the existing
%      singleton*.
%
%      H = APP_ELLIPSE returns the handle to a new APP_ELLIPSE or the handle to
%      the existing singleton*.
%
%      APP_ELLIPSE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP_ELLIPSE.M with the given input arguments.
%
%      APP_ELLIPSE('Property','Value',...) creates a new APP_ELLIPSE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before App_Ellipse_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to App_Ellipse_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help App_Ellipse

% Last Modified by GUIDE v2.5 08-Nov-2019 19:59:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @App_Ellipse_OpeningFcn, ...
                   'gui_OutputFcn',  @App_Ellipse_OutputFcn, ...
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

% --- Executes just before App_Ellipse is made visible.
function App_Ellipse_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to App_Ellipse (see VARARGIN)

% Choose default command line output for App_Ellipse
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes App_Ellipse wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global isCtrl;
hold on;
isCtrl = false;
RefreshAxes(handles);


% --- Outputs from this function are returned to the command line.
function varargout = App_Ellipse_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_ctrl.
function btn_ctrl_Callback(hObject, eventdata, handles)
% hObject    handle to btn_ctrl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global isCtrl;
isCtrl = ~isCtrl;
RefreshAxes(handles);


% --- Executes on slider movement.
function slider_z_Callback(hObject, eventdata, handles)
% hObject    handle to slider_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
RefreshAxes(handles);


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
RefreshAxes(handles);


% --- Executes during object creation, after setting all properties.
function slider_theta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_theta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_a_Callback(hObject, eventdata, handles)
% hObject    handle to edit_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_a as text
%        str2double(get(hObject,'String')) returns contents of edit_a as a double
RefreshAxes(handles);


% --- Executes during object creation, after setting all properties.
function edit_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_b_Callback(hObject, eventdata, handles)
% hObject    handle to edit_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_b as text
%        str2double(get(hObject,'String')) returns contents of edit_b as a double
RefreshAxes(handles);


% --- Executes during object creation, after setting all properties.
function edit_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_c_Callback(hObject, eventdata, handles)
% hObject    handle to edit_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_c as text
%        str2double(get(hObject,'String')) returns contents of edit_c as a double
RefreshAxes(handles);

% --- Executes during object creation, after setting all properties.
function edit_c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function RefreshAxes(handles)
global isCtrl;

cla(handles.axes);

a = str2double(handles.edit_a.String);
b = str2double(handles.edit_b.String);
c = str2double(handles.edit_c.String);
if size(a,1)==0 || a == 0
    uiwait(msgbox('a should be a number(~= 0), set a = 0.5774 as default','Error', 'error', 'modal'));
    handles.edit_a.String = '0.5774';
    a = 0.5774;
end
if size(b, 1)==0 || b == 0
    uiwait(msgbox('b should be a number(~= 0), set b = 0.7071 as default','Error', 'error', 'modal'));
    handles.edit_b.String = '0.7071';
    b = 0.7071;
end
if size(c, 1)==0 || c == 0
    uiwait(msgbox('c should be a number(~= 0), set c = 1 as default','Error', 'error', 'modal'));
    handles.edit_c.String = '1';
    c = 1;
end

theta = 2 * pi * handles.slider_theta.Value;
scale = 2;
handles.axes.CameraPosition(1) = scale*cos(theta);
handles.axes.CameraPosition(2) = scale*sin(theta);
handles.axes.CameraPosition(3) = handles.slider_z.Value;

yzR = ReflectMat([1,0,0], 0);
xzR = ReflectMat([0,1,0], 0);
xyR = ReflectMat([0,0,1], 0);
DrawEllipse(a,b,c,eye(4), isCtrl);
DrawEllipse(a,b,c,yzR, isCtrl);
DrawEllipse(a,b,c,xzR*yzR, isCtrl);
DrawEllipse(a,b,c,xzR, isCtrl);
DrawEllipse(a,b,c,eye(4)*xyR, isCtrl);
DrawEllipse(a,b,c,yzR*xyR, isCtrl);
DrawEllipse(a,b,c,xzR*yzR*xyR, isCtrl);
DrawEllipse(a,b,c,xzR*xyR, isCtrl);

