unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, Datasnap.DBClient,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.Client, Data.FMTBcd, Data.SqlExpr,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Datasnap.Provider, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1sid: TIntegerField;
    ClientDataSet1sname: TStringField;
    ClientDataSet1sex: TStringField;
    ClientDataSet1sage: TIntegerField;
    FDManager1: TFDManager;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function querySql(sql: string): OleVariant;
  public
  var
    sql: string;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TODO -oSky -c :  2020-09-18 17:11:00
  FDConnection1：连接数据库
  FDQuery1：访问操控数据库
  DataSetProvider1：数据提供者，桥梁
  ClientDataSet1：数据集
  DataSource1：数据源

}
procedure TForm1.FormShow(Sender: TObject);
begin
  sql := 'SELECT * FROM STUDENT';
  ClientDataSet1.Data := querySql(sql);
end;

function TForm1.querySql(sql: string): OleVariant;
begin
  Result := null;
  try
    try
      FDQuery1.close;
      FDQuery1.sql.Clear;
      FDQuery1.sql.Text := sql;
      Result := DataSetProvider1.Data;
    except
      on e: Exception do
      begin
        Result := null;
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    FDQuery1.close;
  end;
end;

end.
