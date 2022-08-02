object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'RenCore'
  ClientHeight = 749
  ClientWidth = 1485
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = -4
    Width = 1485
    Height = 757
    Caption = 'Panel1'
    TabOrder = 0
    object DBImage1: TDBImage
      Left = 0
      Top = 8
      Width = 241
      Height = 249
      DataField = 'IMG'
      DataSource = DataSource1
      TabOrder = 1
    end
    object GridPanel1: TGridPanel
      Left = 504
      Top = 150
      Width = 809
      Height = 457
      Caption = 'GridPanel1'
      ColumnCollection = <
        item
          Value = 20.000000000000000000
        end
        item
          Value = 20.000000000000000000
        end
        item
          Value = 20.000000000000000000
        end
        item
          Value = 20.000000000000000000
        end
        item
          Value = 20.000000000000000000
        end>
      ControlCollection = <>
      RowCollection = <
        item
          Value = 20.000000000000000000
        end
        item
          Value = 20.000000000000000000
        end
        item
          Value = 20.000000000000000000
        end
        item
          Value = 20.000000000000000000
        end
        item
          Value = 20.000000000000000000
        end>
      TabOrder = 0
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\UNO_4\Database\RDB.AKS'
      'User_Name=SYSDBA'
      'CharacterSet=UTF8'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 256
    Top = 40
  end
  object product: TFDQuery
    Active = True
    IndexFieldNames = 'IMG;MCENA;NAME'
    Connection = FDConnection1
    UpdateOptions.AssignedValues = [uvLockMode]
    UpdateOptions.LockMode = lmPessimistic
    SQL.Strings = (
      'select t.id,t.pid,d.name as name,t.mcena as mcena,t.img as img'
      'from tbmenu t'
      'inner join d_product d on d.id=t.idproduct and t.name is null'
      'where t.idstation=1')
    Left = 257
    Top = 193
  end
  object DataSource1: TDataSource
    DataSet = product
    Left = 241
    Top = 289
  end
  object Menu_items: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select g.id,g.pid,'
      
        'max((g.rn-1)/cast(:rc as integer))over(partition by g.pid)+1 as ' +
        'mr,'
      
        'cast(mod(g.rn-1, cast(:rc as integer))as smallint) as POS_X, cas' +
        't((g.rn-1)/cast(:rc as integer) as smallint) as POS_Y,'
      
        'g.idstation,g.name,g.caption,g.idproduct,g.back_color,g.font_col' +
        'or,g.font_size,g.font_name,g.stoplist,'
      
        'g.cena,g.idpodrazd,g.obsluzh,g.bobsluzh,g.bdiscount,g.idclassif,' +
        'g.pid_name'
      'from('
      'SELECT'
      '    ID,'
      '    PID,'
      
        '    row_number()over(partition by PID order by pos_y,pos_x) as r' +
        'n,'
      '    IDSTATION,'
      '    NAME,'
      
        '    coalesce(UPPER(NAME), (select name from d_product where id =' +
        ' m.idProduct)) as CAPTION,'
      '    IDPRODUCT,'
      '    BACK_COLOR,'
      '    FONT_COLOR,'
      '    FONT_SIZE,'
      '    FONT_NAME,'
      '    STOPLIST,'
      
        '    iif(coalesce(mcena, 0) = 0, (select mcena from d_product whe' +
        're id = m.idProduct), mcena) as cena,'
      
        '    coalesce((select out_id from find_printed(m.PID)), 0) as idP' +
        'odrazd,'
      '    OBSLUZH, BOBSLUZH, BDISCOUNT,'
      
        '    (select podrazd from find_podrazd((select pid from d_product' +
        ' where id = m.idproduct))) as idclassif,'
      
        '    (SELECT NAME FROM TBMENU WHERE ID = (select podrazd from fin' +
        'd_menu_podrazd(m.pid))) AS PID_NAME'
      'FROM'
      '    TBMENU m'
      'WHERE m.IDSTATION = 1)g'
      'ORDER BY g.pid,pos_y,pos_x')
    Left = 409
    Top = 73
    ParamData = <
      item
        Name = 'RC'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object DataSource2: TDataSource
    AutoEdit = False
    DataSet = Menu_items
    Left = 345
    Top = 217
  end
  object up_id: TFDQuery
    Active = True
    ConstraintsEnabled = True
    DetailFields = 'NAME'
    Connection = FDConnection1
    SQL.Strings = (
      'select id, back_color, name'
      'from tbMenu'
      'where id='
      '(select pid from tbmenu where id = :id)')
    Left = 313
    Top = 129
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object DataSource3: TDataSource
    AutoEdit = False
    DataSet = up_id
    Left = 345
    Top = 273
  end
end
