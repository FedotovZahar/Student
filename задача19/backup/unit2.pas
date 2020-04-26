unit Unit2;

{$mode objfpc}{$H+}

interface
function  fund_time(var v1,v2,S,a:Real):real;
 procedure open_data(var t:text);
 procedure save_data(var z:text);
 procedure print_memo1;
implementation
uses Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,unit1;
function fund_time(var v1,v2,S,a:Real):real;
var
t1,t2,b,e:real;
begin
   b:=(v1+v2);//находим сумму скоростей//
e:=sqrt(b*b+4*a*s);//находим дискриминант//
t1:=(-b+e)/(2*a);//находим 1 корень уравнения//
t2:=(-b-e)/(2*a);//находим 2 корень уравнения //
if t1>t2 then
 fund_time:=t1
 else
  fund_time:=t2;
  end;
procedure open_data(var t:text);
var
s:string ;
begin
if Form1.OpenDialog1.Execute then
     begin
       assignfile(t,Form1.OpenDialog1.FileName);
       reset(t);
       readln(t,s);
      Form1.s_edit.Text:=(s);
       readln(t,s);
       Form1.Speed1_edit.Text:=s;
       readln(t,s);
       Form1.speed2_Edit.text:=s;
       readln(t,s);
       Form1.netro_Edit.text:=s;
       closefile(t);
end;
end;
procedure save_data(var z:text);
var
p:string;
begin
    if Form1.SaveDialog1.Execute then
     begin
       assignfile(z,Form1.SaveDialog1.FileName);
       rewrite(z);
       p:=(Form1.s_edit.Text);
       writeln(z,p);
       p:=(Form1.Speed1_edit.Text);
       writeln(z,p);
       p:=(Form1.speed2_Edit.text);
       writeln(z,p);
       p:=(Form1.netro_Edit.text);
       writeln(z,p);
       closefile(z);
    end;
end;
  procedure print_memo1;
  begin
   if  SaveDialog1.Execute then
   print_Memo.Lines.SaveToFile(SaveDialog1.FileName);
end;

end.

