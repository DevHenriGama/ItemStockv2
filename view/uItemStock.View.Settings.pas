unit uItemStock.View.Settings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, uItemStock.Controller.Interfaces,
  uItemStock.Controller.Settings, uItemStock.view.Main, uRESTDWBase,
  IdBaseComponent, IdComponent, IdIPWatch;


type

  TfrmSettings = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    Image1: TImage;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ckAPIAuto: TCheckBox;
    ckStartOnSys: TCheckBox;
    ckStartMin: TCheckBox;
    btnAPI: TButton;
    edtPort: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblIPAddress: TLabel;
    Image2: TImage;
    Image3: TImage;
    IDConnWatch: TIdIPWatch;
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure btnAPIClick(Sender: TObject);
    procedure lblIPAddressClick(Sender: TObject);
  private
    { Private declarations }
    FCONT_Settings : IControllSettings;
    FMainForm : TfrmMain;
    FMainPooler : TRestsERVICEPooler;
    procedure LoadSettings;
    procedure SaveSettings;
    procedure FieldModify(State : Boolean);
    procedure SetPoolerInfo;
    function GetLocalIP : String;
  public
    { Public declarations }
    procedure OpenForm(Pooler : TRESTServicePooler);
  end;

var
  frmSettings: TfrmSettings;

implementation
uses ShellAPI;

{$R *.dfm}

procedure TfrmSettings.btnAPIClick(Sender: TObject);
begin
  FMainPooler.Active := not FMainPooler.Active;
  SetPoolerInfo;
end;

procedure TfrmSettings.Button3Click(Sender: TObject);
begin
SaveSettings;
end;


procedure TfrmSettings.SetPoolerInfo;
begin
 if FMainPooler.Active then begin
   btnAPI.Caption := 'Desativar';
   lblIPAddress.Caption :=  GetLocalIP +
    IntToStr(FMainPooler.ServicePort) + '/status';
 end
 else
 begin
    lblIPAddress.Caption := '0.0.0.0';
   btnAPI.Caption := 'Ativar';
 end;
end;

procedure TfrmSettings.FieldModify(State: Boolean);
begin

end;

procedure TfrmSettings.FormCreate(Sender: TObject);
begin
 FCONT_Settings := TControllSettings.Create;
end;

procedure TfrmSettings.FormShow(Sender: TObject);
begin
 LoadSettings;
 SetPoolerInfo;
end;

function TfrmSettings.GetLocalIP: String;
begin
Result := IDConnWatch.LocalIP;
end;

procedure TfrmSettings.Image1Click(Sender: TObject);
begin
Self.Close;
end;

procedure TfrmSettings.Image3Click(Sender: TObject);
begin
  if FMainPooler.Active then begin
          Application.MessageBox('Desligue o Serviço de API para Altera-lo',
  'ItemStock',MB_OK+MB_ICONEXCLAMATION);
  end
  else
  begin
   SaveSettings;
  end;
end;

procedure TfrmSettings.lblIPAddressClick(Sender: TObject);
var formalIP : String;
begin
  formalIP := 'http://'+GetLocalIP+':'+IntToStr(FMainPooler.ServicePort)+'/status';
 ShellExecute(handle,'open',
  pchar(formalIP),0,0,0);
end;

procedure TfrmSettings.LoadSettings;
begin
 with FCONT_Settings do begin
   ckAPIAuto.Checked := GetAutoStartAPI;
   ckStartOnSys.Checked := GetStartOnSys;
   ckStartMin.Checked := GetStartMinimized;
   edtPort.Text := GetPortAPI;
 end;
end;

procedure TfrmSettings.OpenForm(Pooler: TRESTServicePooler);
begin
  FMainPooler := Pooler;
  Self.ShowModal;
end;

procedure TfrmSettings.SaveSettings;
begin
 try
    with FCONT_Settings do begin
   SetPortAPI(edtPort.Text);
   SetStarOnSys(ckStartOnSys.Checked);
   SetStartMinimized(ckStartMin.Checked);
   SetAutoStartAPI(ckAPIAuto.Checked);
 end;
  Application.MessageBox('Configurações Salvas com Sucesso',
  'ItemStock',MB_OK+MB_ICONASTERISK);
 except

 end;
end;


end.
