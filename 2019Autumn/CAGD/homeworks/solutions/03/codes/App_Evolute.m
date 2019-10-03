function varargout = App_Evolute(varargin)
% APP_EVOLUTE MATLAB code for App_Evolute.fig
%      APP_EVOLUTE, by itself, creates a new APP_EVOLUTE or raises the existing
%      singleton*.
%
%      H = APP_EVOLUTE returns the handle to a new APP_EVOLUTE or the handle to
%      the existing singleton*.
%
%      APP_EVOLUTE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP_EVOLUTE.M with the given input arguments.
%
%      APP_EVOLUTE('Property','Value',...) creates a new APP_EVOLUTE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before App_Evolute_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to App_Evolute_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help App_Evolute

% Last Modified by GUIDE v2.5 04-Oct-2019 00:24:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @App_Evolute_OpeningFcn, ...
                   'gui_OutputFcn',  @App_Evolute_OutputFcn, ...
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


% --- Executes just before App_Evolute is made visible.
function App_Evolute_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to App_Evolute (see VARARGIN)

% Choose default command line output for App_Evolute
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes App_Evolute wait for user response (see UIRESUME)
% uiwait(handles.figure1);
hold on;
e = get(handles.slider_E,'Value');
DrawEvolute(e);

% --- Outputs from this function are returned to the command line.
function varargout = App_Evolute_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_b_Callback(hObject, eventdata, handles)
% hObject    handle to slider_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_E_Callback(hObject, eventdata, handles)
% hObject    handle to slider_E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
e = get(hObject,'Value');
cla(handles.axes);
DrawEvolute(e);

% --- Executes during object creation, after setting all properties.
function slider_E_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
