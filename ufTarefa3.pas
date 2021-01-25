unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB, Datasnap.DBClient, Vcl.Mask;

type
  TfTarefa3 = class(TForm)
    lblValoresProjeto: TLabel;
    gridValores: TDBGrid;
    btnObterTotal: TButton;
    btnObterTotalDivisoes: TButton;
    lblTotal: TLabel;
    lblTotalDivisoes: TLabel;
    edtTotal: TEdit;
    edtTotalDivisoes: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnObterTotalClick(Sender: TObject);
    procedure btnObterTotalDivisoesClick(Sender: TObject);
  private
    FDataSet: TClientDataSet;
    FDataSource: TDataSource;
  public
    procedure pPopulaGrid();
    procedure pObterTotal();
    procedure pObterTotalDivisoes();
  end;

var
  fTarefa3: TfTarefa3;

const
  QTD_ITENS = 10;

implementation

{$R *.dfm}

procedure TfTarefa3.btnObterTotalClick(Sender: TObject);
begin
  pObterTotal();
end;

procedure TfTarefa3.btnObterTotalDivisoesClick(Sender: TObject);
begin
  pObterTotalDivisoes();
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  fTarefa3 := nil;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
  FDataSet := TClientDataSet.Create(nil);
  FDataSet.FieldDefs.Add('IdProjeto', ftInteger);
  FDataSet.FieldDefs.Add('NomeProjeto', ftString, 50);
  FDataSet.FieldDefs.Add('Valor', ftFloat);
  FDataSet.CreateDataSet;

  FDataSource := TDataSource.Create(nil);
  FDataSource.DataSet := FDataSet;

  gridValores.DataSource := FDataSource;
end;

procedure TfTarefa3.FormShow(Sender: TObject);
begin
  pPopulaGrid();
end;

procedure TfTarefa3.pObterTotal;
var
  FTotal: Double;
begin
  FTotal := 0;
  with FDataSet do
    begin
      DisableControls;
      First;
      while not Eof do
        begin
          FTotal := FTotal + FieldByName('Valor').Value;
          Next;
        end;
      EnableControls;
    end;
  edtTotal.Text := FormatFloat('R$ ,0.00', FTotal);
end;

procedure TfTarefa3.pObterTotalDivisoes;
var
  FTotalDivisoes: Double;
  FValorAnt: Double;
begin
  FTotalDivisoes := 0;
  FValorAnt      := 0;
  with FDataSet do
    begin
      DisableControls;
      First;
      while not Eof do
        begin
          if (FValorAnt > 0) then
            FTotalDivisoes := FTotalDivisoes + (FieldByName('Valor').Value / FValorAnt);
          FValorAnt := FieldByName('Valor').OldValue;
          Next;
        end;
      EnableControls;
    end;
  edtTotalDivisoes.Text := FormatFloat('R$ ,0.00', FTotalDivisoes);
end;

procedure TfTarefa3.pPopulaGrid;
var
  i: Integer;
begin
  with FDataSet do
    begin
      for i := 1 to QTD_ITENS do
        begin
          Append;
          FieldByName('IdProjeto').Value   := i;
          FieldByName('NomeProjeto').Value := 'Projeto ' + IntToStr(i);
          FieldByName('Valor').Value       := (i * 10);
          Post;
        end;
      TFloatField(FieldByName('Valor')).DisplayFormat := 'R$ ,0.00';
      TFloatField(FieldByName('Valor')).Alignment := taRightJustify;
    end;
end;

end.
