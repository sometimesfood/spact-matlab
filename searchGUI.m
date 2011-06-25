function varargout = searchGUI(varargin)
% SEARCHGUI MATLAB code for searchGUI.fig
%      SEARCHGUI, by itself, creates a new SEARCHGUI or raises the existing
%      singleton*.
%
%      H = SEARCHGUI returns the handle to a new SEARCHGUI or the handle to
%      the existing singleton*.
%
%      SEARCHGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SEARCHGUI.M with the given input arguments.
%
%      SEARCHGUI('Property','Value',...) creates a new SEARCHGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before searchGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to searchGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help searchGUI

% Last Modified by GUIDE v2.5 24-Jun-2011 13:27:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @searchGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @searchGUI_OutputFcn, ...
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

% suppress unused function and variable warnings
%#ok<*DEFNU>
%#ok<*INUSL>

% --- Executes just before searchGUI is made visible.
function searchGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for searchGUI
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = searchGUI_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;

% --- Executes on button press in findImagesButton.
function findImagesButton_Callback(hObject, eventdata, handles)
imagePath = getappdata(gcbf, 'imagePath');
directory = getappdata(gcbf, 'searchDir');
results = vertcat(imagePath, ...
                  findSimilarImages(imread(imagePath), ...
                                    directory, ...
                                    9));
scrollfig(results);

% --- Executes on button press in loadImageButton.
function loadImageButton_Callback(hObject, eventdata, handles)
[fileName, filePath] = uigetfile({supportedImageFormats, 'Images'; ...
                                  '*', 'All files'}, ...
                                 'Select an Image...');
if fileName ~=  0
  imagePath = [filePath fileName];
  setappdata(gcbf, 'imagePath', imagePath);
  imshow(imread(imagePath), 'Parent', handles.imageAxes);
  set(handles.findImagesButton, 'Enable', 'On');
end

% --- Executes on button press in changeSearchDirButton.
function changeSearchDirButton_Callback(hObject, eventdata, handles)
searchDir = uigetdir(get(handles.searchDirPath, 'String'));
if searchDir ~= 0
  currentDir = pwd;
  shortPath = cell2mat(strrep({ searchDir }, [ currentDir '/'], ''));
  setappdata(gcbf, 'searchDir', searchDir);
  set(handles.searchDirPath, 'String', shortPath);
end
