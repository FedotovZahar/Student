unit Logic;

{$mode objfpc}{$H+}

interface
function  fund_time(var v1,v2,S,a:Real):real;
 procedure open_data(var s,v1,v2,a:real;FileName:string);
 procedure save_data(var s,v1,v2,a:real;FileName:string);
implementation
uses Classes, SysUtils;

//функция расчёта времени
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

//процедура открытия файла
procedure open_data(var s,v1,v2,a:real;FileName:string);
var t:text;
begin
  assign(t, filename);
  reset(t);
  readln(t, s);
  readln(t, v1);
  readln(t, v2);
  readln(t, a);
  close(t);
end;


//процедура сохранения данных
procedure save_data(var s,v1,v2,a:real;FileName:string);
var f:text;
begin
  assign(f, filename);
  rewrite(f);
  writeln(f,round(s));
  writeln(f,round(v1));
  writeln(f,round(v2));
  writeln(f,round(a));
  close(f);
    end;

end.

