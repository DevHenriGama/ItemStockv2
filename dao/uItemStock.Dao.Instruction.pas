unit uItemStock.Dao.Instruction;

interface

uses
  uItemStock.Model.ClassItem, uItemStock.Dao.Interfaces,FireDAC.Comp.Client,
  uItemStock.Dao.DataModule, System.JSON;

type
   TDaoIntructions = class(TInterfacedObject,IDaoInstruction)

   private
      FItens : TItem;
      FQuery : TFDQuery;
      MyConnection : TFDConnection;
      _data : TdmDados;
   public
      constructor Create;overload;
     constructor Create(MyIten  :TItem);overload;
     destructor Destroy; override;
     class function NewInstruction( MyClassItem : TItem) : IDaoInstruction;
     procedure InsertItem;
     procedure UpdateItem;
     procedure DeleteItem;
     procedure  SerchInDatabase(_Value , SB_By : String);
     function SearchBY(_Value , Column : String) : TJSONObject;
     procedure ListAll;
     function PersitentData : TFDQuery;
   end;

implementation

uses
  System.SysUtils;



{ TDaoIntructions }

constructor TDaoIntructions.Create(MyIten  :TItem);
begin
     FItens := MyIten;
    FQuery := TFDQuery.Create(nil);
    _data := TdmDados.Create(nil);
     MyConnection := _data.Connection;
     FQuery.Connection := MyConnection;
end;

constructor TDaoIntructions.Create;
begin
      FQuery := TFDQuery.Create(nil);
    _data := TdmDados.Create(nil);
     MyConnection := _data.Connection;
     FQuery.Connection := MyConnection;
end;

procedure TDaoIntructions.DeleteItem;
begin
  with FQuery do begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM ITENS WHERE ID = :id');
    ParamByName('id').AsInteger := FItens.ID;
    ExecSQL;
  end;
end;

destructor TDaoIntructions.Destroy;
begin
    MyConnection.Free;
   FQuery.Free;
   _data.Free;
  inherited;
end;

procedure TDaoIntructions.InsertItem;
begin
  with FQuery do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO ITENS (ITEMNAME, STATE, DESCRIPTION, TYPES, CONTAINER, PATH) ' +
      'VALUES (:name, :state, :des , :type , :cont , :path)');
    with FItens do begin
      ParamByName('name').AsString := Item;
      ParamByName('state').AsString := State;
      ParamByName('des').AsString := Description;
      ParamByName('type').AsString := TypeItem;
      ParamByName('cont').AsInteger :=  Container;
      ParamByName('path').AsString := PicturePath;
    end;
    ExecSQL;
  end;
end;

procedure TDaoIntructions.ListAll;
begin
 with FQuery do begin
   Close;
   SQL.Clear;
   SQL.Add('SELECT * FROM ITENS');
   Open;
 end;
end;

class function TDaoIntructions.NewInstruction(
  MyClassItem: TItem): IDaoInstruction;
begin
  Result := TDaoIntructions.Create(MyClassItem);
end;


function TDaoIntructions.PersitentData: TFDQuery;
begin
 if FQuery.SQL.Text = '' then begin
  with FQuery do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM ITENS');
    Open;
  end;
 end;
 Result := FQuery;
end;

function TDaoIntructions.SearchBY(_Value, Column: String): TJSONObject;
var jObject,JObj : TJSONObject;
  I: Integer;
begin
jObject := TJSONObject.Create;
 with FQuery do begin
   Close;
   SQL.Clear;
   SQL.Add('SELECT '+Column+' FROM ITENS WHERE ' +Column
    +' LIKE '+QuotedStr('%'+_Value+'%'));
    ExecSQL;
    if RecordCount > 0 then begin
       jObj := TJSONObject.Create;
      for I := 0 to RecordCount-1 do begin

      end;
      jObj.Free;
    end;
 end;

jObject.Free;
end;

procedure TDaoIntructions.SerchInDatabase(_Value, SB_By: String);
var FType : String;
begin
 FType := SB_By;

 if SB_By = '' then begin
    FType := 'ITEMNAME';
 end;

 with FQuery do begin
   Close;
   SQL.Clear;
   SQL.Add('SELECT * FROM ITENS WHERE ' + FType + ' LIKE  '+ QuotedStr('%' + _Value + '%'));
   Open;
 end;
end;

procedure TDaoIntructions.UpdateItem;
begin
  with FQuery do begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE ITENS  SET ITEMNAME = :name, STATE = :state, ' +
      ' DESCRIPTION = :desc ,TYPES = :type,  CONTAINER = :cont, PATH = :path '+
      'WHERE ID = :id');
    with FItens do begin
      ParamByName('id').AsInteger := ID;
      ParamByName('name').AsString := Item;
      ParamByName('state').AsString := State;
      ParamByName('desc').AsString := Description;
      ParamByName('type').AsString := TypeItem;
      ParamByName('cont').AsInteger :=  Container;
      ParamByName('path').AsString := PicturePath;
    end;
    ExecSQL;
  end;
end;

end.
