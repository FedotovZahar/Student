unit  Logic ;

{$mode objfpc}{$H+}

interface
function Culc(var x,y:integer):real;
procedure read_file(var x,y:integer;FileName:string);
procedure save_file(var x,y:integer;FileName:string);
implementation
uses
  Classes, SysUtils;

//функция расчёта выражения:(abs(x)-abs(y))/(1+abs(x*y)
 function Culc(var x,y:integer):real;
  var
    f:real;
   begin
     f:=(abs(x)-abs(y))/(1+abs(x*y));
     f:=Round(f*100)/100;
    Culc:=f;
   end;

//процедура открытия файла
procedure read_file(var x,y:integer;FileName:string);
var F:text;
begin
  assign(f, filename);
  reset(f);
  readln(F, x);
  readln(F, y);
  close(f);
end;
 //процедура сохранения данных
  procedure save_file(var x,y:integer;FileName:string);
  var f:text;
begin
  assign(f, filename);
  rewrite(f);
  writeln(f,(x));
  writeln(f,(y));
  close(f);
end;

end.

