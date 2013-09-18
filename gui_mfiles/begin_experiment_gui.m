function varargout = begin_experiment_gui(varargin)
% BEGIN_EXPERIMENT_GUI M-file for begin_experiment_gui.fig
%      BEGIN_EXPERIMENT_GUI, by itself, creates a new BEGIN_EXPERIMENT_GUI or raises the existing
%      singleton*.
%
%      H = BEGIN_EXPERIMENT_GUI returns the handle to a new BEGIN_EXPERIMENT_GUI or the handle to
%      the existing singleton*.
%
%      BEGIN_EXPERIMENT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BEGIN_EXPERIMENT_GUI.M with the given input arguments.
%
%      BEGIN_EXPERIMENT_GUI('Property','Value',...) creates a new BEGIN_EXPERIMENT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before begin_experiment_gui_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to begin_experiment_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help begin_experiment_gui

% Last Modified by GUIDE v2.5 13-Sep-2013 15:14:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @begin_experiment_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @begin_experiment_gui_OutputFcn, ...
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


% --- Executes just before begin_experiment_gui is made visible.
function begin_experiment_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to begin_experiment_gui (see VARARGIN)

% Choose default command line output for begin_experiment_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes begin_experiment_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = begin_experiment_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function first_name_edit_Callback(hObject, eventdata, handles)
% hObject    handle to first_name_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of first_name_edit as text
%        str2double(get(hObject,'String')) returns contents of first_name_edit as a double


% --- Executes during object creation, after setting all properties.
function first_name_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to first_name_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function middle_name_edit_Callback(hObject, eventdata, handles)
% hObject    handle to middle_name_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of middle_name_edit as text
%        str2double(get(hObject,'String')) returns contents of middle_name_edit as a double


% --- Executes during object creation, after setting all properties.
function middle_name_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to middle_name_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function last_name_edit_Callback(hObject, eventdata, handles)
% hObject    handle to last_name_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of last_name_edit as text
%        str2double(get(hObject,'String')) returns contents of last_name_edit as a double


% --- Executes during object creation, after setting all properties.
function last_name_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to last_name_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in month.
function month_Callback(hObject, eventdata, handles)
% hObject    handle to month (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns month contents as cell array
%        contents{get(hObject,'Value')} returns selected item from month


% --- Executes during object creation, after setting all properties.
function month_CreateFcn(hObject, eventdata, handles)
% hObject    handle to month (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in day.
function day_Callback(hObject, eventdata, handles)
% hObject    handle to day (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns day contents as cell array
%        contents{get(hObject,'Value')} returns selected item from day


% --- Executes during object creation, after setting all properties.
function day_CreateFcn(hObject, eventdata, handles)
% hObject    handle to day (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in year.
function year_Callback(hObject, eventdata, handles)
% hObject    handle to year (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns year contents as cell array
%        contents{get(hObject,'Value')} returns selected item from year


% --- Executes during object creation, after setting all properties.
function year_CreateFcn(hObject, eventdata, handles)
% hObject    handle to year (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in gender.
function gender_Callback(hObject, eventdata, handles)
% hObject    handle to gender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns gender contents as cell array
%        contents{get(hObject,'Value')} returns selected item from gender


% --- Executes during object creation, after setting all properties.
function gender_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fname = (get(handles.first_name_edit, 'String'));
mname = (get(handles.middle_name_edit, 'String'));
lname = (get(handles.last_name_edit, 'String'));
month_list = get(handles.month, 'String');
month_value = (get(handles.month,'Value'));
month = month_list{month_value};
day_list = get(handles.day, 'String');
day_value = get(handles.day,'Value');
day = (day_list{day_value});
year_list = get(handles.year, 'String');
year_value = get(handles.year,'Value');
year = (year_list{year_value});
gender_list = get(handles.gender, 'String');
gender_value =get(handles.gender,'Value');
gender = gender_list{gender_value};

if max(size(fname)) == 0 || max(size(lname)) == 0
    errordlg('First and Last Name Required','Error');
else
    dir_exist = 1;
    count = 0;
    while dir_exist > 0
        count = count+1;
        dir_name = sprintf('C:\\Users\\Tim\\Documents\\MATLAB\\psych\\experiments\\exp1\\COMP%03d',count);
        dir_exist = exist(dir_name);
    end
    mkdir(dir_name);
    tdate = date;
    if exist('C:\\Users\\Tim\\Documents\\MATLAB\\psych\\experiments\\exp1\\participants.txt');
        fid = fopen('C:\Users\Tim\Documents\MATLAB\psych\experiments\exp1\participants.txt','at');
    else
        fid = fopen('C:\Users\Tim\Documents\MATLAB\psych\experiments\exp1\participants.txt','wt');
        fprintf(fid,'Participant Number\t First Name\t Middle Name \t Last Name\t Birth Date \t Todays Date \t Gender \t Directory Name \n');
    end
    fprintf(fid,'%d\t%s\t%s\t%s\t%s-%s-%s\t%s\t%s\t%s \n',count,fname,mname,lname,day,month,year,tdate,gender,dir_name);
    fclose(fid);
    [r1,r2,r3] = psych_exp1(12,10,2);
    close(handles.figure1)
    part1_prompt({r1,r2,r3,dir_name});
end
