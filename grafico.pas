unit grafico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Datasnap.DBClient, Data.DB, Data.DBXMSSQL, Data.SqlExpr,
  FireDAC.Phys.MSSQLDef, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, Data.FMTBcd, Vcl.ExtCtrls, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.TeeData,
  Data.Win.ADODB;

type
  TForm6 = class(TForm)
    ChartDataSet1: TChartDataSet;
    Chart1: TChart;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Series2: TBarSeries;
    TPanel1: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);


  private

    { Private declarations }
  public
    { Public declarations }

  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}



{ TForm6 }

procedure TForm6.FormCreate(Sender: TObject);
var
   Labels : TLabelsList;
   Days :  TArray<String>;
   ValuesCte : TArray<Double>;
begin
  try
    ADOConnection1.ConnectionString :=
      'Provider=SQLNCLI11.1;' +
      'Data Source=;' +
      'Initial Catalog=;' +
      'User Id=;' +
      'Password=;';

    ADOQuery1.SQL.Text := ' '+
    'FROM T_CONHECIMENTO '+
    'WHERE MONTH(CON_DATAEMISSAO) = 12 AND CON_VALORFRETE != 0 '+
    'GROUP BY CON_DATAEMISSAO '+
    'ORDER BY CON_DATAEMISSAO';

    ADOQuery1.Open;

    Labels := TLabelsList.Create;
    Days := [];
    ValuesCte := [];

    while not ADOQuery1.Eof do
    begin
      Series2.Add(
        ADOQuery1.FieldByName('valor').asFloat,
        ADOQuery1.FieldByName('data').AsString,
        991059000
      );

      ADOQuery1.Next;
    end;



  except
    on E: Exception do
      ShowMessage('Erro ao executar a consulta: ' + E.Message);
  end;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
  Panel2.Height := Form6.Height;
  Panel2.Width := Form6.Width;
end;

end.
