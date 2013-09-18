function varargout = im_show(varargin)
% IM_SHOW M-file for im_show.fig
%      IM_SHOW, by itself, creates a new IM_SHOW or raises the existing
%      singleton*.
%
%      H = IM_SHOW returns the handle to a new IM_SHOW or the handle to
%      the existing singleton*.
%
%      IM_SHOW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IM_SHOW.M with the given input arguments.
%
%      IM_SHOW('Property','Value',...) creates a new IM_SHOW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before im_show_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to im_show_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help im_show

% Last Modified by GUIDE v2.5 16-Sep-2013 16:22:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @im_show_OpeningFcn, ...
                   'gui_OutputFcn',  @im_show_OutputFcn, ...
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


% --- Executes just before im_show is made visible.
function im_show_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to im_show (see VARARGIN)

% Choose default command line output for im_show
handles.output = hObject;
handles.par1 = varargin{1}{1};
handles.par2 = varargin{1}{2};
handles.par3 = varargin{1}{3};
handles.par4 = varargin{1}{4};

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes im_show wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = im_show_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton1,'Visible','Off')
r1 = handles.par1;
r2 = handles.par2;
r3 = handles.par3;
dir_name = handles.par4;
x = -10:.1:10;
fname = sprintf('%s\\part1.txt',dir_name);
fid = fopen(fname,'wt');
fprintf(fid,'Family\t Species\t Exemplar\n')
for j = 1:max(size(r1))
    y = (-1).^r1(j,1)*x.^r1(j,2)-r1(j,3);
    plot(handles.axes1,x,y)
    fprintf(fid,'%d\t%d\t%d\n',r1(j,1),r1(j,2),r1(j,3));
    pause(.1)
end
fclose(fid)
close(handles.figure1)
part2_prompt({r1,r2,r3,dir_name})
