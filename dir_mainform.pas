unit dir_mainform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, Grids, DBGrids, ComCtrls, ExtCtrls, TeeProcs,
  TeEngine, Chart, Series, StdCtrls, ToolWin, Spin;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Connection: TADOConnection;
    ListQuery: TADOQuery;
    ListDataSource: TDataSource;
    StatusBar1: TStatusBar;
    AbiturientsPageControl: TPageControl;
    TabSheet1: TTabSheet;
    ListGrid: TDBGrid;
    Splitter1: TSplitter;
    Chart: TChart;
    Series1: THorizBarSeries;
    MissingsPageControl: TTabSheet;
    MissingsQuery: TADOQuery;
    MissingsDataSource: TDataSource;
    MissingsGrid: TDBGrid;
    StReportBtn: TButton;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MonthComboBox: TComboBox;
    YearEdit: TSpinEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    SortComboBox: TComboBox;
    Label4: TLabel;
    DepComboBox: TComboBox;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    FNameCheckBox: TCheckBox;
    FNameEdit: TEdit;
    MNameCheckBox: TCheckBox;
    MNameEdit: TEdit;
    LNameCheckBox: TCheckBox;
    LNameEdit: TEdit;
    StSearchDataSource: TDataSource;
    StSearchQuery: TADOQuery;
    DBGrid1: TDBGrid;
    DepartmentsReportBtn: TButton;
    TabSheet3: TTabSheet;
    GroupGrid: TDBGrid;
    GroupBox4: TGroupBox;
    Splitter2: TSplitter;
    ParamsGrid: TDBGrid;
    StudentsGrid: TDBGrid;
    Splitter3: TSplitter;
    TabSheet4: TTabSheet;
    WorkersSource: TDataSource;
    WorkersGrid: TDBGrid;
    WorkersQuery: TADOQuery;
    GroupsQuery: TADOQuery;
    StudentsQuery: TADOQuery;
    ParamsQuery: TADOQuery;
    GroupsSource: TDataSource;
    StudentsSource: TDataSource;
    ParamsSource: TDataSource;
    CourseCheckBox: TCheckBox;
    CourseEdit: TSpinEdit;
    SpecCheckBox: TCheckBox;
    SpecComboBox: TComboBox;
    DepCheckBox: TCheckBox;
    DepFilterComboBox: TComboBox;
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListDataSourceDataChange(Sender: TObject; Field: TField);
    procedure SortComboBoxChange(Sender: TObject);
    procedure MonthComboBoxChange(Sender: TObject);
    procedure YearEditChange(Sender: TObject);
    procedure StReportBtnClick(Sender: TObject);
    procedure MissingsDataSourceDataChange(Sender: TObject; Field: TField);
    procedure DepComboBoxChange(Sender: TObject);
    procedure FilterRecords(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DepartmentsReportBtnClick(Sender: TObject);
    procedure GroupsSourceDataChange(Sender: TObject; Field: TField);
    procedure SpecComboBoxChange(Sender: TObject);
    procedure DepFilterComboBoxChange(Sender: TObject);
    procedure CourseEditChange(Sender: TObject);
    procedure CourseCheckBoxClick(Sender: TObject);
    procedure SpecCheckBoxClick(Sender: TObject);
    procedure DepCheckBoxClick(Sender: TObject);
    procedure StudentsGridDblClick(Sender: TObject);
  private
  procedure SortList;
  procedure SortGroups;
  
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses kern, dir_stmissingsreport, dep_studentform, dir_selmounthform,
  dir_mounthmissingsreport;

{$R *.dfm}

procedure TMainForm.SortList;
var
mstr  : string;
depstr: string;

begin
mstr := '';
depstr := '';
if MissingsQuery.Active then
  MissingsQuery.Close;
MissingsQuery.SQL.Clear;
if MonthComboBox.ItemIndex > 0 then
  mstr := ' AND (swm_mounth = '+IntToStr(MonthComboBox.ItemIndex)+')';
if DepComboBox.ItemIndex > 0 then
  depstr := ' AND (gr_depcode = '''+
    TContainer(DepComboBox.Items.Objects[DepComboBox.ItemIndex]).Key+''')';
MissingsQuery.SQL.Add('SELECT gr_Name, gr_pcode, ');
MissingsQuery.SQL.Add('  (SELECT SUM(swm_legal) FROM StWeekMissings, Students');
MissingsQuery.SQL.Add('    WHERE (swm_stcode = st_pcode) AND (st_grcode = gr_pcode) AND (swm_Year = '+
  IntToStr(YearEdit.Value)+')'+mstr+') AS gr_legal,');
MissingsQuery.SQL.Add('  (SELECT SUM(swm_illegal) FROM StWeekMissings, Students');
MissingsQuery.SQL.Add('    WHERE (swm_stcode = st_pcode) AND (st_grcode = gr_pcode) AND (swm_Year = '+
  IntToStr(YearEdit.Value)+')'+mstr+') AS gr_illegal,');
MissingsQuery.SQL.Add('  (SELECT SUM(swm_all) FROM StWeekMissings, Students');
MissingsQuery.SQL.Add('    WHERE (swm_stcode = st_pcode) AND (st_grcode = gr_pcode) AND (swm_Year = '+
  IntToStr(YearEdit.Value)+')'+mstr+') AS gr_all,');
MissingsQuery.SQL.Add('  wk_Name, dp_Name FROM Groups, Workers, Departments ');
MissingsQuery.SQL.Add('  WHERE (gr_Attributes = 0) AND (gr_isZaoch = 0) AND (gr_depcode = dp_pcode) AND (gr_mastercode = wk_pcode)'+depstr);
case sortComboBox.ItemIndex of
  0: MissingsQuery.SQL.Add('  ORDER BY gr_speccode, gr_Name');
  1: MissingsQuery.SQL.Add('  ORDER BY gr_legal DESC');
  2: MissingsQuery.SQL.Add('  ORDER BY gr_illegal DESC');
  3: MissingsQuery.SQL.Add('  ORDER BY gr_all DESC');
end;
MissingsQuery.Open;
end;


procedure TMainForm.SortGroups;
var
filterstr : string;

begin
filterstr := '';
GroupsQuery.Filtered := false;
if CourseCheckBox.Checked then
  begin
  filterstr := '(gr_Course = '+CourseEdit.Text+')';
  end;
if (SpecCheckBox.Checked) and (SpecComboBox.ItemIndex >= 0) then
  begin
  if filterstr <> '' then
  filterstr := filterstr+' and (gr_speccode = '''+
  TContainer(SpecComboBox.Items.Objects[SpecComboBox.ItemIndex]).Key+''')' else
  filterstr := '(gr_speccode = '''+
  TContainer(SpecComboBox.Items.Objects[SpecComboBox.ItemIndex]).Key+''')';
  end;
if (DepCheckBox.Checked) and (DepFilterComboBox.ItemIndex >= 0) then
  begin
  if filterstr <> '' then
  filterstr := filterstr+' and (gr_depcode = '''+
  TContainer(DepFilterComboBox.Items.Objects[DepFilterComboBox.ItemIndex]).Key+''')' else
  filterstr := '(gr_depcode = '''+
  TContainer(DepFilterComboBox.Items.Objects[DepFilterComboBox.ItemIndex]).Key+''')';
  end;
if filterstr <> '' then
  begin
  GroupsQuery.Filter := filterstr;
  GroupsQuery.Filtered := true;
  end;
end;



procedure TMainForm.N2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TMainForm.N4Click(Sender: TObject);
var
updater : string;
lfile   : extended;
rfile   : extended;

begin
lfile := FileInfo(Application.ExeName);
rfile := FileInfo(DIR_REPO);
if (rfile > lfile) then
  begin
  updater := ExtractFilePath(Application.ExeName)+UPD_FILE;
  if (FileExists(updater)) then
    begin
    if (MessageDlg('Обновить программу до более новой версии?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
      begin
      winexec(PChar(updater), SW_SHOWNORMAL);
      Application.Terminate;
      end;
    end
  else
    MessageDlg('Отсутствует утилита обновления '+updater+'!', mtError, [mbOk], 0);
  end
else if (rfile < lfile) then
  begin
  if (MessageDlg('Обновить программу в репозитории до более новой версии?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
    begin
    if CopyFile(PChar(Application.ExeName),PChar(DIR_REPO), false) then
      MessageDlg('Обновление завершено успешно!', mtInformation, [mbOk], 0)
    else
      MessageDlg('Не удалось обновить репозиторий!', mtError, [mbOk], 0);
    end;
  end
else
  begin
    MessageDlg('Программа не нуждается в обновлении!', mtInformation, [mbOk], 0)
  end;
end;


procedure TMainForm.FormCreate(Sender: TObject);
var
path     : string;
tmpquery : TADOQuery;
x        : integer;
cont     : TContainer;

begin
path := ExtractFilePath(Application.ExeName);
Connection.ConnectionString := 'FILE NAME='+path+'connection.udl';
Connection.Open;
ListQuery.Open;
YearEdit.Value := CurrentYear;
MonthComboBox.ItemIndex := 0;
SortComboBox.ItemIndex := 0;
DepComboBox.Items.Clear;
DepComboBox.Items.Add('Все отделения');
GroupsQuery.Open;
tmpquery := TADOQuery.Create(self);
tmpquery.Connection := Connection;
tmpquery.SQL.Add('SELECT * FROM Departments WHERE (dp_isZaoch = 0)');
tmpquery.Open;
if (tmpquery.RecordCount > 0) then
  for x := 1 to tmpquery.RecordCount do
    begin
    tmpquery.RecNo := x;
    cont := TContainer.Create;
    cont.Name := tmpquery.FieldByName('dp_Name').AsString;
    cont.Key := tmpquery.FieldByName('dp_pcode').AsString;
    DepComboBox.Items.AddObject(cont.Name, cont);
    DepFilterComboBox.Items.AddObject(cont.Name, cont);
    end;
tmpquery.Close;
tmpquery.SQL.Clear;
tmpquery.SQL.Add('SELECT sp_Name, sp_pcode FROM Departments, Specialities');
tmpquery.SQL.Add('WHERE (dp_pcode = sp_depcode) AND (dp_isZaoch = 0) ORDER BY sp_Name');
tmpquery.Open;
if (tmpquery.RecordCount > 0) then
  for x := 1 to tmpquery.RecordCount do
    begin
    tmpquery.RecNo := x;
    cont := TContainer.Create;
    cont.Name := tmpquery.FieldByName('sp_Name').AsString;
    cont.Key := tmpquery.FieldByName('sp_pcode').AsString;
    SpecComboBox.Items.AddObject(cont.Name, cont);
    end;
tmpquery.Free;
DepComboBox.ItemIndex := 0;
SortList;
if not StSearchQuery.Active then
  StSearchQuery.Open;
if not WorkersQuery.Active then
  WorkersQuery.Open;
end;

procedure TMainForm.ListDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
// print chart
Chart.Series[0].Clear;
Chart.Title.Text.Clear;
if (ListQuery.Active) and (ListQuery.RecordCount > 0) then
  begin
  Chart.Title.Text.Add(ListQuery.FieldByName('sp_FullKey').AsString+' '+
    ListQuery.FieldByName('sp_Name').AsString);
  Chart.Series[0].Add(ListQuery.FieldByName('ctp_obplan').AsInteger, 'План', $0000FF);
  Chart.Series[0].Add(ListQuery.FieldByName('ctp_obwant').AsInteger, 'Подано заявлений', $0000FF);
  Chart.Series[0].Add(ListQuery.FieldByName('ctp_obreal').AsInteger, 'Планируется зачислить', $0000FF);
  Chart.Series[0].Add(ListQuery.FieldByName('ctp_ocplan').AsInteger, 'План', $00FF00);
  Chart.Series[0].Add(ListQuery.FieldByName('ctp_ocwant').AsInteger, 'Подано заявлений', $00FF00);
  Chart.Series[0].Add(ListQuery.FieldByName('ctp_ocreal').AsInteger, 'Планируется зачислить', $00FF00);
  end;
end;

procedure TMainForm.SortComboBoxChange(Sender: TObject);
begin
if SortComboBox.ItemIndex < 0 then
  SortComboBox.ItemIndex := 0;
SortList;
end;

procedure TMainForm.MonthComboBoxChange(Sender: TObject);
begin
if MonthComboBox.ItemIndex < 0 then
  MonthComboBox.ItemIndex := 0;
SortList;
end;

procedure TMainForm.YearEditChange(Sender: TObject);
begin
SortList;
end;

procedure TMainForm.StReportBtnClick(Sender: TObject);
var
mstr  : string;
pstr  : string;
rep   : TStMissingsReportForm;

begin
mstr := '';
pstr := '';
rep := TStMissingsReportForm.Create(self);

rep.Query.Close;
rep.Query.SQL.Clear;
if MonthComboBox.ItemIndex > 0 then
  begin
  mstr := ' AND (swm_mounth = '+IntToStr(MonthComboBox.ItemIndex)+')';
  pstr := MonthComboBox.Text+' месяц '+YearEdit.Text+'-го года';
  end else
  pstr := YearEdit.Text+'-й год';
rep.Query.SQL.Add('SELECT st_FullName, SUM(swm_legal) AS st_Legal, SUM(swm_illegal) AS st_illegal, SUM(swm_all) AS st_all');
rep.Query.SQL.Add('FROM Students, StWeekMissings');
rep.Query.SQL.Add('WHERE (st_pcode = swm_stcode) AND (st_grcode = '''+
  MissingsQuery.FieldByName('gr_pcode').AsString+
  ''') AND (swm_year = '+
  IntToStr(YearEdit.Value)+')'+mstr);
rep.Query.SQL.Add('GROUP BY st_FullName');
//rep.Query.SQL.Add('ORDER BY st_FullName');
case sortComboBox.ItemIndex of
  0: rep.Query.SQL.Add('  ORDER BY st_FullName');
  1: rep.Query.SQL.Add('  ORDER BY st_legal DESC');
  2: rep.Query.SQL.Add('  ORDER BY st_illegal DESC');
  3: rep.Query.SQL.Add('  ORDER BY st_all DESC');
end;
rep.Query.Open;
rep.DescLabel.Caption := 'По количеству часов, пропущенных студентами группы '+
  MissingsQuery.FieldByName('gr_Name').AsString+' (отделение "'+
  MissingsQuery.FieldByName('dp_Name').AsString+'") за '+pstr+'.'+#$D+
  'Дата генерации отчета - '+DateTimeToStr(Now); 
rep.StMissingsReport.Preview;
rep.Free;
end;

procedure TMainForm.MissingsDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
StReportBtn.Enabled := MissingsQuery.Active and
  (MissingsQuery.RecNo > 0);
end;

procedure TMainForm.DepComboBoxChange(Sender: TObject);
begin
if DepComboBox.ItemIndex < 0 then
  DepComboBox.ItemIndex := 0;
SortList;
end;

procedure TMainForm.FilterRecords(Sender: TObject);
var
fstr     : string;

begin
StSearchQuery.Filtered := false;
fstr := '';
if (FNameCheckBox.Checked) and (trim(FNameEdit.Text) <> '') then
  // filter FName
  fstr := '(st_FName LIKE '''+FNameEdit.Text+'%'')'
  else FNameEdit.Text := '';
if (MNameCheckBox.Checked) and (trim(MNameEdit.Text) <> '') then
  begin
    if (fstr <> '') then
      fstr := fstr + ' AND (st_MName LIKE '''+MNAmeEdit.Text+'%'')' else
      fstr := '(st_MName LIKE '''+MNAmeEdit.Text+'%'')';
  end else
  MNameEdit.Text := '';
if (LNameCheckBox.Checked) and (trim(LNameEdit.Text) <> '') then
  begin
    if (fstr <> '') then
      fstr := fstr + ' AND (st_MName LIKE '''+LNAmeEdit.Text+'%'')' else
      fstr := '(st_MName LIKE '''+LNAmeEdit.Text+'%'')';
  end else
  LNameEdit.Text := '';
if fstr <> '' then
  begin
  StSearchQuery.Filter := fstr;
  StSearchQuery.Filtered := true;
  end;
end;

procedure TMainForm.DBGrid1DblClick(Sender: TObject);
var
form : TStudentForm;
x    : integer;

begin
if StSearchQuery.RecNo > 0 then
  begin
  form := TStudentForm.Create(self);
  form.StudentQuery.SQL.Clear;
  form.StudentQuery.SQL.Add('SELECT * FROM Students WHERE (st_pcode ='''+
    StSearchQuery.FieldByName('st_pcode').AsString+''')');
  form.StudentQuery.Open;
  for x := 0 to form.PageControl.PageCount -1 do
    form.PageControl.Pages[x].Enabled := false;
  form.SHowModal;
  form.Free;
  end;
end;


procedure TMainForm.DepartmentsReportBtnClick(Sender: TObject);
var
form : TSelectMounthForm;
rep  : TDepMounthMissingsReportForm;

begin
form := TSelectMounthForm.Create(self);
if mrOk = form.ShowModal then
  begin
  rep := TDepMounthMissingsReportForm.Create(self);
  rep.Query.SQL.Clear;
  rep.Query.SQL.Add('EXEC GetDepControllerView '+
    IntToStr(Form.MounthComboBox.ItemIndex+1)+', '+
    IntToStr(Form.YearEdit.Value));
  rep.Query.Open;
  rep.DetailLabel.Caption := 'Успеваемости и посещаемости по отделениям за '+
    form.MounthComboBox.Text+' месяц '+form.YearEdit.Text+'-го года (очная форма).';
  rep.Report.PreviewModal;
  rep.Free;
  end;
form.Free;
end;

procedure TMainForm.GroupsSourceDataChange(Sender: TObject; Field: TField);
begin
StudentsQuery.Close;
ParamsQuery.Close;
if GroupsQuery.Active and (GroupsQuery.State = dsBrowse) and (GroupsQuery.RecordCount > 0) then
  begin
  StudentsQuery.SQL.Clear;
  StudentsQuery.SQL.Add('SELECT st_pcode, st_FName, st_MName, st_LName, st_grcode');
  StudentsQuery.SQL.Add('FROM Students WHERE (st_grcode = '''+
    GroupsQuery.FieldByName('gr_pcode').AsString+''') AND (st_Attributes = 0)');
  StudentsQuery.SQL.Add('ORDER BY st_FName, st_MName');
  StudentsQuery.Open;
  ParamsQuery.SQL.Clear;
  ParamsQuery.SQL.Add('EXEC GetGroupParams '''+
    GroupsQuery.FieldByName('gr_pcode').AsString+'''');
  ParamsQuery.Open;    
  end;
end;

procedure TMainForm.SpecComboBoxChange(Sender: TObject);
begin
if SpecComboBox.ItemIndex < 0 then SpecComboBox.ItemIndex := 0;
SortGroups;
end;

procedure TMainForm.DepFilterComboBoxChange(Sender: TObject);
begin
if DepFilterComboBox.ItemIndex < 0 then DepFilterComboBox.ItemIndex := 0;
SortGroups;
end;

procedure TMainForm.CourseEditChange(Sender: TObject);
begin
SortGroups;
end;

procedure TMainForm.CourseCheckBoxClick(Sender: TObject);
begin
SortGroups;
end;

procedure TMainForm.SpecCheckBoxClick(Sender: TObject);
begin
SortGroups;
end;

procedure TMainForm.DepCheckBoxClick(Sender: TObject);
begin
SortGroups;
end;

procedure TMainForm.StudentsGridDblClick(Sender: TObject);
var
form : TStudentForm;
x    : integer;

begin
if StudentsQuery.RecNo > 0 then
  begin
  form := TStudentForm.Create(self);
  form.StudentQuery.SQL.Clear;
  form.StudentQuery.SQL.Add('SELECT * FROM Students WHERE (st_pcode ='''+
    StudentsQuery.FieldByName('st_pcode').AsString+''')');
  form.StudentQuery.Open;
  for x := 0 to form.PageControl.PageCount -1 do
    form.PageControl.Pages[x].Enabled := false;
  form.SHowModal;
  form.Free;
  end;
end;

end.
