object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 291
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 633
    Height = 291
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=DbParams')
    LoginPrompt = False
    Left = 40
    Top = 8
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 40
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 40
    Top = 200
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = FDQuery1
    Left = 40
    Top = 104
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 40
    Top = 152
    object ClientDataSet1sid: TIntegerField
      DisplayWidth = 10
      FieldName = 'sid'
      Origin = 'sid'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ClientDataSet1sname: TStringField
      DisplayWidth = 14
      FieldName = 'sname'
      Origin = 'sname'
      Required = True
      Size = 50
    end
    object ClientDataSet1sex: TStringField
      DisplayWidth = 14
      FieldName = 'sex'
      Origin = 'sex'
      Required = True
      Size = 50
    end
    object ClientDataSet1sage: TIntegerField
      DisplayWidth = 10
      FieldName = 'sage'
      Origin = 'sage'
      Required = True
    end
  end
  object FDManager1: TFDManager
    ConnectionDefFileName = 'G:\DelphiDemo\ProjectFDConnection\Win32\Debug\config.ini'
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 128
    Top = 8
  end
end
