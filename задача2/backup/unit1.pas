
unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Logic  ;

type

  { TForm1 }

  TForm1 = class(TForm) // класс формы
    found_Button: TButton;
    MainMenu: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    OpenDialog: TOpenDialog;
    open_menuitem: TMenuItem;
    SaveDialog1: TSaveDialog;
    close_MenuItem4: TMenuItem;
    instraction_MenuItem: TMenuItem;
    result_Label: TLabel;
    X_Label: TLabel;
    Y_Label: TLabel;
    X_Edit: TEdit;
    Y_Edit: TEdit;
    Print_Memo: TMemo;
    procedure close_MenuItem4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure found_ButtonClick(Sender: TObject);
    procedure instraction_MenuItemClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure DataFromForm();
  private

  public

  end;

var
  Form1: TForm1;
  fl:boolean;
  x,y:integer;

implementation

{$R *.lfm}

{ TForm1 }

//процедура проверки ввода данных
procedure  TForm1.DataFromForm();
begin
  if TryStrToInt(Y_Edit.Text, y) = false then
    begin
    ShowMessage('Неправильно введён параметр y');
    fl:=false;
    exit;
    end;

  if TryStrToInt(X_Edit.Text, x) = false then
      begin
      ShowMessage('Неправильно введён параметр x');
      fl:=false;
      exit;
      end;
end;

procedure TForm1.found_ButtonClick(Sender: TObject);
begin
  DataFromForm();
  if fl=true then
     begin
       print_Memo.Append(' При x= '+IntToStr(x)+' При y= '+IntToStr(y)+' f= '+FloatToStr (culc(x,y)));
       print_Memo.Append('---------------------------');
     end
  else
    begin
      fl:=true;
      exit;
    end;
end;

//процедура вывода справки
procedure TForm1.instraction_MenuItemClick(Sender: TObject);
begin
  ShowMessage('автор- Федотов Захар'+' номер задачи- 2'+' условие задачи- Даны действительные числа x и y. Получить (|x|-|y|)/1+|x*y|'+' ссылка- http://чибгу.рф/zadachnik/Glava01/index01.htm#z2 ');
end;

//процедура выхода
procedure TForm1.close_MenuItem4Click(Sender: TObject);
begin
  close
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  fl:=true;
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  if OpenDialog.Execute then
    begin
      if OpenDialog.FileName <> '' then
        begin
          read_file(x,y,OpenDialog.FileName);
          X_Edit.Text:= Inttostr(x);
          Y_Edit.Text:= Inttostr(y);
        end;
    end;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  DataFromForm();
  if fl=true then
    begin
  if SaveDialog1.Execute then
    if SaveDialog1.FileName <> '' then
      begin
        save_file(x,y,SaveDialog1.FileName);
      end;
    end
  else
    begin
      fl:=true;
      exit;
    end;
end;

//процедура вывода данных из поля Memo
procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    if SaveDialog1.FileName <> '' then
      Print_Memo.Lines.SaveToFile(SaveDialog1.FileName);
end;


 end.

