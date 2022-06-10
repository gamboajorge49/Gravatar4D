unit ufrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Samples.Spin, Gravatar4D, System.Types, System.TypInfo;

type
  TForm1 = class(TForm)
    pnlMain: TPanel;
    GroupBox1: TGroupBox;
    Image1: TImage;
    lbEmail: TLabeledEdit;
    btnGererate: TButton;
    CheckBox1: TCheckBox;
    chStretch: TCheckBox;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    cbDefault: TComboBox;
    cbRating: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    leDefault: TLabeledEdit;
    procedure CheckBox1Click(Sender: TObject);
    procedure chStretchClick(Sender: TObject);
    procedure btnGererateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbDefaultChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnGererateClick(Sender: TObject);
var
  G: TGravatar4D;
  image: TPicture;
begin
  G := TGravatar4D.Create;
  try
    image := G.GravatarImage(lbEmail.Text, SpinEdit1.Value, TGravatarRating(cbRating.ItemIndex),
      TGravatarDeafult(cbDefault.ItemIndex), leDefault.Text);
    Image1.Picture.Assign(image);

  finally
    FreeAndNil(image);
    FreeAndNil(G);
  end;
end;

procedure TForm1.cbDefaultChange(Sender: TObject);
begin
  leDefault.Enabled := (TGravatarDeafult(cbDefault.ItemIndex) = gdUrlImage);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  Image1.Center := CheckBox1.Checked;
  Image1.Update;
  Application.ProcessMessages;
end;

procedure TForm1.chStretchClick(Sender: TObject);
begin
  Image1.Stretch := chStretch.Checked;
  Image1.Update;
  Application.ProcessMessages;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  d: TGravatarDeafult;
  r: TGravatarRating;
begin
  for d := Low(TGravatarDeafult) to High(TGravatarDeafult) do
    cbDefault.Items.Add(GetEnumName(TypeInfo(TGravatarDeafult), Integer(d)));
  cbDefault.ItemIndex := 0;

  for r := Low(TGravatarRating) to High(TGravatarRating) do
    cbRating.Items.Add(GetEnumName(TypeInfo(TGravatarRating), Integer(r)));
  cbRating.ItemIndex := 0;

end;

end.
