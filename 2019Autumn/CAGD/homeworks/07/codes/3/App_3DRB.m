function varargout = App_3DRB(varargin)
% APP_3DRB MATLAB code for App_3DRB.fig
%      APP_3DRB, by itself, creates a new APP_3DRB or raises the existing
%      singleton*.
%
%      H = APP_3DRB returns the handle to a new APP_3DRB or the handle to
%      the existing singleton*.
%
%      APP_3DRB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP_3DRB.M with the given input arguments.
%
%      APP_3DRB('Property','Value',...) creates a new APP_3DRB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before App_3DRB_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to App_3DRB_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help App_3DRB

% Last Modified by GUIDE v2.5 03-Nov-2019 17:59:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @App_3DRB_OpeningFcn, ...
                   'gui_OutputFcn',  @App_3DRB_OutputFcn, ...
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


% --- Executes just before App_3DRB is made visible.
function App_3DRB_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to App_3DRB (see VARARGIN)

% Choose default command line output for App_3DRB
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes App_3DRB wait for user response (see UIRESUME)
% uiwait(handles.figure1);
hold on;
RefreshAxes(handles);

% --- Outputs from this function are returned to the command line.
function varargout = App_3DRB_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in menu.
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu
RefreshAxes(handles);

% --- Executes during object creation, after setting all properties.
function menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
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


function RefreshAxes(handles)
cla(handles.axes);
a = str2double(handles.edit_a.String);
b = str2double(handles.edit_b.String);
if size(a,1)==0
    uiwait(msgbox('a should be a number, set a = 4 as default','Error', 'error', 'modal'));
    handles.edit_a.String = '4';
    a = 4;
end
if size(b, 1)==0
    uiwait(msgbox('b should be a number, set b = 3 as default','Error', 'error', 'modal'));
    handles.edit_b.String = '3';
    b = 3;
end
type = handles.menu.Value;
theta = 2 * pi * handles.slider_theta.Value;
handles.axes.CameraPosition(1) = 10*cos(theta);
handles.axes.CameraPosition(2) = 10*sin(theta);
handles.axes.CameraPosition(3) = handles.slider_z.Value;
Draw3DRB(a, b, type);


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
