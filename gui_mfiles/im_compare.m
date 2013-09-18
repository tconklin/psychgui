function varargout = im_compare(varargin)
% IM_COMPARE M-file for im_compare.fig
%      IM_COMPARE, by itself, creates a new IM_COMPARE or raises the existing
%      singleton*.
%
%      H = IM_COMPARE returns the handle to a new IM_COMPARE or the handle to
%      the existing singleton*.
%
%      IM_COMPARE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IM_COMPARE.M with the given input arguments.
%
%      IM_COMPARE('Property','Value',...) creates a new IM_COMPARE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before im_compare_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to im_compare_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help im_compare

% Last Modified by GUIDE v2.5 17-Sep-2013 14:32:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @im_compare_OpeningFcn, ...
                   'gui_OutputFcn',  @im_compare_OutputFcn, ...
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


% --- Executes just before im_compare is made visible.
function im_compare_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to im_compare (see VARARGIN)

% Choose default command line output for im_compare
handles.output = hObject;
handles.par1 = varargin{1}{1};
handles.par2 = varargin{1}{2};
handles.par3 = varargin{1}{3};
handles.par4 = varargin{1}{4};

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes im_compare wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = im_compare_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in rating.
function rating_Callback(hObject, eventdata, handles)
% hObject    handle to rating (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns rating contents as cell array
%        contents{get(hObject,'Value')} returns selected item from rating


% --- Executes during object creation, after setting all properties.
function rating_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rating (see GCBO)
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
r1 = handles.par1;
r2 = handles.par2;
r3 = handles.par3;
dir_name = handles.par4;
x = -10:.1:10;
counter = get(handles.counter,'String');
rating_ = get(handles.rating,'Value');
rating = double(rating_);
set(handles.rating,'Value',1);
count = str2double(counter)+1;
fname = sprintf('%s\\part2.txt',dir_name);
fname2 = sprintf('%s\\part3.txt',dir_name);
if count == 1
    fid = fopen(fname,'wt');
    fprintf(fid,'Family1\t Species1\t Exemplar1\t Family2\t Species2\t Exemplar2\t Rating\n');
    fclose(fid);
elseif count > 1 && count <= max(size(r2))+1
    fid = fopen(fname,'at');
    fprintf(fid,'%d\t%d\t%d\t%d\t%d\t%d\t%d\n',r2(count-1,1),r2(count-1,2),r2(count-1,3),r2(count-1,4),r2(count-1,5),r2(count-1,6),rating);
    fclose(fid);
elseif count == max(size(r2))+2
    fid2 = fopen(fname2,'wt');
    fprintf(fid2,'Family1\t Species1\t Exemplar1\t Family2\t Species2\t Exemplar2\t Rating\r\n');
    fclose(fid2);
elseif count > max(size(r2))+2 && count <= max(size(r2))+max(size(r3))+2
    fid2 = fopen(fname2,'at');
    fprintf(fid2,'%d\t%d\t%d\t%d\t%d\t%d\t%d\n',r3(count-max(size(r2))-2,1),r3(count-max(size(r2))-2,2),r3(count-max(size(r2))-2,3),r3(count-max(size(r2))-2,4),r3(count-max(size(r2))-2,5),r3(count-max(size(r2))-2,6),rating);
    fclose(fid2);
end
if count <= max(size(r2))
    y1 = (-1).^r2(count,1)*x.^r2(count,2)-r2(count,3);
    y2 = (-1).^r2(count,4)*x.^r2(count,5)-r2(count,6);
    plot(handles.axes1,x,y1)
    plot(handles.axes2,x,y2)
elseif count > max(size(r2))+1 && count < max(size(r2))+max(size(r3))+2
    y1 = (-1).^r3(count-max(size(r2))-1,1)*x.^r3(count-max(size(r2))-1,2)-r3(count-max(size(r2))-1,3);
    y2 = (-1).^r3(count-max(size(r2))-1,4)*x.^r3(count-max(size(r2))-1,5)-r3(count-max(size(r2))-1,6);
    plot(handles.axes1,x,y1)
    plot(handles.axes2,x,y2)
end
set(handles.counter,'String',num2str(count));
if count == max(size(r2))+1
    msgbox('The images are now going to be from the same Family and Species. Adjust the rating to reflect this.');
end
if count == max(size(r2))+max(size(r3))+3
    close(handles.figure1)
end
