program director;

uses
  Forms,
  dir_mainform in 'dir_mainform.pas' {MainForm},
  kern in 'kern.pas',
  dir_stmissingsreport in 'dir_stmissingsreport.pas' {StMissingsReportForm},
  dep_studentform in 'dep_studentform.pas' {StudentForm},
  dir_mounthmissingsreport in 'dir_mounthmissingsreport.pas' {DepMounthMissingsReportForm},
  dir_selmounthform in 'dir_selmounthform.pas' {SelectMounthForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
