program AutoCensorCore;

{$APPTYPE CONSOLE}

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs;

var text:string;
 var  i :integer;
 var key: Byte;
 var badwords:TStringList;
 function GetConsoleWindow: HWND; stdcall; external kernel32;

begin
   ShowWindow(GetConsoleWindow, SW_HIDE);
   badwords:=TStringList.Create;
   badwords.LoadFromFile('BadWords.txt');
  while true do begin
     Sleep(10);
       for key:=8 to 255 do begin
          if GetAsyncKeyState(key) = -32767 then begin
          if key=VK_BACK then begin SetLength(text, Length(text) - 1); Continue; end;
             if (key=VK_SPACE) or (key=VK_SHIFT) or (key=VK_RETURN) or (key=VK_TAB) or (key=VK_CAPITAL) then
               begin text:=''; Continue; end;
              text:=text+CHR(key);
              for i:= 0 to badwords.Count-1 do
              if text=badwords[i] then  begin
              MessageDlg('Hey take it easy man, breathe and take that back!!!',mtWarning,[mbOK],0);
              text:='';
              end;
              end;
              end;
              end;

end.
