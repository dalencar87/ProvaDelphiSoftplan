object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Tarefa 2'
  ClientHeight = 235
  ClientWidth = 600
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
  PixelsPerInch = 96
  TextHeight = 13
  object lblTempo1: TLabel
    Left = 64
    Top = 48
    Width = 78
    Height = 13
    Caption = 'Tempo Thread 1'
  end
  object lblTempo2: TLabel
    Left = 191
    Top = 48
    Width = 78
    Height = 13
    Caption = 'Tempo Thread 2'
  end
  object lblThread1: TLabel
    Left = 0
    Top = 220
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblThread2: TLabel
    Left = 300
    Top = 220
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pbThreads1: TProgressBar
    Left = 0
    Top = 192
    Width = 300
    Height = 26
    TabOrder = 1
  end
  object btnCriarThreads: TButton
    Left = 384
    Top = 65
    Width = 87
    Height = 25
    Caption = 'Criar Threads'
    TabOrder = 0
    OnClick = btnCriarThreadsClick
  end
  object pbThreads2: TProgressBar
    Left = 300
    Top = 192
    Width = 300
    Height = 26
    TabOrder = 2
  end
  object edtTempo1: TEdit
    Left = 64
    Top = 67
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 3
  end
  object edtTempo2: TEdit
    Left = 191
    Top = 67
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 4
  end
end
