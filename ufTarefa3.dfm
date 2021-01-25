object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Tarefa 3'
  ClientHeight = 400
  ClientWidth = 620
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblValoresProjeto: TLabel
    Left = 8
    Top = 8
    Width = 96
    Height = 13
    Caption = 'Valores por Projeto:'
  end
  object lblTotal: TLabel
    Left = 491
    Top = 296
    Width = 44
    Height = 13
    Caption = 'Total R$:'
  end
  object lblTotalDivisoes: TLabel
    Left = 491
    Top = 352
    Width = 86
    Height = 13
    Caption = 'Total Divis'#245'es R$:'
  end
  object gridValores: TDBGrid
    Left = 8
    Top = 27
    Width = 604
    Height = 263
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IdProjeto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeProjeto'
        Width = 400
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'Valor'
        Title.Alignment = taRightJustify
        Width = 95
        Visible = True
      end>
  end
  object btnObterTotal: TButton
    Left = 410
    Top = 313
    Width = 75
    Height = 25
    Caption = 'Obter Total'
    TabOrder = 1
    OnClick = btnObterTotalClick
  end
  object btnObterTotalDivisoes: TButton
    Left = 378
    Top = 369
    Width = 107
    Height = 25
    Caption = 'Obter Total Divis'#245'es'
    TabOrder = 2
    OnClick = btnObterTotalDivisoesClick
  end
  object edtTotal: TEdit
    Left = 491
    Top = 315
    Width = 121
    Height = 21
    Alignment = taRightJustify
    NumbersOnly = True
    TabOrder = 3
  end
  object edtTotalDivisoes: TEdit
    Left = 491
    Top = 371
    Width = 121
    Height = 21
    Alignment = taRightJustify
    NumbersOnly = True
    TabOrder = 4
  end
end
