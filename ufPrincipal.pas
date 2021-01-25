unit ufPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfPrincipal = class(TForm)
    mmTarefas: TMainMenu;
    mmMenuTarefas: TMenuItem;
    mmTarefa1: TMenuItem;
    mmTarefa2: TMenuItem;
    mmTarefa3: TMenuItem;
    procedure mmTarefa1Click(Sender: TObject);
    procedure mmTarefa2Click(Sender: TObject);
    procedure mmTarefa3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

uses
  ufTarefa1, ufTarefa2, ufTarefa3;

{$R *.dfm}

procedure TfPrincipal.mmTarefa1Click(Sender: TObject);
begin
  if not Assigned(fTarefa1) then
    fTarefa1 := TfTarefa1.Create(Self);
  fTarefa1.Show;
end;

procedure TfPrincipal.mmTarefa2Click(Sender: TObject);
begin
  if not Assigned(fTarefa2) then
    fTarefa2 := TfTarefa2.Create(Self);
  fTarefa2.Show;
end;

procedure TfPrincipal.mmTarefa3Click(Sender: TObject);
begin
  if not Assigned(fTarefa3) then
    fTarefa3 := TfTarefa3.Create(Self);
  fTarefa3.Show;
end;

end.
