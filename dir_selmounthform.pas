unit dir_selmounthform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TSelectMounthForm = class(TForm)
    OkBtn: TButton;
    CancelBtn: TButton;
    Label1: TLabel;
    MounthComboBox: TComboBox;
    Label2: TLabel;
    YearEdit: TSpinEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectMounthForm: TSelectMounthForm;

implementation

{$R *.dfm}

procedure TSelectMounthForm.FormCreate(Sender: TObject);
var
y, m, d : word;

begin
decodedate(now,y,m,d);
YearEdit.Value := y;
MounthComboBox.ItemIndex := m-2;
if MounthComboBox.ItemIndex < 0 then
  MounthComboBox.ItemIndex := MounthComboBox.Items.Count - 1;
end;

end.
