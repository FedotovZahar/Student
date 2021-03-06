unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,Logic;

type

  { TForm1 }

  TForm1 = class(TForm)//класс формы
    MainMenu1: TMainMenu;//поля  класса
    Open_Menu_File: TMenuItem;
    Open_File: TMenuItem;
    Data_Save_File: TMenuItem;
    Save_Result: TMenuItem;
    Close_File: TMenuItem;
    Instruction: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    time_Button: TButton;
    S_Edit: TEdit;
    Speed1_Edit: TEdit;
    speed2_Edit: TEdit;
    netro_Edit: TEdit;
    S_Label: TLabel;
    speed1_Label: TLabel;
    speed2_Label: TLabel;
    netro_Label: TLabel;
    print_Label: TLabel;
    print_Memo: TMemo; //конец полей класса
    procedure Data_Save_FileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject); //  объявление методов класса
    procedure Open_FileClick(Sender: TObject);
    procedure Data_SaveClick(Sender: TObject);
    procedure Save_ResultClick(Sender: TObject);
    procedure Close_FileClick(Sender: TObject);
    procedure InstructionClick(Sender: TObject);
    procedure time_ButtonClick(Sender: TObject);
    procedure DataFromForm(); //конец объявления методов класса
  private

  public

  end;

var
  Form1: TForm1;//объект класса
  fl:boolean;
  v1,v2,S,a:Real;
implementation

{$R *.lfm}

{ TForm1 }

//процедура проверки данных
procedure  TForm1.DataFromForm();//определение метода
begin
  if TryStrToFloat(S_Edit.Text, s) = false then
    begin
    ShowMessage('Неправильно введён параметр s');
    fl:=false;
    exit;
    end;

  if TryStrToFloat(Speed1_Edit.Text, v1) = false then
      begin
      ShowMessage('Неправильно введён параметр v1');
      fl:=false;
      exit;
      end;

    if TryStrToFloat(speed2_Edit.Text, v2) = false then
      begin
      ShowMessage('Неправильно введён параметр v2');
      fl:=false;
      exit;
      end;

    if TryStrToFloat(netro_Edit.Text, a) = false then
      begin
      ShowMessage('Неправильно введён параметр a2');
      fl:=false;
      exit;
      end;
end;

procedure TForm1.time_ButtonClick(Sender: TObject);// имя метода класса,TForm1-имя класса указывается
begin
 DataFromForm();
   if fl=true then
      begin
        print_Memo.Append('При s= '+FloatToStr(s)+' При v1= '+FloatToStr(v1)+' При v2= '+FloatToStr(v2)+' При а= '+FloatToStr(a)+' Время= '+FloatToStr(round(fund_time(v1,v2,S,a)*100)/100));
        print_Memo.Append('----------------------------------------------------------');
      end
   else
     begin
       fl:=true;
       exit;
     end;
end;

procedure TForm1.Open_FileClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    begin
      if OpenDialog1.FileName <> '' then
        begin
          open_data(s,v1,v2,a,OpenDialog1.FileName);
          S_Edit.Text:= Floattostr(s);
          Speed1_Edit.Text:= Floattostr(v1);
          speed2_Edit.Text:= Floattostr(v2);
          netro_Edit.Text:= Floattostr(a);
        end;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  fl:=true;
end;

procedure TForm1.Data_Save_FileClick(Sender: TObject);
begin
 DataFromForm();
 if fl=true then
   begin
 if SaveDialog1.Execute then
   if SaveDialog1.FileName <> '' then
     begin
       save_data(s,v1,v2,a,SaveDialog1.FileName);
     end;
   end
 else
   begin
     fl:=true;
     exit;
   end;
end;

//процедура сохранения данных из Memo
procedure TForm1.Save_ResultClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    if SaveDialog1.FileName <> '' then
      Print_Memo.Lines.SaveToFile(SaveDialog1.FileName);
end;

// процедура выхода
procedure TForm1.Close_FileClick(Sender: TObject);
begin
  close
end;

//процедура вывода справки
procedure TForm1.InstructionClick(Sender: TObject);
begin
 ShowMessage('автор- Федотов Захар'+' номер задачи- 19 '+'Определить время, через которое встретятся два тела, равноускоренно движущиеся навстречу друг другу, если известны их начальные скорости, ускорения и начальное расстояние между ними.'+' ссылка- http://чибгу.рф/zadachnik/Glava01/index01.htm#z2 ');
end;


end.

