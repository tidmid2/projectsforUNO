object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 451
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 200
    Top = 176
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=SYSDBA;Data Source=C:\U' +
      'sers\Elewlian\Desktop\tabuko\RDB.AKS;Mode=ReadWrite|Share Deny N' +
      'one;Persist Security Info=False;'
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 304
    Top = 80
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from people')
    Left = 152
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 456
    Top = 80
  end
end
