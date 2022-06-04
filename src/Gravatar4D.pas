unit Gravatar4D;

interface

uses
  System.SysUtils,
  System.Classes,
  System.TypInfo,
  Vcl.Graphics,
  IdUri,
  IdHttp,
  IdSSLOpenSSL,
  Vcl.Dialogs,
  Vcl.Imaging.pngimage,
  IdHashMessageDigest, IdComponent;

type

  TGravatarRating = (grG, grPG, grR, grX);
  TGravatarDeafult = (gdNone, gdUrlImage, gd404, gdmp, gdidenticon, gdmonsterid, gdwavatar, gdretro,
    gdrobohash, gdblank);

  TGravatar4D = class

  private
    FEmail: string;
    FGravatarRating: TGravatarRating;
    FSize: Smallint;

    function DownloadImage(const Url: string): TPicture;

  public
    constructor Create;

    function EmailToMD5(const Value: string): string;

    function GenerateUrl(const Email: string; const Size: Smallint = 0; const GravatarRating: TGravatarRating = grG;
      const GravatarDeafult: TGravatarDeafult = gdNone; const URLDefaultImage: string = ''): string;

    function GravatarImage(const Email: string): TPicture; overload;

    function GravatarImage(const Email: string; const Size: Smallint): TPicture; overload;

    function GravatarImage(const Email: string; const Size: Smallint; const GravatarRating: TGravatarRating = grG;
      const GravatarDeafult: TGravatarDeafult = gdNone; const URLDefaultImage: string = ''): TPicture; overload;
  end;

const
  URL_BASE: string = 'http://www.gravatar.com/avatar/';

implementation

{ TGravatar4D }

constructor TGravatar4D.Create;
begin
  FGravatarRating := grG;
end;

function TGravatar4D.DownloadImage(const Url: string): TPicture;
var
  Http: TIdHttp;
  MS: TMemoryStream;
  png: TPngImage;
begin
  MS := TMemoryStream.Create;

  Http := TIdHttp.Create(nil);
  png := TPngImage.Create;
  Result := TPicture.Create;

  try
    Http.Get(Url, MS);

    if MS.Size > 0 then
    begin

      MS.Position := 0;
      png.LoadFromStream(MS);
      Result.Bitmap.Assign(png);
    end;

  finally
    FreeAndNil(Http);
    FreeAndNil(MS);
    FreeAndNil(png);

  end;
end;

function TGravatar4D.EmailToMD5(const Value: string): string;
var
  md5: TIdHashMessageDigest5;
begin
  md5 := TIdHashMessageDigest5.Create;
  try
    Result := LowerCase(md5.HashStringAsHex(Value));
  finally
    md5.Free;
  end;
end;

function TGravatar4D.GenerateUrl(const Email: string; const Size: Smallint; const GravatarRating: TGravatarRating;
  const GravatarDeafult: TGravatarDeafult; const URLDefaultImage: string): string;
var
  sb: TStringBuilder;
  d: string;
begin
  sb := TStringBuilder.Create;

  try
    sb.Append(URL_BASE);
    sb.Append(EmailToMD5(Email));

    sb.Append('?r=' + LowerCase(Trim(Copy(GetEnumName(TypeInfo(TGravatarRating), Integer(GravatarRating)), 3, 5))));

    if Size > 0 then
      sb.Append('&s=' + Size.ToString);

    case GravatarDeafult of
      gdNone:
        d := '';
      gdUrlImage:
        begin
          if URLDefaultImage <> '' then
            d := TIdURI.URLEncode(URLDefaultImage)
          else
            d := '';
        end
    else
      begin
        d := LowerCase(Trim(Copy(GetEnumName(TypeInfo(TGravatarDeafult), Integer(GravatarDeafult)), 3, 20)));
      end;

    end;

    if d <> '' then
      sb.Append('&d=' + d);

    Result := sb.ToString;
  finally
    FreeAndNil(sb);
  end;

end;

function TGravatar4D.GravatarImage(const Email: string; const Size: Smallint): TPicture;
begin
  Result := GravatarImage(Email, Size, grG);
end;

function TGravatar4D.GravatarImage(const Email: string): TPicture;
begin
  Result := GravatarImage(Email, 80, grG);
end;

function TGravatar4D.GravatarImage(const Email: string; const Size: Smallint; const GravatarRating: TGravatarRating;
  const GravatarDeafult: TGravatarDeafult; const URLDefaultImage: string): TPicture;
begin
  Result := DownloadImage(GenerateUrl(Email, Size, GravatarRating, GravatarDeafult, URLDefaultImage));
end;

end.
