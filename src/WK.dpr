program WK;

uses
  Vcl.Forms,
  Main in 'Main.pas' {FormMain},
  DataService_Impl in 'DataService_Impl.pas' {DataService: TDataModule},
  OrderList in 'OrderList.pas' {FormOrderList};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataService, DataService);
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;

end.
