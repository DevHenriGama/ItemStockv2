unit uItemStock.View.Main;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.WinXCtrls, uItemStock.View.ItemStock, Vcl.Imaging.jpeg,
  uDWAbout, uRESTDWBase;
type
  TfrmMain = class(TForm)
    pnlTop: TPanel;
    btnClose: TImage;
    lblTitle: TLabel;
    pnlBottom: TPanel;
    Image1: TImage;
    spMenu: TSplitView;
    Image2: TImage;
    pnlMenu: TPanel;
    pnlSettings: TPanel;
    pnlStock: TPanel;
    Image3: TImage;
    spindicator: TShape;
    Image4: TImage;
    Image5: TImage;
    lblDateTime: TLabel;
    logo: TImage;
    ServicePooler: TRESTServicePooler;
    procedure btnCloseClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure pnlStockMouseEnter(Sender: TObject);
    procedure pnlStockMouseLeave(Sender: TObject);
    procedure pnlSettingsMouseEnter(Sender: TObject);
    procedure pnlSettingsMouseLeave(Sender: TObject);
    procedure pnlStockClick(Sender: TObject);
    procedure pnlSettingsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblTitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Clock : TTimer;
    procedure ShowDateAndTime(Sender : TObject);
    procedure ButtonFx(out Button : TPanel);
    procedure SetIndicator(out Button : TPanel);
    procedure LoadSettings;
  public
    { Public declarations }
  end;
var
  frmMain: TfrmMain;
implementation
{$R *.dfm}

uses uItemStock.Controll.APISource, uItemStock.View.Settings,
  uItemStock.Controller.Interfaces, uItemStock.Controller.Settings;
procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
Self.Close;
end;
procedure TfrmMain.Button1Click(Sender: TObject);
begin
ServicePooler.Active := True;
end;

procedure TfrmMain.ButtonFx(out Button: TPanel);
begin
  with Button do begin
    if Color = clBtnFace then
      Color := clGrayText
    else
      Color := clGrayText;
  end;
end;
procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Clock.Free;
end;
procedure TfrmMain.FormCreate(Sender: TObject);
begin
ReportMemoryLeaksOnShutdown := True;
ServicePooler.ServerMethodClass := TApiData;
Clock := TTimer.Create(nil);
end;
procedure TfrmMain.FormShow(Sender: TObject);
begin
SetIndicator(pnlStock);
Clock.OnTimer := ShowDateAndTime;
LoadSettings;
end;
procedure TfrmMain.Image2Click(Sender: TObject);
begin
spMenu.Opened := not spMenu.Opened;
end;
procedure TfrmMain.lblTitleMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const SG = $F012;
begin
 ReleaseCapture;
 Perform(WM_SYSCOMMAND,SG,0);
end;
procedure TfrmMain.LoadSettings;
var ICtrlSet : IControllSettings;
begin
 ICtrlSet := TControllSettings.Create;
 ServicePooler.ServicePort := StrToInt(ICtrlSet.GetPortAPI);
 ServicePooler.Active := ICtrlSet.GetAutoStartAPI;
end;

procedure TfrmMain.pnlSettingsClick(Sender: TObject);
var SettingView : TfrmSettings;
begin
SetIndicator(pnlSettings);
 try
  SettingView := TfrmSettings.Create(nil);
  SettingView.OpenForm(ServicePooler);
 finally
  SettingView.Free;
 end;
end;
procedure TfrmMain.pnlSettingsMouseEnter(Sender: TObject);
begin
ButtonFx(pnlSettings);
end;
procedure TfrmMain.pnlSettingsMouseLeave(Sender: TObject);
begin
ButtonFx(pnlSettings);
end;
procedure TfrmMain.pnlStockClick(Sender: TObject);
begin
SetIndicator(pnlStock);
 try
  frmItemStock := TfrmItemStock.create(nil);
  frmItemStock.ShowModal;
 finally
   frmItemStock.Free;
 end;
end;
procedure TfrmMain.pnlStockMouseEnter(Sender: TObject);
begin
ButtonFx(pnlStock);
end;
procedure TfrmMain.pnlStockMouseLeave(Sender: TObject);
begin
ButtonFx(pnlStock);
end;
procedure TfrmMain.SetIndicator(out Button: TPanel);
begin
 spindicator.Top := Button.Top;
 spindicator.Left := 0;
end;
procedure TfrmMain.ShowDateAndTime(Sender: TObject);
begin
 lblDateTime.Caption :=
    FormatDateTime('hh:mm',Time) +
        #13#10 + FormatDateTime('dd/mm/yyyy',Date);
end;
end.
