unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TMyThread = class(TThread)
  private
    FProgressBar: TProgressBar;
    FThread: TLabel;
    FTempo: Integer;
  public
    constructor Create(AProgressBar: TProgressBar; AThread: TLabel; ATempo: Integer); reintroduce;
    procedure Execute; override;
    procedure Sincronizar;
  end;

type
  TfTarefa2 = class(TForm)
    btnCriarThreads: TButton;
    pbThreads1: TProgressBar;
    pbThreads2: TProgressBar;
    lblTempo1: TLabel;
    lblTempo2: TLabel;
    edtTempo1: TEdit;
    edtTempo2: TEdit;
    lblThread1: TLabel;
    lblThread2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCriarThreadsClick(Sender: TObject);
  private
    FThread1: TMyThread;
    FThread2: TMyThread;
  public
    procedure pCriaThreads();
    function fValidaFormulario(): Boolean;
  end;

var
  fTarefa2: TfTarefa2;

const
  QTD_ITERACOES = 100;

implementation

{$R *.dfm}

procedure TfTarefa2.btnCriarThreadsClick(Sender: TObject);
begin
  if fValidaFormulario() then
    pCriaThreads();
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  fTarefa2 := nil;
end;

function TfTarefa2.fValidaFormulario: Boolean;
begin
  Result := True;
  if Length(edtTempo1.Text) <= 0 then
    begin
      Result := False;
      MessageDlg('Informe o Tempo Thread 1!', mtError, [mbOK], 0);
      if edtTempo1.CanFocus then edtTempo1.SetFocus;
      Exit;
    end;
  if Length(edtTempo2.Text) <= 0 then
    begin
      Result := False;
      MessageDlg('Informe o Tempo Thread 2!', mtError, [mbOK], 0);
      if edtTempo2.CanFocus then edtTempo2.SetFocus;
      Exit;
    end;
end;

procedure TfTarefa2.pCriaThreads;
begin
  Self.FThread1 := TMyThread.Create(pbThreads1, lblThread1, StrToInt(edtTempo1.Text));
  Self.FThread1.Start;

  Self.FThread2 := TMyThread.Create(pbThreads2, lblThread2, StrToInt(edtTempo2.Text));
  Self.FThread2.Start;
end;


{ TMyThread }

constructor TMyThread.Create;
begin
  inherited Create(True);
  Self.FreeOnTerminate := True;

  FProgressBar := AProgressBar;
  FThread := AThread;
  FTempo := ATempo;
end;

procedure TMyThread.Execute;
var
  i: Integer;
begin
  inherited;
  FProgressBar.Position := 0;
  try
    for i := 0 to QTD_ITERACOES do
      begin
        FThread.Caption := IntToStr(i) + '/' + IntToStr(QTD_ITERACOES);
        Self.Synchronize(Self.Sincronizar);
        Self.Sleep(FTempo);
      end;
  except
    raise Exception.Create('Ocorreu um Erro!');
  end;
end;

procedure TMyThread.Sincronizar;
begin
  FProgressBar.Position := FProgressBar.Position + 1;
end;

end.
