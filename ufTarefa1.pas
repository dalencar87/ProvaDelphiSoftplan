unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uspQuery;

type
  TfTarefa1 = class(TForm)
    lblColunas: TLabel;
    lblTabelas: TLabel;
    lblCondicoes: TLabel;
    lblSQLGerado: TLabel;
    btnGeraSQL: TButton;
    mmoColunas: TMemo;
    mmoTabelas: TMemo;
    mmoCondicoes: TMemo;
    mmoSQLGerado: TMemo;
    spQuery1: TspQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGeraSQLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  public
    procedure pGeraComandoSQL();
    function fValidaFormulario(): Boolean;
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.btnGeraSQLClick(Sender: TObject);
begin
  if fValidaFormulario() then
    pGeraComandoSQL();
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  fTarefa1 := nil;
end;

procedure TfTarefa1.FormCreate(Sender: TObject);
begin
  spQuery1 := TspQuery.Create();
end;

procedure TfTarefa1.FormDestroy(Sender: TObject);
begin
  spQuery1.Destroy();
end;

function TfTarefa1.fValidaFormulario: Boolean;
begin
  Result := True;
  if Length(mmoColunas.Text) <= 0 then
    begin
      Result := False;
      MessageDlg('Informe as Colunas!', mtError, [mbOK], 0);
      if mmoColunas.CanFocus then mmoColunas.SetFocus;
      Exit;
    end;
  if Length(mmoTabelas.Text) <= 0 then
    begin
      Result := False;
      MessageDlg('Informe uma Tabela!', mtError, [mbOK], 0);
      if mmoTabelas.CanFocus then mmoTabelas.SetFocus;
      Exit;
    end;
  if (mmoTabelas.Lines.Count > 1) then
    begin
      Result := False;
      MessageDlg('Só é Possivel Informar 1 Tabela!', mtError, [mbOK], 0);
      if mmoTabelas.CanFocus then mmoTabelas.SetFocus;
      Exit;
    end;
  if Length(mmoCondicoes.Text) <= 0 then
    begin
      Result := False;
      MessageDlg('Informe as Condições!', mtError, [mbOK], 0);
      if mmoCondicoes.CanFocus then mmoCondicoes.SetFocus;
      Exit;
    end;
end;

procedure TfTarefa1.pGeraComandoSQL;
var
  FSQL: TStringList;
  i: Integer;
begin
  mmoSQLGerado.Lines.Clear;
  spQuery1.spColunas.Clear;
  spQuery1.spTabelas.Clear;
  spQuery1.spCondicoes.Clear;

  spQuery1.spColunas.AddStrings(mmoColunas.Lines);
  spQuery1.spTabelas.AddStrings(mmoTabelas.Lines);
  spQuery1.spCondicoes.AddStrings(mmoCondicoes.Lines);

  FSQL := spQuery1.fGeraSQL();

  for i := 0 to FSQL.Count -1 do
    mmoSQLGerado.Lines.Add(FSQL[i]);
end;

end.
