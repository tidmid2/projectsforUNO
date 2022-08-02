object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CommPortDriver1: TCommPortDriver
    PortName = '\\.\COM2'
    BaudRate = br2400
    BaudRateValue = 2400
    InBufSize = 1024
    OutBufSize = 1024
    Left = 160
    Top = 48
  end
end
