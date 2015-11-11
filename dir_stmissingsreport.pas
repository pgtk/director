unit dir_stmissingsreport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, DB, ADODB, QRCtrls;

type
  TStMissingsReportForm = class(TForm)
    StMissingsReport: TQuickRep;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    Query: TADOQuery;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    DescLabel: TQRLabel;
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StMissingsReportForm: TStMissingsReportForm;

implementation

uses dir_mainform;

{$R *.dfm}

procedure TStMissingsReportForm.QRLabel1Print(sender: TObject;
  var Value: String);
begin
Value := #$D+Value;
end;

procedure TStMissingsReportForm.QRDBText1Print(sender: TObject;
  var Value: String);
begin
Value := ' '+Value;
end;

end.
