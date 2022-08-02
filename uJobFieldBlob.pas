unit uJobFieldBlob;
interface
uses jpeg, Classes, Graphics, DB, SysUtils;
  function GetStreamImgType(Stream: TStream): TClass;
  procedure LoadProperImage(Stream: TStream; Picture: TPicture);
  function LoadPictureFromBLOB(Picture: TPicture; Field: TBlobField): boolean;
  procedure SavePictureToBlob(Picture: TPicture; Field: TBlobField);
implementation
function GetStreamImgType(Stream: TStream): TClass;
var
  StreamPos: int64;
  ImgSign: string;
begin
  StreamPos := Stream.Position;
  try
    //BMP если не определено
    Result := Graphics.TBitmap;
    //JPEG
    SetLength(ImgSign, 4);
    Stream.Seek(6, soFromCurrent);
    Stream.Read(ImgSign[1],4);
    if (UpperCase(ImgSign) = 'JFIF') or (UpperCase(ImgSign) = 'EXIF') then
      Result := Jpeg.TJPEGImage;
    //WMF
    Stream.Position := StreamPos;
    SetLength(ImgSign, 4);
    Stream.Read(ImgSign[1],4);
    if ImgSign = #$D7#$CD#$C6#$9A then
      Result := Graphics.TMetafile;
  finally
    Stream.Position := StreamPos;
  end;
end;
procedure LoadProperImage(Stream: TStream; Picture: TPicture);
var
  Img: TGraphic;
  StreamPos: int64;
begin
  StreamPos := Stream.Position;
  Img := TGraphicClass(GetStreamImgType(Stream)).Create;
  try
    Stream.Position := StreamPos;
    Img.LoadFromStream(Stream);
    Picture.Graphic := Img;
  finally
    Img.Free;
  end;
end;
function LoadPictureFromBLOB(Picture: TPicture; Field: TBlobField): boolean;
var
  Stream: TStream;
begin
  Result := False;
  if not Field.isNULL then
  begin
    Stream := TMemoryStream.Create;
    try
      Field.SaveToStream(Stream);
      Stream.Position := 0;
      LoadProperImage(Stream, Picture);
      Result := True;
    finally
      Stream.Free;
    end;
  end;
end;
procedure SavePictureToBlob(Picture: TPicture; Field: TBlobField);
var
  Stream: TStream;
begin
  if not (Field.DataSet.State in [dsEdit, dsInsert]) then
    Field.DataSet.Edit;
  Field.Clear;
  if Assigned(Picture.Graphic) then
    if not Picture.Graphic.Empty then
      begin
        Stream := TMemoryStream.Create;
        try
          Picture.Graphic.SaveToStream(Stream);
          Stream.Position := 0;
          Field.LoadFromStream(Stream);
        finally
          Stream.Free;
        end;
      end;
end;
end.
