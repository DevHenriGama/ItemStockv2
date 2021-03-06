unit uItemStock.Controll.APISource;

interface

uses
  System.SysUtils, System.Classes,UDWDataModule, uDWAbout, uRESTDWServerEvents,
  uDWJSONObject, uItemStock.Controller.Interfaces,uItemStock.Controller.ClassStock;

type
  TApiData = class(TServerMethodDataModule)
    EventsMain: TDWServerEvents;
    procedure EventsMainEventsstatusReplyEvent(var Params: TDWParams;
      var Result: string);
    procedure ServerMethodDataModuleCreate(Sender: TObject);
    procedure EventsMainEventsnewReplyEvent(var Params: TDWParams;
      var Result: string);
    procedure EventsMainEventseditReplyEvent(var Params: TDWParams;
      var Result: string);
    procedure EventsMainEventsdeleteReplyEvent(var Params: TDWParams;
      var Result: string);
  private
    { Private declarations }
    IStock : IControllerStock;
  public
    { Public declarations }

  end;

var
  ApiData: TApiData;

implementation

uses System.JSON;

{%CLASSGROUP 'Vcl.Controls.TControl'}


{$R *.dfm}

procedure TApiData.EventsMainEventsdeleteReplyEvent(var Params: TDWParams;
  var Result: string);
  var jObject : TJSONObject;
begin

  jObject := TJSONObject.Create;
 try
   IStock.
   StockItem.
    ID(Params[0].Value).
    Remove;
    jObject.AddPair('request_status','ok');
 except
    jObject.AddPair('request_status','erro');
 end;
 Result := jObject.ToString;
 jObject.Free;
end;

procedure TApiData.EventsMainEventseditReplyEvent(var Params: TDWParams;
  var Result: string);
  var jObject : TJSONObject;
begin

  jObject := TJSONObject.Create;
 try
   IStock.
   StockItem.
    ID(Params[0].Value).
    Item(Params[1].Value).
    State(Params[2].Value).
    Description(Params[3].Value).
    Container(Params[4].Value).
    TypeItem(Params[5].Value).
    edit;
    jObject.AddPair('request_status','ok');
 except
    jObject.AddPair('request_status','erro');
 end;
 Result := jObject.ToString;
 jObject.Free;
end;

procedure TApiData.EventsMainEventsnewReplyEvent(var Params: TDWParams;
  var Result: string);
  var jObject : TJSONObject;
begin

  jObject := TJSONObject.Create;
 try
   IStock.
   StockItem.
    ID(0).
    Item(Params[0].Value).
    State(Params[1].Value).
    Description(Params[2].Value).
    Container(Params[3].Value).
    TypeItem(Params[4].Value).
    Add;
    jObject.AddPair('request_status','ok');
 except
    jObject.AddPair('request_status','erro');
 end;
 Result := jObject.ToString;
 jObject.Free;
end;

procedure TApiData.EventsMainEventsstatusReplyEvent(var Params: TDWParams;
  var Result: string);
begin
 Result := '{"status":OK}';
end;

procedure TApiData.ServerMethodDataModuleCreate(Sender: TObject);
begin
IStock := TControllerStock.Create;
end;

end.
