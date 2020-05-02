
unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Grids,
  Logic  ;

type

  { TForm1 }

  TForm1 = class(TForm) // класс формы
    found_Button: TButton;   //поля класса
    MainMenu: TMainMenu;
    Open_File: TMenuItem;
    Save_Data: TMenuItem;
    Save_Result: TMenuItem;
    OpenDialog: TOpenDialog;
    open_menu_Fail: TMenuItem;
    SaveDialog1: TSaveDialog;
    Close_File: TMenuItem;
    Instraction: TMenuItem;
    result_Label: TLabel;
    StringGrid1: TStringGrid;
    X_Label: TLabel;
    Y_Label: TLabel;
    X_Edit: TEdit;
    Y_Edit: TEdit;
    procedure Close_FileClick(Sender: TObject); //объявление методов класса
    procedure FormCreate(Sender: TObject);
    procedure found_ButtonClick(Sender: TObject);
    procedure InstractionClick(Sender: TObject);
    procedure Open_FileClick(Sender: TObject);
    procedure Save_DataClick(Sender: TObject);
    procedure Save_ResultClick(Sender: TObject);
    procedure DataFromForm();  // конец объявления методов класса
  private

  public

  end;

var
  Form1: TForm1;// объект класса TForm1
  fl:boolean;
  i:integer;
 c:Tcalcul;

implementation

{$R *.lfm}

{ TForm1 }

//процедура проверки ввода данных
procedure  TForm1.DataFromForm(); // определение метода класса
begin
  if TryStrToInt(Y_Edit.Text,c[i].Y ) = false then
    begin
    ShowMessage('Неправильно введён параметр y');
    fl:=false;
    exit;
    end;

  if TryStrToInt(X_Edit.Text,c[i].X) = false then
      begin
      ShowMessage('Неправильно введён параметр x');
      fl:=false;
      exit;
      end;
end;

procedure TForm1.found_ButtonClick(Sender: TObject);//имя метода класса,TForm1-имя класса указывается
var
 k:integer;
begin
  k:=1;
  DataFromForm();
  if fl=true then
     begin
        while StringGrid1.Cells[0,k]<>'' do
          begin
            inc(k);
          end;
     c[i].f:=Culc(c[i].x,c[i].y);
     StringGrid1.Cells[2,k]:=FloatToStr(c[i].F);
     StringGrid1.Cells[0,k]:=IntToStr(c[i].x);
     StringGrid1.Cells[1,k]:=FloatToStr(c[i].y);
     inc(i);
     if k>=3 then
       begin
         StringGrid1.RowCount:=StringGrid1.RowCount+1;
       end;
     end
     else
    begin
      fl:=true;
      exit;
    end;
end;

//процедура вывода справки
procedure TForm1.InstractionClick(Sender: TObject);
begin
  ShowMessage('автор- Федотов Захар'+' номер задачи- 2'+' условие задачи- Даны действительные числа x и y. Получить (|x|-|y|)/1+|x*y|'+' ссылка- http://чибгу.рф/zadachnik/Glava01/index01.htm#z2 ');
end;

//процедура выхода
procedure TForm1.Close_FileClick(Sender: TObject);
begin
  close
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  i:=1;
  fl:= true;
  StringGrid1.Cells[0,0]:='X';
  StringGrid1.Cells[1,0]:='Y';
  StringGrid1.Cells[2,0]:='Результат F';
end;

procedure TForm1.Open_FileClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    begin
      if OpenDialog.FileName <> '' then
        begin
              read_file(c[i].x,c[i].y,OpenDialog.FileName);
              X_Edit.Text:= Inttostr(c[i].x);
              Y_Edit.Text:= Inttostr(c[i].y);
        end;
    end;
end;

procedure TForm1.Save_DataClick(Sender: TObject);
begin
  DataFromForm();
  if fl=true then
    begin
  if SaveDialog1.Execute then
    if SaveDialog1.FileName <> '' then
      begin
        save_file(c[i].x,c[i].y,SaveDialog1.FileName);
      end;
    end
  else
    begin
      fl:=true;
      exit;
    end;
end;

//процедура вывода данных из таблицы
procedure TForm1.Save_ResultClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    if SaveDialog1.FileName <> '' then
      save_dat(c,SaveDialog1.FileName);
end;


 end.

