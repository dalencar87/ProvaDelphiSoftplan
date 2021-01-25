unit uspQuery;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TspQuery = class(TFDQuery)
  private
    FspCondicoes: TStringList;
    FspColunas: TStringList;
    FspTabelas: TStringList;

    procedure SetspColunas(const Value: TStringList);
    procedure SetspCondicoes(const Value: TStringList);
    procedure SetspTabelas(const Value: TStringList);
  public
    constructor Create();
    destructor Destroy();
    function fGeraSQL(): TStringList;
  published
    property spCondicoes: TStringList read FspCondicoes write SetspCondicoes;
    property spColunas: TStringList read FspColunas write SetspColunas;
    property spTabelas: TStringList read FspTabelas write SetspTabelas;
  end;

implementation

{ TspQuery }

constructor TspQuery.Create();
begin
  spColunas   := TStringList.Create;
  spTabelas   := TStringList.Create;
  spCondicoes := TStringList.Create;
end;

destructor TspQuery.Destroy();
begin
  spColunas.Destroy;
  spTabelas.Destroy;
  spCondicoes.Destroy;
end;

function TspQuery.fGeraSQL(): TStringList;
var
  i: Integer;
begin
  Result := TStringList.Create();

  Result.Add('select ');

  for i := 0 to spColunas.Count -1 do
    Result.Add(spColunas.Strings[i]);

  Result.Add('from ' + spTabelas.Strings[0]);
  Result.Add('where 1=1');

  for i := 0 to spCondicoes.Count -1 do
    Result.Add('and ' + spCondicoes.Strings[i]);
end;

procedure TspQuery.SetspColunas(const Value: TStringList);
begin
  FspColunas := Value;
end;

procedure TspQuery.SetspCondicoes(const Value: TStringList);
begin
  FspCondicoes := Value;
end;

procedure TspQuery.SetspTabelas(const Value: TStringList);
begin
  FspTabelas := Value;
end;

end.
