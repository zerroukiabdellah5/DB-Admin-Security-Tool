unit UBackupManager;

interface

uses
  System.SysUtils, Vcl.Dialogs;

type
  TDatabaseMaintenance = class
  public
    procedure PerformBackup(DestinationPath: string);
    procedure LogSystemEvent(EventDescription: string);
  end;

implementation

procedure TDatabaseMaintenance.PerformBackup(DestinationPath: string);
begin
  try
    // Logic to execute Oracle EXPDP or SQL Export command
    // Simulating a backup process
    Sleep(2000); 
    ShowMessage('Database Backup Completed to: ' + DestinationPath);
  except
    on E: Exception do
      ShowMessage('Backup Failed: ' + E.Message);
  end;
end;

procedure TDatabaseMaintenance.LogSystemEvent(EventDescription: string);
begin
  // Save event to a text file for auditing
  Writeln('Log: ' + DateTimeToStr(Now) + ' - ' + EventDescription);
end;

end.

