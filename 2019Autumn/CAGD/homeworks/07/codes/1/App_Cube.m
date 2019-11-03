function varargout = App_Cube(varargin)
% APP_CUBE MATLAB code for App_Cube.fig
%      APP_CUBE, by itself, creates a new APP_CUBE or raises the existing
%      singleton*.
%
%      H = APP_CUBE returns the handle to a new APP_CUBE or the handle to
%      the existing singleton*.
%
%      APP_CUBE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP_CUBE.M with the given input arguments.
%
%      APP_CUBE('Property','Value',...) creates a new APP_CUBE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before App_Cube_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to App_Cube_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help App_Cube

% Last Modified by GUIDE v2.5 03-Nov-2019 18:23:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @App_Cube_OpeningFcn, ...
                   'gui_OutputFcn',  @App_Cube_OutputFcn, ...
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


% --- Executes just before App_Cube is made visible.
function App_Cube_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to App_Cube (see VARARGIN)

% Choose default command line output for App_Cube
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes App_Cube wait for user response (see UIRESUME)
% uiwait(handles.figure1);
hold on;
RefreshAxes(handles);


% --- Outputs from this function are returned to the command line.
function varargout = App_Cube_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_x_Callback(hObject, eventdata, handles)
% hObject    handle to edit_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_x as text
%        str2double(get(hObject,'String')) returns contents of edit_x as a double
RefreshAxes(handles)

% --- Executes during object creation, after setting all properties.
function edit_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_y_Callback(hObject, eventdata, handles)
% hObject    handle to edit_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_y as text
%        str2double(get(hObject,'String')) returns contents of edit_y as a double
RefreshAxes(handles)

% --- Executes during object creation, after setting all properties.
function edit_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_z_Callback(hObject, eventdata, handles)
% hObject    handle to edit_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_z as text
%        str2double(get(hObject,'String')) returns contents of edit_z as a double
RefreshAxes(handles)

% --- Executes during object creation, after setting all properties.
function edit_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%----------------------

function RefreshAxes(handles)
cla(handles.axes);
x = str2double(handles.edit_x.String);
y = str2double(handles.edit_y.String);
z = str2double(handles.edit_z.String);
d = str2double(handles.edit_d.String);
if size(x,1)==0
    uiwait(msgbox('x should be a number, set x = 0 as default','Error', 'error', 'modal'));
    handles.edit_x.String = '0';
    x = 0;
end
if size(y,1)==0
    uiwait(msgbox('y should be a number, set y = 0 as default','Error', 'error', 'modal'));
    handles.edit_y.String = '0';
    y = 0;
end
if size(z,1)==0
    uiwait(msgbox('z should be a number, set z = -5 as default','Error', 'error', 'modal'));
    handles.edit_z.String = '-5';
    z = -5;
end
if size(d,1)==0
    uiwait(msgbox('d should be a number, set d = 2 as default','Error', 'error', 'modal'));
    handles.edit_d.String = '2';
    d = 2;
end
DrawCube([x,y,z], d);

function edit_d_Callback(hObject, eventdata, handles)
% hObject    handle to edit_d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_d as text
%        str2double(get(hObject,'String')) returns contents of edit_d as a double
RefreshAxes(handles)

% --- Executes during object creation, after setting all properties.
function edit_d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
