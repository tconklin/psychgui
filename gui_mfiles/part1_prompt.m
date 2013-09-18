function varargout = part1_prompt(varargin)
% PART1_PROMPT M-file for part1_prompt.fig
%      PART1_PROMPT, by itself, creates a new PART1_PROMPT or raises the existing
%      singleton*.
%
%      H = PART1_PROMPT returns the handle to a new PART1_PROMPT or the handle to
%      the existing singleton*.
%
%      PART1_PROMPT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART1_PROMPT.M with the given input arguments.
%
%      PART1_PROMPT('Property','Value',...) creates a new PART1_PROMPT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part1_prompt_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part1_prompt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part1_prompt

% Last Modified by GUIDE v2.5 14-Sep-2013 11:10:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part1_prompt_OpeningFcn, ...
                   'gui_OutputFcn',  @part1_prompt_OutputFcn, ...
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


% --- Executes just before part1_prompt is made visible.
function part1_prompt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part1_prompt (see VARARGIN)

% Choose default command line output for part1_prompt
handles.output = hObject;
handles.par1 = varargin{1}{1};
handles.par2 = varargin{1}{2};
handles.par3 = varargin{1}{3};
handles.par4 = varargin{1}{4};

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part1_prompt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part1_prompt_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start_button.
function start_button_Callback(hObject, eventdata, handles)
% hObject    handle to start_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figure1)
r1 = handles.par1;
r2 = handles.par2;
r3 = handles.par3;
dir_name = handles.par4;
im_show({r1,r2,r3,dir_name});
