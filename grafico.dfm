object Form6: TForm6
  Left = 69
  Top = 231
  Align = alClient
  AutoSize = True
  Caption = 'Grafico'
  ClientHeight = 695
  ClientWidth = 1437
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -9
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 11
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1437
    Height = 695
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 0
    object Panel1: TPanel
      Left = 1251
      Top = 1
      Width = 185
      Height = 693
      Align = alRight
      Caption = 'Panel2'
      TabOrder = 0
    end
    object TPanel1: TPanel
      Left = 1
      Top = 1
      Width = 1250
      Height = 693
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alClient
      TabOrder = 1
      object Chart1: TChart
        Left = 1
        Top = 1
        Width = 1248
        Height = 691
        Cursor = crCross
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Title.Text.Strings = (
          'Faturamento di'#225'rio')
        Chart3DPercent = 18
        Align = alClient
        AutoSize = True
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        PrintMargins = (
          15
          23
          15
          23)
        ColorPaletteIndex = 13
        object Series2: TBarSeries
          MultiBar = mbStacked
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
          Data = {0000000000}
          Detail = {0000000000}
        end
      end
    end
  end
  object ChartDataSet1: TChartDataSet
    Chart = Chart1
    Left = 1040
    Top = 472
  end
  object ADOConnection1: TADOConnection
    Provider = 'SQLNCLI11.1'
    Left = 1025
    Top = 249
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 1033
    Top = 313
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 1033
    Top = 369
  end
end
