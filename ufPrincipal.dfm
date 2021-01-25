object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Caption = 'fPrincipal'
  ClientHeight = 200
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmTarefas
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object mmTarefas: TMainMenu
    Left = 40
    Top = 48
    object mmMenuTarefas: TMenuItem
      Caption = 'Tarefas'
      object mmTarefa1: TMenuItem
        Caption = 'Tarefa 1'
        OnClick = mmTarefa1Click
      end
      object mmTarefa2: TMenuItem
        Caption = 'Tarefa 2'
        OnClick = mmTarefa2Click
      end
      object mmTarefa3: TMenuItem
        Caption = 'Tarefa 3'
        OnClick = mmTarefa3Click
      end
    end
  end
end
