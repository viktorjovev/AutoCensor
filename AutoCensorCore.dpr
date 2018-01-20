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
 var key: Byte;
 var Index: Integer;
 var badwords:TStringList;
 function GetConsoleWindow: HWND; stdcall; external kernel32;

begin
   ShowWindow(GetConsoleWindow, SW_HIDE);
   badwords:=TStringList.Create;
   badwords.LoadFromFile('BadWords.txt');
   badwords.Sort;
  while true do begin
     Sleep(10);
       for key:=48 to 91 do begin
       if GetAsyncKeyState(ord(VK_BACK))=-32767 then begin SetLength(text, Length(text) - 1); break;  end;
             if (GetAsyncKeyState(ord(VK_SPACE))<0) or (GetAsyncKeyState(ord(VK_RETURN))<0) or (GetAsyncKeyState(ord(VK_TAB))<0)then begin text:=''; break; end;
       if GetAsyncKeyState(key) = -32767 then begin
          text:=text+CHR(key);
              if badwords.Find(text,Index) then begin
              MessageDlg(#13+'Hey take it easy man, breathe and take that back!!!',mtWarning,[],0);
              text:='';
              break;
          end;
       end;
     end;
  end;
end.
