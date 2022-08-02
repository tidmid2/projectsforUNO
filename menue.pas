unit menue;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.WinXPanels, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.Client, FireDAC.Comp.Script, Data.DB, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.DBCGrids,
  CRGrid, Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Data.Bind.Components, Data.Bind.DBScope,
  Datasnap.DBClient, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  dxGDIPlusClasses;

  type
  MyItem = class(TPanel)
    private
     FCardType:byte;
    public
    id:Integer;
    Img:TImage;
    Txt:TLabel;
    Cena:TLabel;
    Stop:TImage;
    Menu_itemsID: TIntegerField;
    Menu_itemsPID: TIntegerField;
    Menu_itemsMR: TLargeintField;
    Menu_itemsPOS_X: TSmallintField;
    Menu_itemsPOS_Y: TSmallintField;
    Menu_itemsIDSTATION: TIntegerField;
    Menu_itemsNAME: TWideStringField;
    Menu_itemsCAPTION: TWideStringField;
    Menu_itemsIDPRODUCT: TIntegerField;
    Menu_itemsBACK_COLOR: TIntegerField;
    Menu_itemsFONT_COLOR: TIntegerField;
    Menu_itemsFONT_SIZE: TIntegerField;
    Menu_itemsFONT_NAME: TWideStringField;
    Menu_itemsSTOPLIST: TSmallintField;
    Menu_itemsCENA: TFloatField;
    Menu_itemsIDPODRAZD: TIntegerField;
    Menu_itemsOBSLUZH: TCurrencyField;
    Menu_itemsBOBSLUZH: TSmallintField;
    Menu_itemsBDISCOUNT: TSmallintField;
    Menu_itemsIDCLASSIF: TIntegerField;
    Menu_itemsPID_NAME: TWideStringField;
//    procedure crtClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SetType(AValue:byte);
    constructor create(AOwner: TComponent); override;
    destructor destroy; override;

    property isItem:byte read FCardType write SetType;
  end;

type
  TForm3 = class(TForm)
    FDConnection1: TFDConnection;
    product: TFDQuery;
    DataSource1: TDataSource;
    Menu_items: TFDQuery;
    DataSource2: TDataSource;
    up_id: TFDQuery;
    DataSource3: TDataSource;
    Panel1: TPanel;
    GridPanel1: TGridPanel;
    DBImage1: TDBImage;
//    procedure ChagResolution(W, H: Integer);
    procedure paint_menugrid;
//    procedure Memo1KeyPress;
//    procedure BtnState(Img:TImage;act:Boolean);
  private
    { Private declarations }
    podrazdID, fonColor:Integer;
    ColCnt,SrollStep:Byte;
    SizeKoof:Double;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation


{procedure TForm3.ChagResolution(W, H: Integer);
var ClientWidth,ClientHeight:Integer;
begin
    ClientHeight:=768;
    ClientWidth:=1024;
   SizeKoof:= H/1024;
   TForm3.ClientWidth:=W;
   TForm3.ClientHeight:=H;
   //Panel.Width:=trunc(Panel1.Width*(W/1440));

   {StringGrid1.DefaultColWidth:=trunc(StringGrid1.DefaultColWidth*(W/1440));
   StringGrid1.DefaultRowHeight:=trunc(StringGrid1.DefaultRowHeight*(H/1024));
   //cxDBLookupComboBox1.Width:= trunc(cxDBLookupComboBox1.Width*W/1440);
   //cxButton11.Left:=cxDBLookupComboBox1.Left+cxDBLookupComboBox1.Width+8;
   //DBLookupComboBox1.Width:= trunc(DBLookupComboBox1.Width*W/1440);
   //DBLookupComboBox1.Left:= cxButton11.Left+cxButton11.Width+24;
   //cxDBLookupComboBox1.Style.Font.Size:=trunc(cxDBLookupComboBox1.Style.Font.Size*SizeKoof);
   //DBLookupComboBox1.Style.Font.Size:=trunc(DBLookupComboBox1.Style.Font.Size*SizeKoof);
   //Label6.Left:= DBLookupComboBox1.Left;
   //cxButton1.Left:= DBLookupComboBox1.Left+DBLookupComboBox1.Width+25;

   //ClearBtn.Width:= trunc(ClearBtn.Height*SizeKoof);//trunc(ClearBtn.Width*W/1440);
   //ClearBtn.Height:=trunc(ClearBtn.Height*SizeKoof);
   //ClearBtn.Left:=trunc(ClearBtn.Left*(W/1440));
   //ClearBtn.Top:=trunc(ClearBtn.Top*SizeKoof);

   //PayButton.Width:= trunc(PayButton.Width*W/1440);
   //PayButton.Height:= trunc(PayButton.Height*SizeKoof);
   //PayButton.Left:=ClearBtn.Left*2+ClearBtn.Width;
   //PayButton.Top:=trunc(PayButton.Top*SizeKoof);

   //Label3.Top:=trunc(Label3.Top*SizeKoof);
   //Label3.Font.Size:=trunc(Label3.Font.Size*SizeKoof);
   //Label4.Top:=trunc(Label4.Top*SizeKoof);
   //Label4.Font.Size:=trunc(Label4.Font.Size*SizeKoof);

   //Label2.Font.Size:=trunc(Label2.Font.Size*SizeKoof);
   //Label2.Left:=PayButton.Left+PayButton.Width+trunc(8*W/1440);
   //Label2.Top:=PayButton.Top+trunc(25*W/1440);
   //Panel3.Height:=trunc(Panel3.Height*SizeKoof);
   //Panel6.Height:=trunc(Panel6.Height*SizeKoof);
  // Panel5.Height:=trunc(Panel5.Height*SizeKoof);
   //Panel7.Height:=trunc(Panel7.Height*SizeKoof);
 //  Label7.Font.Size:=trunc(Label7.Font.Size*SizeKoof);
  // Label1.Font.Size:=trunc(Label1.Font.Size*SizeKoof);
  // Label8.Font.Size:=trunc(Label8.Font.Size*SizeKoof);
   //Label9.Font.Size:=trunc(Label9.Font.Size*SizeKoof);
  // Label10.Font.Size:=trunc(Label10.Font.Size*SizeKoof);

   //Image3.Height:=trunc(Image3.Height*SizeKoof);
   //Image1.Height:=trunc(Image1.Height*SizeKoof);

   //Image5.Height:=trunc(Image5.Height*SizeKoof);
   //Image6.Height:=trunc(Image6.Height*SizeKoof);
   //Image7.Height:=trunc(Image7.Height*SizeKoof);

  // Image3.Left:=trunc(Image3.Left*SizeKoof);
  // Image1.Left:=trunc(Image1.Left*SizeKoof);

   //Image5.Left:=trunc(Image5.Left*SizeKoof);
 //  Image6.Left:=trunc(Image6.Left*SizeKoof);
  // Image7.Left:=trunc(Image7.Left*SizeKoof);

  // Label7.Left:=Image3.Left;
  // Label1.Left:=Image1.Left;
  // Label8.Left:=Image5.Left;
   //Label9.Left:=Image6.Left;
   //Label10.Left:=Image7.Left;

   //cxStyle1.Font.Size:=trunc(cxStyle1.Font.Size*SizeKoof);
   //cxStyle1.Font.Style:=[fsbold];
   //cxStyle2.Font.Size:=trunc(cxStyle2.Font.Size*SizeKoof);
   //cxStyle3.Font.Size:=trunc(cxStyle3.Font.Size*SizeKoof);
   //Memo1.Font.Size:= trunc(Memo1.Font.Size*SizeKoof);
          }

uses uJobFieldBlob;
//end;


{procedure TForm3.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
   if Panel9.Tag = 0 then
     begin
      dm.Orders_item.Edit;
      dm.Orders_itemCOMMENTS.AsString := Memo1.Lines.Strings[0];
      dm.Orders_item.Post;
      Panel9.Visible := false;
     end
   else if Panel9.Tag = 1 then
     begin
      if Memo1.Lines.Strings[0] <> '' then
        begin
         Menu_items.Filter:='upper('+Menu_itemsCAPTION.FieldName+') like ''%'+AnsiUpperCase(Memo1.Lines.Strings[0])+'%''';
         SrollStep:=0;
         Paint_menugrid;
        end;
      Panel9.Visible := false;
     end;
  end
else if Panel9.Tag = 1 then
 begin
   if Length(Memo1.Lines.Strings[0]) > 0 then
        begin
          if key = #8 then
           begin
            if length(Memo1.Lines.Strings[0])>1 then
              begin
                var str:=Memo1.Lines.Strings[0];
                delete(str,length(str),1);
                Menu_items.Filter:='upper('+Menu_itemsCAPTION.FieldName+') like ''%'+AnsiUpperCase(str)+'%''';
              end
            else begin
             if PodrazdID = 0 then
                Menu_items.Filter:=Menu_itemsPID.FieldName+' is null'
             else Menu_items.Filter:=Menu_itemsPID.FieldName+' = '+PodrazdID.ToString;
            end;
           end
          else Menu_items.Filter:='upper('+Menu_itemsCAPTION.FieldName+') like ''%'+AnsiUpperCase(Memo1.Lines.Strings[0]+Key)+'%''';
          SrollStep:=0;
          Paint_menugrid;
        end;
 end;
end; }

{procedure TForm3.BtnState(Img:TImage;act: Boolean);
begin
 Img.Picture.Bitmap:=nil;
 if act then
  cxImageList4.GetBitmap(Img.Tag+0,Img.Picture.Bitmap)
 else cxImageList4.GetBitmap(Img.Tag+1,Img.Picture.Bitmap);

 Img.Enabled:=act;
end; }

procedure TForm3.paint_menugrid;
var i:Integer;
begin
 if GridPanel1.ControlCount = 0 then
  for i:= 0 to 24 do
   with MyItem.Create(GridPanel1) do
     isItem:=0;

 {BtnState(Image6,SrollStep > 0);
 BtnState(Image7,Menu_items.RecordCount > SrollStep * ColCnt + 25); }
 {Image6.Visible:= SrollStep > 0;
 Label9.Visible:= SrollStep > 0;
 Image7.Visible:= Menu_items.RecordCount > SrollStep * ColCnt + 25;
 Label10.Visible:= Menu_items.RecordCount > SrollStep * ColCnt + 25; }

 for I := 1 to 25 do
  begin

   if Menu_items.RecordCount < i + SrollStep * ColCnt then
     (GridPanel1.Controls[i-1] as MyItem).isItem:=0
   else
    begin

      Menu_items.RecNo:= i + SrollStep * ColCnt;


      with (GridPanel1.Controls[i-1] as MyItem) do
      begin
        if Menu_itemsIDPRODUCT.IsNull then
          isItem:=1
        else isItem:=2;
        Txt.Caption:=Menu_itemsCAPTION.AsString;
        Cena.Caption:=FormatCurr('# ##0',Menu_itemsCena.AsCurrency);
        id:=Menu_itemsID.AsInteger;
        Stop.Visible:=Menu_itemsSTOPLIST.AsInteger=1;
      end

    end;
  end;

end;

constructor MyItem.create(AOwner: TComponent);
begin
  inherited;
  Self.Align:=alClient;
  Self.BevelOuter:=bvNone;
  Self.ShowCaption:=false;
  Parent:=TWinControl(AOwner);

  Img:=TImage.Create(Self);
  Img.Stretch:=true;
  Img.Align:=alClient;
  //Img.OnMouseDown:= crtClick;
  Img.Parent:=Self;

  Txt:=TLabel.Create(self);
  Txt.Align:=alClient;
  Txt.Alignment:=taCenter;
  Txt.AlignWithMargins:=true;
  //Txt.Margins.Left:=trunc(10*TForm3.SizeKoof);
  //Txt.Margins.Right:=trunc(10*TForm3.SizeKoof);
  //Txt.Margins.Top:=trunc(10*TForm3.SizeKoof);
  Txt.WordWrap:=true;
  //Txt.OnMouseDown:=crtClick;
  Txt.Parent:=Self;

  Cena:=TLabel.Create(Self);
  Cena.Align:=alClient;
  Cena.Alignment:=taCenter;
  Cena.AlignWithMargins:=true;
  Cena.Font.Color:=clWhite;
  //Cena.Font.Size:=trunc(20*TForm3.SizeKoof);
  //Cena.Margins.Bottom:=trunc(10*TForm3.SizeKoof);
  //Cena.Margins.Left:=trunc(10*TForm3.SizeKoof);
  //Cena.Margins.Right:=trunc(10*TForm3.SizeKoof);
  //Cena.Margins.Top:=trunc(85*TForm3.SizeKoof);
  //Cena.OnMouseDown:=crtClick;
  Cena.Parent:=Self;

  Stop:=TImage.Create(Self);
  Stop.Canvas.Brush.Color:=RGB(47,112,217);
  Stop.Canvas.Rectangle(0,0,32,32);
  //TForm3.cxImageList3.GetBitmap(0,Stop.Picture.Bitmap);
  Stop.Stretch:=true;
  //Stop.Left:=trunc(15*TForm3.SizeKoof);
  Stop.Height:=32;
  Stop.Width:=32;
  Stop.Parent:=Self;
  Stop.Transparent:=true;
  Stop.Visible:=false;
end;

{procedure MyItem.crtClick(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if DemoVer then
 begin
   if dm.Orders_item.RecordCount > 2 then
      begin
        MessageDlg('Вы используете Демо-версию программы!', mtWarning, [mbOk], 0);
        exit;
      end;
 end;

 if Self.Stop.Visible then exit;

 if dm.Current_order.RecordCount = 0 then   // Открываем счет елси не открыт
   fstMain.openCheck;

 if self.FCardType = 1 then
   begin
     fstMain.BtnState(fstMain.Image3,true);
     fstMain.BtnState(fstMain.Image1,true);
     fstMain.PodrazdID:=Self.id;
     fstMain.Menu_items.Filter:=fstMain.Menu_itemsPID.FieldName+' = '+Self.id.ToString;
     fstMain.SrollStep:=0;
     fstMain.paint_menugrid;
   end

 else if fstMain.Menu_items.Locate('ID', Self.id) then
   begin
     if dm.Orders_item.Locate('product', fstMain.Menu_itemsIDPRODUCT.AsInteger, []) and
     (WPort = 0) then
      begin
       dm.Orders_item.Edit;
       dm.Orders_itemKOLVO.AsFloat:=dm.Orders_itemKOLVO.AsFloat + 1;
      end
     else
      begin
       dm.Orders_item.Append;
       dm.Orders_itemIDDOCUMENT.AsString:=dm.Current_orderUID.AsString;
       dm.Orders_itemPRODUCT.AsInteger:=fstMain.Menu_itemsIDPRODUCT.AsInteger;
       dm.Orders_itemCENA_SALES.AsCurrency:=fstMain.Menu_itemsCENA.AsCurrency;
       dm.Orders_itemNAME.AsString:=fstMain.Menu_itemsCAPTION.AsString;
       dm.Orders_itemGROUP_NAME.AsString:=fstMain.Menu_ItemsPid_name.AsString;
       DM.Orders_itemIDPODRAZD.AsInteger:=fstMain.Menu_itemsIDPODRAZD.AsInteger;
       dm.Orders_itemIDCLASSIF.AsInteger:=fstMain.Menu_itemsIDCLASSIF.AsInteger;
       dm.Orders_itemM_OBSLUZH.AsFloat:= fstMain.Menu_itemsOBSLUZH.AsFloat + dm.Current_orderOBSLUZH.AsFloat;
       dm.Orders_itemM_BOBSLUZH.AsBoolean:= (fstMain.Menu_itemsBOBSLUZH.AsInteger=1) and (fstMain.tbPersonUSEOBSLUZH.AsBoolean);
       dm.Orders_itemM_BDISCOUNT.AsBoolean:=(fstMain.tbPersonUSEDISCOUNT.AsBoolean) and (fstMain.Menu_itemsBDISCOUNT.AsInteger=1);
       if fstMain.tbDiscounts.Locate('idclassif',fstMain.Menu_itemsIDCLASSIF.AsInteger, []) then
          dm.Orders_itemDISCOUNT.AsCurrency:=fstMain.tbDiscountsDiscount.AsFloat;
       dm.Orders_itemIDMENU.AsInteger:=fstMain.Menu_itemsID.AsInteger;
       // Добаляет кол-во через панель
       //fmEdit_items.Edit1.Text:=''; fmEdit_items.ShowModal; if fmEdit_items.Edit1.Text <>'' then dm.Orders_itemKOLVO.AsFloat:=StrToFloat(fmEdit_items.Edit1.Text) else
       dm.Orders_itemKOLVO.AsFloat:=1;
      end;

     dm.Orders_item.Post;
     fstMain.SendToDisplay(IntToStr(dm.Orders_itemKOLVO.AsInteger)+' x '+FormatCurr('# ##0.##', dm.Orders_itemCENA_SALES.AsCurrency)+' = '+FormatCurr('# ##0.##', dm.Orders_itemKOLVO.AsFloat * dm.Orders_itemCENA_SALES.AsCurrency),
     'TOTAL: '+FormatCurr('# ##0.##', fstMain.cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0])+'KZT');
   end;

end; }


destructor MyItem.destroy;
begin

  inherited;
end;

procedure MyItem.SetType(AValue: byte);
begin

 FCardType:=AValue;
 if AValue = 0 then
  Self.Visible:=false
 else
  begin
   Self.Visible:=true;
  if AValue = 1 then   //folder
   begin
    //Txt.Font.Size:=trunc(20*TForm3.SizeKoof);
    Txt.Font.Color:=clWhite;
    //Txt.Margins.Bottom:=trunc(10*TForm3.SizeKoof);;
    Cena.Visible:=false;
    Img.Picture.Bitmap:=nil;
    //TForm3.cxImageList1.GetBitmap(0,Img.Picture.Bitmap);
    //Stop.Top:=Self.Height-Stop.Height-trunc(10*TForm3.SizeKoof);
   end
  else
   begin
    //Txt.Font.Size:=trunc(14*TForm3.SizeKoof);
    Txt.Font.Color:=$00C06B5C;
    //Txt.Margins.Bottom:=trunc(55*TForm3.SizeKoof);
    Cena.Visible:=true;
    Img.Picture.Bitmap:=nil;
    //TForm3.cxImageList1.GetBitmap(1,Img.Picture.Bitmap);
    //Stop.Top:=Self.Height-Stop.Height-trunc(10*TForm3.SizeKoof);
   end;
  end;
end;

{$R *.dfm}


end.
