unit uItemStock.View.ItemStock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  uItemStock.Controller.Interfaces, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Menus, System.ImageList, Vcl.ImgList,
  uItemStock.Controller.ControllViewData;

type
  TfrmItemStock = class(TForm)
    dbData: TDBGrid;
    DataPersistent: TDataSource;
    Panel1: TPanel;
    imgClose: TImage;
    sbItem: TSearchBox;
    menuTypeSearch: TPopupMenu;
    Nome1: TMenuItem;
    ipo1: TMenuItem;
    Estado1: TMenuItem;
    Panel2: TPanel;
    Image2: TImage;
    spMenu: TSplitView;
    Label2: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtID: TEdit;
    edtItemName: TEdit;
    edtContainer: TEdit;
    edtType: TEdit;
    edtState: TEdit;
    edtDescription: TEdit;
    btnNew: TButton;
    btnSave: TButton;
    btnCancel: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    procedure imgCloseClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dbDataCellClick(Column: TColumn);
    procedure Nome1Click(Sender: TObject);
    procedure ipo1Click(Sender: TObject);
    procedure Estado1Click(Sender: TObject);
    procedure sbItemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure sbItemChange(Sender: TObject);
  private
    { Private declarations }
    CrudState : Integer;
    TypeSearch  : String;
    ViewData : IViewData;
    procedure FieldControlls(State : Boolean);
    procedure ClerFields;
    procedure CrudExecute;
    procedure ListFields;
    procedure FlexGridTitles;
  public
    { Public declarations }
  end;

var
  frmItemStock: TfrmItemStock;

implementation

uses
  uItemStock.Controller.Classitem;

{$R *.dfm}

procedure TfrmItemStock.btnNewClick(Sender: TObject);
begin
CrudState := 1;
FieldControlls(True);
end;

procedure TfrmItemStock.btnSaveClick(Sender: TObject);
begin
CrudExecute;
FieldControlls(False);
end;

procedure TfrmItemStock.btnEditClick(Sender: TObject);
begin
CrudState := 2;
FieldControlls(True);
end;

procedure TfrmItemStock.btnCancelClick(Sender: TObject);
begin
FieldControlls(False);
end;

procedure TfrmItemStock.btnDeleteClick(Sender: TObject);
begin
CrudState := 3;
 if Application.MessageBox('Deseja Deletar esse Registro?','Item Stock',MB_YESNO+MB_ICONQUESTION) = 6 then begin
  CrudExecute;
 end;
end;

procedure TfrmItemStock.ClerFields;
var
  I: Integer;
begin
 for I := 0 to ComponentCount -1 do begin
 if Components[I] is TEdit then
    (Components[I] as TEdit).Clear;
 end;
end;

procedure TfrmItemStock.CrudExecute;
begin
   case CrudState of
  1:TControllerItem.New.
      Item(edtItemName.Text).
      State(edtState.Text).
      Description(edtDescription.Text).
      Container(StrToInt(edtContainer.Text)).
      TypeItem(edtType.Text).
      Add;

  2:TControllerItem.New.
    ID(StrToInt(edtID.Text)).
    Item(edtItemName.Text).
    State(edtState.Text).
    Description(edtDescription.Text).
    Container(StrToInt(edtContainer.Text)).
    TypeItem(edtType.Text).
    Edit;

  3:TControllerItem.New.
    ID(StrToInt(edtID.Text)).
    Item(edtItemName.Text).
    State(edtState.Text).
    Description(edtDescription.Text).
    Container(StrToInt(edtContainer.Text)).
    TypeItem(edtType.Text).
    Remove;
  end;
  DataPersistent.DataSet.Refresh;
end;

procedure TfrmItemStock.dbDataCellClick(Column: TColumn);
begin
 ListFields;
end;

procedure TfrmItemStock.Estado1Click(Sender: TObject);
begin
TypeSearch := 'STATE';
end;

procedure TfrmItemStock.FieldControlls(State: Boolean);
var I : Integer;
begin
 for I := 0 to ComponentCount -1 do begin

   if (Components[I] is TEdit) and (Components[I].Tag <> 1)  then begin
      (Components[I] as TEdit).Enabled := State;
   end
   else
   if Components[I] is TButton then begin
      if (Components[I] as TButton).Tag = 1 then begin
        (Components[I] as TButton).Enabled := not State;
      end
      else
      begin
        (Components[I] as TButton).Enabled :=  State;
      end;
   end;

 end;
end;

procedure TfrmItemStock.FlexGridTitles;
function MenuWithToInteger : Integer;
begin
  if spMenu.Opened then
   Result := spMenu.Width
  else
    Result := 0;
end;

var  Index, TitleWith  : Integer;
begin
  TitleWith := (Self.Width -  MenuWithToInteger) div 6;

  for Index := 0 to 5 do begin
    dbData.Columns[Index].Width :=  TitleWith;
  end;

end;

procedure TfrmItemStock.FormCreate(Sender: TObject);
begin
ViewData := TControllViewData.Create;
end;

procedure TfrmItemStock.FormShow(Sender: TObject);
begin
 DataPersistent.DataSet := ViewData.GetDataSet;
 FieldControlls(False);
 FlexGridTitles;

end;

procedure TfrmItemStock.Image2Click(Sender: TObject);
begin
 spMenu.Opened := not spMenu.Opened;
 FlexGridTitles;
end;

procedure TfrmItemStock.imgCloseClick(Sender: TObject);
begin
Self.Close;
end;

procedure TfrmItemStock.ipo1Click(Sender: TObject);
begin
TypeSearch := 'TYPES';
end;

procedure TfrmItemStock.ListFields;
begin
 edtID.Text := dbData.DataSource.DataSet.FieldByName('ID').Text;
 edtItemName.Text := dbData.DataSource.DataSet.FieldByName('ITEMNAME').Text;
 edtContainer.Text := dbData.DataSource.DataSet.FieldByName('CONTAINER').Text;
 edtType.Text := dbData.DataSource.DataSet.FieldByName('TYPES').Text;
 edtState.Text := dbData.DataSource.DataSet.FieldByName('STATE').Text;
 edtDescription.Text := dbData.DataSource.DataSet.FieldByName('DESCRIPTION').Text;
end;

procedure TfrmItemStock.Nome1Click(Sender: TObject);
begin
TypeSearch := 'ITEMNAME';
end;

procedure TfrmItemStock.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  const SG = $F012;
begin
 ReleaseCapture;
 Perform(WM_SYSCOMMAND,SG,0);
end;

procedure TfrmItemStock.sbItemChange(Sender: TObject);
begin
 if sbItem.Text = '' then
  ViewData.ListAll;
end;

procedure TfrmItemStock.sbItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then begin
  ViewData.SearchToTName(sbItem.Text,TypeSearch );
  DataPersistent.DataSet.Refresh;
 end;
end;

end.
