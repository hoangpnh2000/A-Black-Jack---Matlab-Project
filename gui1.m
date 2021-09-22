
function varargout = gui1(varargin)
% GUI1 MATLAB code for gui1.fig
%      GUI1, by itself, creates a new GUI1 or raises the existing
%      singleton*.
%
%      H = GUI1 returns the handle to a new GUI1 or the handle to
%      the existing singleton*.
%
%      GUI1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI1.M with the given input arguments.
%

%      GUI1('Property','Value',...) creates a new GUI1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui1

% Last Modified by GUIDE v2.5 19-Aug-2020 11:52:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui1_OpeningFcn, ...
                   'gui_OutputFcn',  @gui1_OutputFcn, ...
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


% --- Executes just before gui1 is made visible.
function gui1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui1 (see VARARGIN)

% Choose default command line output for gui1
handles.output = hObject;

% Update handles structure
global  show_picture
global name
global y
global Fs

set(handles.Hostcard1,'Visible','Off');
set(handles.Hostcard2,'Visible','Off');
set(handles.Hostcard3,'Visible','Off');
set(handles.Hostcard4,'Visible','Off');
set(handles.Hostcard5,'Visible','Off');
set(handles.Playercard1,'Visible','Off');
set(handles.Playercard2,'Visible','Off');
set(handles.Playercard3,'Visible','Off');
set(handles.Playercard4,'Visible','Off');
set(handles.Playercard5,'Visible','Off');

set(handles.Hit1,'Visible','Off');
set(handles.Stand1,'Visible','Off');
set(handles.Opencard,'Visible','Off');
set(handles.End1,'Visible','Off');
set(handles.Close1,'Visible','Off');

set(handles.Finalresult,'Visible','Off');
set(handles.Score1,'Visible','Off');
set(handles.Hostscore,'Visible','Off');
set(handles.Busted1,'Visible','Off');

[y,Fs]=audioread('card.mp3');
File=dir('D:\MatLab 2020\Project\card2\*.png');
for i=1:length(File)
    name{i}=File(i).name
end


guidata(hObject, handles);
addpath ('card2\')
h=imread('begin_background.png');
 axes(handles.Background1);
 show_picture=imshow(h);

% UIWAIT makes gui1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global playeramountcard
playeramountcard=3;


% --- Executes on button press in Play1.
function Play1_Callback(hObject, eventdata, handles)
% hObject    handle to Play1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global show_picture %hinh
global name  
global count1
global playercard_value %player2
global card_value %player_value
global card_index %card_value
global hostcard_index %card1
global hosttotal %total1
global playertotal %total2
global hostamountcard %i1
global A  %to print the final result string
global playercard_index
 playercard_value=[]

 show_picture.Visible='off';
set(handles.Play1,'Visible','Off');
set(handles.Hit1,'Visible','On');
set(handles.Stand1,'Visible','On');

set(handles.Score1,'Visible','On');
set(handles.Hostscore,'Visible','On');
h=imread('blackjack_background.png');
 axes(handles.Background1);
 show_picture=imshow(h);


%% start
card=(1:52)
%% Take 10 cards
i=1
while i<11
pick_index=randi([1 length(card)],1)
card_index(i)=(card(pick_index))

 card_value(i)=convert_index_to_value(card_index(i))
 
 card(pick_index)=[];
        
  i=i+1 ;
end

%%part1
% player1 take 2 card
hostcard_index(1)= card_index(1);
hostcard_value(1)=card_value(1);
hostcard_index(2)= card_index(2)
hostcard_value(2)=card_value(2)

h=imread(name{hostcard_index(1)});
axes(handles.Hostcard1);
show_picture=imshow(h); 

h=imread('purple_back.png');
axes(handles.Hostcard2);
show_picture=imshow(h); 

% player2 take 2 card
playercard_index(1)= card_index(3);
playercard_value(1)=card_value(3);
playercard_index(2)= card_index(4)
playercard_value(2)=card_value(4)

h=imread(name{playercard_index(1)});
axes(handles.Playercard1);
show_picture=imshow(h);

h=imread(name{playercard_index(2)});
axes(handles.Playercard2);
show_picture=imshow(h);
% special case
hosttotal=check_backjack(hostcard_value);
  playertotal=check_backjack(playercard_value);
 
 if sum(hostcard_value)==2 && ((playercard_value(1)==1 && playercard_value(2)==10)||(playercard_value(1)==10 && playercard_value(2)==1))
      A=('Host wins the game')
       End1_Callback(hObject, eventdata, handles)
elseif sum(playercard_value)==2 &&((hostcard_value(1)==1 && hostcard_value(2)==10)||(hostcard_valuel(1)==10 && hostcard_value(2)==1))
     A=('You win the game')
      End1_Callback(hObject, eventdata, handles)
elseif hosttotal==21
       A=('Host wins the game')
      End1_Callback(hObject, eventdata, handles)
  elseif playertotal==21
    A=('You win the game')
      End1_Callback(hObject, eventdata, handles)
  elseif hosttotal==21 && playertotal==21
    A=('Tie1');    
    End1_Callback(hObject, eventdata, handles)
 else
     % check player's card has value 1 or 10 or 11
       for i=1:length(playercard_index)
if playercard_index(i)==1 || playercard_index(i)==2 || playercard_index(i)==3 || playercard_index(i)==4
playercard_value(i)=11;
if sum(playercard_value)>21
    playercard_value(i)=10;
    if sum(playercard_value)>21
    playercard_value(i)=1;
end
end
end
       end

     % check host's card has value 1 or 10 or 11
         for i=1:length(hostcard_index)
if hostcard_index(i)==1 || hostcard_index(i)==2 || hostcard_index(i)==3 ||hostcard_index(i)==4
hostcard_value(i)=11;
if sum(hostcard_value)>21
   hostcard_value(i)=10;
    if sum(hostcard_value)>21
    hostcard_value(i)=1;
end
end
end
       end
 % host's total
     hosttotal =sum(hostcard_value)
      
   % player 2's total
 playertotal =sum(playercard_value) 
   set(handles.Score1,'string',num2str(playertotal))
  %% part2
  % host take card
[hostcard_value,hostamountcard, hosttotal,count1] = take_card_host(hosttotal,hostcard_value,hostcard_index,card_value(5),card_value(6),card_value(7))

end


% --- Executes on button press in Hit1.
function Hit1_Callback(hObject, eventdata, handles)
% hObject    handle to Hit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global playercard_value
global card_value
global card_index
global name
global show_picture
global playeramountcard
global playertotal
global playercard_index
global y
global Fs

Take=get(handles.Hit1,'value');
sound(y,Fs);
% take card for player
if Take==true
    playeramountcard=playeramountcard+1
   
end
switch playeramountcard
    case 4
        playercard_value(3)=card_value(8);
        h=imread(name{card_index(8)});
        axes(handles.Playercard3);
        show_picture=imshow(h);
        
    case 5
        playercard_value(4)=card_value(9);
       h=imread(name{card_index(9)});
        axes(handles.Playercard4);
        show_picture=imshow(h);
       
    case 6
         playercard_value(5)=card_value(10);
        h=imread(name{card_index(10)});
        axes(handles.Playercard5);
        show_picture=imshow(h);
end
% check host's card has value 1 or 10 or 11
for i=1:length(playercard_index)
if playercard_index(i)==1 || playercard_index(i)==2 || playercard_index(i)==3 || playercard_index(i)==4
playercard_value(i)=11;
    if sum(playercard_value)>21
    playercard_value(i)=10;
        if sum(playercard_value)>21
        playercard_value(i)=1;
end
end
end
end
playercard_value
playertotal =sum(playercard_value) 

 set(handles.Score1,'string',num2str(playertotal))
 % check if player has over 21 point or not
 if playertotal==21
     set(handles.Hit1,'Visible','Off');
     set(handles.Stand1,'Visible','Off');
     set(handles.Opencard,'Visible','On');
 elseif playertotal>21
     set(handles.Hit1,'Visible','Off');
     set(handles.Stand1,'Visible','Off');
     set(handles.Busted1,'Visible','On');
     set(handles.Opencard,'Visible','On');
 end
 if playeramountcard==6 && playertotal<=21
     set(handles.Hit1,'Visible','Off');
     set(handles.Stand1,'Visible','Off');
     set(handles.Opencard,'Visible','On');
 end
% --- Executes on button press in Stand1.
function Stand1_Callback(hObject, eventdata, handles)
% hObject    handle to Stand1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count1

% player stop take card, visible host card
if count1==1
  h=imread('purple_back.png');
  axes(handles.Hostcard3);
  show_picture=imshow(h); 
elseif count1==2
  h=imread('purple_back.png');
  axes(handles.Hostcard3);
  show_picture=imshow(h); 

  h=imread('purple_back.png');
  axes(handles.Hostcard4);
  show_picture=imshow(h); 
elseif count1==3
  h=imread('purple_back.png');
  axes(handles.Hostcard3);
  show_picture=imshow(h); 

  h=imread('purple_back.png');
  axes(handles.Hostcard4);
  show_picture=imshow(h); 

 h=imread('purple_back.png');
 axes(handles.Hostcard5);
 show_picture=imshow(h); 
end
set(handles.Opencard,'Visible','On');
set(handles.Hit1,'Visible','Off');
set(handles.Stand1,'Visible','Off');



% --- Executes on button press in Opencard.
function Opencard_Callback(hObject, eventdata, handles)
% hObject    handle to Opencard (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y
global Fs
sound(y,Fs);
global hostcard_value
global card_value
global card_index
global name
global show_picture
global count1
global hostcard_index
global hosttotal
global playertotal
global hostamountcard 
global playeramountcard


% turn host's card to the front
h=imread(name{hostcard_index(2)});
axes(handles.Hostcard2);
show_picture=imshow(h);

if count1==1
    hostcard_value(3)=card_value(5);
       h=imread(name{card_index(5)});
        axes(handles.Hostcard3);
        show_picture=imshow(h);
  
elseif count1==2
 hostcard_value(3)=card_value(5);
       h=imread(name{card_index(5)});
        axes(handles.Hostcard3);
        show_picture=imshow(h); 

hostcard_value(4)=card_value(6);
       h=imread(name{card_index(6)});
        axes(handles.Hostcard4);
        show_picture=imshow(h);
elseif count1==3
  hostcard_value(3)=card_value(5);
       h=imread(name{card_index(5)});
        axes(handles.Hostcard3);
        show_picture=imshow(h); 

hostcard_value(4)=card_value(6);
       h=imread(name{card_index(6)});
        axes(handles.Hostcard4);
        show_picture=imshow(h);
        
 hostcard_value(5)=card_value(7);
       h=imread(name{card_index(7)});
        axes(handles.Hostcard5);
        show_picture=imshow(h);
end
% visible host point
  set(handles.Hostscore,'string',num2str(hosttotal))
set(handles.Opencard,'Visible','Off');

%% check who won the game
A=compare_score(hostamountcard ,hosttotal,playeramountcard ,playertotal)
set(handles.Finalresult,'Visible','On');

set(handles.Finalresult,'string',A)

set(handles.Hit1,'Visible','Off');
set(handles.Stand1,'Visible','Off');

set(handles.Close1,'Visible','On');

% --- Executes on button press in End1.
function End1_Callback(hObject, eventdata, handles)
% hObject    handle to End1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A
global name
global hostcard_index


set(handles.Opencard,'Visible','Off');

h=imread(name{hostcard_index(2)});
axes(handles.Hostcard2);
show_picture=imshow(h);

set(handles.Finalresult,'Visible','On');
set(handles.Finalresult,'string',A)

set(handles.Hit1,'Visible','Off');
set(handles.Stand1,'Visible','Off');
set(handles.Close1,'Visible','On');



% --- Executes on button press in Close1.
function Close1_Callback(hObject, eventdata, handles)
% hObject    handle to Close1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
