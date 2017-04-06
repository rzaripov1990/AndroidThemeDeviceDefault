unit uMain;

{
  author: ZuBy

  https://github.com/rzaripov1990

  ...
  ¬ключить файл (FMX.Helpers.Android) в проект и используйте тему текущей версии android
  ...
  Include the file (FMX.Helpers.Android) in the project and use the theme of the current version of android
  ...

  2017
}

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.ListBox, FMX.DateTimeCtrls;

type
  TFormMain = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    TimeEdit1: TTimeEdit;
    DateEdit1: TDateEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

uses
  Androidapi.JNI.App,
  FMX.Helpers.Android;

procedure TFormMain.Button1Click(Sender: TObject);
begin
  ShowMessage('Test Message');
end;

procedure TFormMain.ComboBox1Change(Sender: TObject);
begin
  // устанавливаем выбранную тему
  // если не указывать будет использоватьс€ стандартна€ тема дл€ текущей версии андроида
  TJAndroidThemeHelper.ThemeID := ComboBox1.ListItems[ComboBox1.ItemIndex].Tag;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  aItem: TListBoxItem;
begin
  aItem := TListBoxItem.Create(ComboBox1);
  aItem.Tag := TJAlertDialog.JavaClass.THEME_TRADITIONAL;
  aItem.Text := 'THEME_TRADITIONAL';
  ComboBox1.AddObject(aItem);

  aItem := TListBoxItem.Create(ComboBox1);
  aItem.Tag := TJAlertDialog.JavaClass.THEME_DEVICE_DEFAULT_DARK;
  aItem.Text := 'THEME_DEVICE_DEFAULT_DARK';
  ComboBox1.AddObject(aItem);

  aItem := TListBoxItem.Create(ComboBox1);
  aItem.Tag := TJAlertDialog.JavaClass.THEME_DEVICE_DEFAULT_LIGHT;
  aItem.Text := 'THEME_DEVICE_DEFAULT_LIGHT';
  ComboBox1.AddObject(aItem);

  aItem := TListBoxItem.Create(ComboBox1);
  aItem.Tag := TJAlertDialog.JavaClass.THEME_HOLO_DARK;
  aItem.Text := 'THEME_HOLO_DARK';
  ComboBox1.AddObject(aItem);

  aItem := TListBoxItem.Create(ComboBox1);
  aItem.Tag := TJAlertDialog.JavaClass.THEME_HOLO_LIGHT;
  aItem.Text := 'THEME_HOLO_LIGHT';
  ComboBox1.AddObject(aItem);

  // ComboBox1.ItemIndex := 0;
end;

end.
