object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Tarefa 1'
  ClientHeight = 298
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lblColunas: TLabel
    Left = 30
    Top = 32
    Width = 38
    Height = 13
    Caption = 'Colunas'
  end
  object lblTabelas: TLabel
    Left = 186
    Top = 32
    Width = 37
    Height = 13
    Caption = 'Tabelas'
  end
  object lblCondicoes: TLabel
    Left = 342
    Top = 32
    Width = 49
    Height = 13
    Caption = 'Condi'#231#245'es'
  end
  object lblSQLGerado: TLabel
    Left = 30
    Top = 160
    Width = 57
    Height = 13
    Caption = 'SQL Gerado'
  end
  object btnGeraSQL: TButton
    Left = 500
    Top = 88
    Width = 75
    Height = 25
    Caption = 'GeraSQL'
    TabOrder = 0
    OnClick = btnGeraSQLClick
  end
  object mmoColunas: TMemo
    Left = 30
    Top = 51
    Width = 150
    Height = 89
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object mmoTabelas: TMemo
    Left = 186
    Top = 51
    Width = 150
    Height = 89
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object mmoCondicoes: TMemo
    Left = 342
    Top = 51
    Width = 150
    Height = 89
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object mmoSQLGerado: TMemo
    Left = 30
    Top = 179
    Width = 545
    Height = 111
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object spQuery1: TspQuery
    Left = 536
    Top = 32
  end
end
