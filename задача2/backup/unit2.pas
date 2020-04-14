unit Unit2;

{$mode objfpc}{$H+}

interface
function Culc(var x,y:integer):real;
procedure read_file(var f:textfile);
procedure save_file(var z:textfile);
procedure save_memo;
implementation
uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,unit1  ;
 function Culc(var x,y:integer):real;
  var
    f:real;
   begin
     f:=(abs(x)-abs(y))/(1+abs(x*y));
     f:=Round(f*100)/100;
    Culc:=f;
   end;
 procedure read_file(var f:textfile);
 var
   s:string;
   begin
     if Form1.OpenDialog.Execute then
     begin
       assignfile(f,Form1.OpenDialog.FileName);
       reset(f);
       readln(f,s);
       Form1.x_edit.Text:=(s);
       readln(f,s);
       Form1.y_edit.Text:=s;
       closefile(f);
     end;
   end;
  procedure save_file(var z:textfile);
  var
  p:string;
  begin
  if Form1.SaveDialog1.Execute then
     begin
   assignfile(z,Form1.SaveDialog1.FileName);
   rewrite(z);
    p:=(Form1.X_Edit.text);
    writeln(z,p);
    p:=(Form1.Y_Edit.text);
    writeln(z,p);
    closefile(z);
     end;
   end;
  procedure save_memo;
  begin
    if  Form1.SaveDialog1.Execute then
   Form1.Print_Memo.Lines.SaveToFile(Form1.SaveDialog1.FileName);

  end;

end.

