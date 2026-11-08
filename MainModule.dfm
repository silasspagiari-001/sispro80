object mm: Tmm
  OnCreate = UniGUIMainModuleCreate
  OnDestroy = UniGUIMainModuleDestroy
  BackButtonAction = bbaWarnUser
  Theme = 'triton.modified'
  TouchTheme = 'material'
  MonitoredKeys.Enabled = True
  MonitoredKeys.KeyEnableAll = True
  MonitoredKeys.Keys = <>
  EnableSynchronousOperations = True
  ConstrainForms = True
  OnSessionTimeout = UniGUIMainModuleSessionTimeout
  OnBeforeLogin = UniGUIMainModuleBeforeLogin
  OnBrowserClose = UniGUIMainModuleBrowserClose
  Height = 577
  Width = 941
  object SQLConn: TFDConnection
    Params.Strings = (
      'Port=3050'
      'CharacterSet=WIN1252'
      'Protocol=TCPIP'
      'Server=127.0.0.1'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Database=C:\Sispro_80\files\database\RC_DB.FDB'
      'DriverID=FB')
    FetchOptions.AssignedValues = [evMode, evItems, evRowsetSize, evRecordCountMode]
    FetchOptions.RowsetSize = 25
    FetchOptions.Items = [fiBlobs, fiDetails]
    FormatOptions.AssignedValues = [fvSE2Null, fvStrsTrim, fvFmtDisplayDateTime, fvFmtDisplayDate, fvFmtDisplayTime, fvFmtDisplayNumeric, fvFmtEditNumeric, fvStrsTrim2Len]
    FormatOptions.StrsTrim = False
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    TxOptions.Isolation = xiReadCommitted
    ConnectedStoredUsage = [auRunTime]
    LoginPrompt = False
    OnRecover = SQLConnRecover
    Left = 77
    Top = 37
  end
  object FDTransaction: TFDTransaction
    Connection = SQLConn
    Left = 200
    Top = 32
  end
end
