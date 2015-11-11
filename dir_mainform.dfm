object MainForm: TMainForm
  Left = 269
  Top = 117
  Width = 961
  Height = 585
  Caption = #1052#1086#1076#1091#1083#1100' '#1076#1080#1088#1077#1082#1090#1086#1088#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 520
    Width = 953
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object AbiturientsPageControl: TPageControl
    Left = 0
    Top = 0
    Width = 953
    Height = 520
    ActivePage = MissingsPageControl
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    object MissingsPageControl: TTabSheet
      Caption = #1055#1088#1086#1087#1091#1089#1082#1080
      ImageIndex = 1
      DesignSize = (
        945
        492)
      object MissingsGrid: TDBGrid
        Left = 0
        Top = 52
        Width = 945
        Height = 398
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = MissingsDataSource
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'gr_Name'
            Title.Caption = #1043#1088#1091#1087#1087#1072
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'wk_Name'
            Title.Caption = #1050#1083#1072#1089#1089#1085#1099#1081' '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
            Width = 204
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dp_Name'
            Title.Caption = #1054#1090#1076#1077#1083#1077#1085#1080#1077
            Width = 217
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'gr_legal'
            Title.Caption = #1059#1074#1072#1078#1080#1090#1077#1083#1100#1085#1086
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'gr_illegal'
            Title.Caption = #1053#1077#1091#1074#1072#1078#1080#1090#1077#1083#1100#1085#1086
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'gr_all'
            Title.Caption = #1042#1089#1077#1075#1086
            Width = 78
            Visible = True
          end>
      end
      object StReportBtn: TButton
        Left = 0
        Top = 459
        Width = 121
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1075#1088#1091#1087#1087#1077
        TabOrder = 1
        OnClick = StReportBtnClick
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 945
        Height = 52
        ButtonHeight = 48
        Caption = 'ToolBar1'
        TabOrder = 2
        DesignSize = (
          945
          50)
        object GroupBox1: TGroupBox
          Left = 0
          Top = 2
          Width = 583
          Height = 48
          Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
          TabOrder = 0
          object Label1: TLabel
            Left = 4
            Top = 21
            Width = 33
            Height = 13
            Caption = #1052#1077#1089#1103#1094
          end
          object Label2: TLabel
            Left = 197
            Top = 20
            Width = 18
            Height = 13
            Caption = #1043#1086#1076
          end
          object Label4: TLabel
            Left = 280
            Top = 20
            Width = 55
            Height = 13
            Caption = #1054#1090#1076#1077#1083#1077#1085#1080#1077
          end
          object MonthComboBox: TComboBox
            Left = 51
            Top = 14
            Width = 131
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            OnChange = MonthComboBoxChange
            Items.Strings = (
              #1042#1089#1077
              #1071#1085#1074#1072#1088#1100
              #1060#1077#1074#1088#1072#1083#1100
              #1052#1072#1088#1090
              #1040#1087#1088#1077#1083#1100
              #1052#1072#1081
              #1048#1102#1085#1100
              #1048#1102#1083#1100
              #1040#1074#1075#1091#1089#1090
              #1057#1077#1085#1090#1103#1073#1088#1100
              #1054#1082#1090#1103#1073#1088#1100
              #1053#1086#1103#1073#1088#1100
              #1044#1077#1082#1072#1073#1088#1100)
          end
          object YearEdit: TSpinEdit
            Left = 221
            Top = 13
            Width = 52
            Height = 22
            MaxValue = 2100
            MinValue = 1900
            TabOrder = 1
            Value = 2009
            OnChange = YearEditChange
          end
          object DepComboBox: TComboBox
            Left = 338
            Top = 12
            Width = 239
            Height = 21
            ItemHeight = 13
            TabOrder = 2
            OnChange = DepComboBoxChange
          end
        end
        object GroupBox2: TGroupBox
          Left = 583
          Top = 2
          Width = 327
          Height = 48
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
          TabOrder = 1
          object Label3: TLabel
            Left = 8
            Top = 16
            Width = 119
            Height = 13
            Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1080' '#1087#1086
          end
          object SortComboBox: TComboBox
            Left = 132
            Top = 12
            Width = 189
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            OnChange = SortComboBoxChange
            Items.Strings = (
              #1055#1086' '#1085#1072#1079#1074#1072#1085#1080#1102' '#1075#1088#1091#1087#1087#1099
              #1055#1086' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1091' '#1091#1074#1072#1078#1080#1090#1077#1083#1100#1085#1099#1093' '#1087#1088#1086#1087#1091#1089#1082#1086#1074
              #1055#1086' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1091' '#1085#1077#1091#1074#1072#1078#1080#1090#1077#1083#1100#1085#1099#1093' '#1087#1088#1086#1087#1091#1089#1082#1086#1074
              #1055#1086' '#1086#1073#1097#1077#1084#1091' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1091' '#1087#1088#1086#1087#1091#1089#1082#1086#1074)
          end
        end
      end
      object DepartmentsReportBtn: TButton
        Left = 121
        Top = 458
        Width = 128
        Height = 25
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1086#1090#1076#1077#1083#1077#1085#1080#1103#1084
        TabOrder = 3
        OnClick = DepartmentsReportBtnClick
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1055#1088#1080#1077#1084' '#1089#1090#1091#1076#1077#1085#1090#1086#1074
      object Splitter1: TSplitter
        Left = 0
        Top = 325
        Width = 945
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object ListGrid: TDBGrid
        Left = 0
        Top = 0
        Width = 945
        Height = 325
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = ListDataSource
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ct_Year'
            Title.Caption = #1043#1086#1076
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sp_Comment'
            Title.Caption = #1064#1080#1092#1088
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sp_Name'
            Title.Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
            Width = 359
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ctp_obplan'
            Title.Caption = #1087#1083#1072#1085' ('#1073')'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ctp_obwant'
            Title.Caption = #1079#1072#1103#1074#1083' ('#1073')'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ctp_obreal'
            Title.Caption = #1087#1088#1080#1077#1084' ('#1073')'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ctp_ocplan'
            Title.Caption = #1087#1083#1072#1085' ('#1082')'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ctp_ocwant'
            Title.Caption = #1079#1072#1103#1074#1083' ('#1082')'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ctp_ocreal'
            Title.Caption = #1087#1088#1080#1077#1084' ('#1082')'
            Width = 58
            Visible = True
          end>
      end
      object Chart: TChart
        Left = 0
        Top = 328
        Width = 945
        Height = 163
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.AdjustFrame = False
        Title.Text.Strings = (
          'TChart')
        Legend.Visible = False
        View3D = False
        View3DWalls = False
        Align = alClient
        TabOrder = 1
        object Series1: THorizBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          ShowInLegend = False
          BarStyle = bsRectGradient
          XValues.DateTime = False
          XValues.Name = 'Bar'
          XValues.Multiplier = 1
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1086#1080#1089#1082' '#1089#1090#1091#1076#1077#1085#1090#1086#1074
      ImageIndex = 2
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 945
        Height = 49
        Align = alTop
        Caption = #1060#1080#1083#1100#1090#1088
        TabOrder = 0
        object FNameCheckBox: TCheckBox
          Left = 8
          Top = 16
          Width = 81
          Height = 17
          Caption = #1060#1072#1084#1080#1083#1080#1103
          TabOrder = 0
          OnClick = FilterRecords
        end
        object FNameEdit: TEdit
          Left = 81
          Top = 12
          Width = 136
          Height = 21
          TabOrder = 1
          OnChange = FilterRecords
        end
        object MNameCheckBox: TCheckBox
          Left = 222
          Top = 14
          Width = 51
          Height = 17
          Caption = #1048#1084#1103
          TabOrder = 2
          OnClick = FilterRecords
        end
        object MNameEdit: TEdit
          Left = 266
          Top = 12
          Width = 151
          Height = 21
          TabOrder = 3
          OnChange = FilterRecords
        end
        object LNameCheckBox: TCheckBox
          Left = 423
          Top = 14
          Width = 74
          Height = 17
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086
          TabOrder = 4
          OnClick = FilterRecords
        end
        object LNameEdit: TEdit
          Left = 492
          Top = 12
          Width = 157
          Height = 21
          TabOrder = 5
          OnChange = FilterRecords
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 49
        Width = 945
        Height = 443
        Align = alClient
        DataSource = StSearchDataSource
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'st_FName'
            Title.Caption = #1060#1072#1084#1080#1083#1080#1103
            Width = 116
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'st_MName'
            Title.Caption = #1048#1084#1103
            Width = 117
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'st_LName'
            Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
            Width = 116
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'gr_Name'
            Title.Caption = #1043#1088#1091#1087#1087#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'st_Address'
            Title.Caption = #1040#1076#1088#1077#1089
            Width = 490
            Visible = True
          end>
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1057#1090#1091#1076#1077#1085#1090#1099' '#1080' '#1075#1088#1091#1087#1087#1099
      ImageIndex = 3
      object Splitter2: TSplitter
        Left = 193
        Top = 49
        Width = 4
        Height = 357
        Cursor = crHSplit
      end
      object Splitter3: TSplitter
        Left = 0
        Top = 406
        Width = 945
        Height = 3
        Cursor = crVSplit
        Align = alBottom
      end
      object GroupGrid: TDBGrid
        Left = 0
        Top = 49
        Width = 193
        Height = 357
        Align = alLeft
        DataSource = GroupsSource
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'gr_Name'
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 153
            Visible = True
          end>
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 945
        Height = 49
        Align = alTop
        Caption = #1060#1080#1083#1100#1090#1088
        TabOrder = 1
        object CourseCheckBox: TCheckBox
          Left = 8
          Top = 20
          Width = 49
          Height = 17
          Caption = #1050#1091#1088#1089
          TabOrder = 0
          OnClick = CourseCheckBoxClick
        end
        object CourseEdit: TSpinEdit
          Left = 56
          Top = 15
          Width = 49
          Height = 22
          MaxValue = 4
          MinValue = 1
          TabOrder = 1
          Value = 1
          OnChange = CourseEditChange
        end
        object SpecCheckBox: TCheckBox
          Left = 128
          Top = 18
          Width = 97
          Height = 17
          Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
          TabOrder = 2
          OnClick = SpecCheckBoxClick
        end
        object SpecComboBox: TComboBox
          Left = 229
          Top = 16
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 3
          OnChange = SpecComboBoxChange
        end
        object DepCheckBox: TCheckBox
          Left = 408
          Top = 18
          Width = 81
          Height = 17
          Caption = #1054#1090#1076#1077#1083#1077#1085#1080#1077
          TabOrder = 4
          OnClick = DepCheckBoxClick
        end
        object DepFilterComboBox: TComboBox
          Left = 488
          Top = 16
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 5
          OnChange = DepFilterComboBoxChange
        end
      end
      object ParamsGrid: TDBGrid
        Left = 0
        Top = 409
        Width = 945
        Height = 83
        Align = alBottom
        DataSource = ParamsSource
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'p_name'
            Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088
            Width = 593
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'p_value'
            Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
            Width = 81
            Visible = True
          end>
      end
      object StudentsGrid: TDBGrid
        Left = 197
        Top = 49
        Width = 748
        Height = 357
        Align = alClient
        DataSource = StudentsSource
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = StudentsGridDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'st_FName'
            Title.Caption = #1060#1072#1084#1080#1083#1080#1103
            Width = 189
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'st_MName'
            Title.Caption = #1048#1084#1103
            Width = 185
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'st_LName'
            Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
            Width = 192
            Visible = True
          end>
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
      ImageIndex = 4
      object WorkersGrid: TDBGrid
        Left = 0
        Top = 0
        Width = 945
        Height = 449
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = WorkersSource
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'wk_FName'
            Title.Caption = #1060#1072#1084#1080#1083#1080#1103
            Width = 262
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'wk_MName'
            Title.Caption = #1048#1084#1103
            Width = 275
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'wk_LName'
            Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
            Width = 369
            Visible = True
          end>
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 256
    Top = 120
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N2Click
      end
    end
    object N3: TMenuItem
      Caption = #1057#1077#1088#1074#1080#1089
      object N4: TMenuItem
        Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077
        OnClick = N4Click
      end
    end
  end
  object Connection: TADOConnection
    ConnectionString = 'FILE NAME=C:\Delphi\PGTK\director\connection.udl'
    Provider = 'SQLOLEDB.1'
    Left = 8
    Top = 168
  end
  object ListQuery: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'EXEC GetDirectorList 0')
    Left = 40
    Top = 168
  end
  object ListDataSource: TDataSource
    DataSet = ListQuery
    OnDataChange = ListDataSourceDataChange
    Left = 72
    Top = 168
  end
  object MissingsQuery: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'DECLARE @month AS integer'
      'SET @month = MONTH(GETDATE())'
      ''
      'DECLARE @year AS integer'
      'SET @year = YEAR(GETDATE())'
      ''
      'SELECT gr_Name,'
      '  (SELECT SUM(swm_legal) FROM StWeekMissings, Students '
      
        '    WHERE (swm_stcode = st_pcode) AND (st_grcode = gr_pcode) AND' +
        ' (swm_Year = @year) AND (swm_mounth = @month)) AS gr_legal,'
      '  (SELECT SUM(swm_illegal) FROM StWeekMissings, Students '
      
        '    WHERE (swm_stcode = st_pcode) AND (st_grcode = gr_pcode) AND' +
        ' (swm_Year = @year) AND (swm_mounth = @month)) AS gr_illegal,'
      '  (SELECT SUM(swm_all) FROM StWeekMissings, Students '
      
        '    WHERE (swm_stcode = st_pcode) AND (st_grcode = gr_pcode) AND' +
        ' (swm_Year = @year) AND (swm_mounth = @month)) AS gr_all,'
      
        '  wk_Name, dp_Name FROM Groups, Workers, Departments WHERE (gr_A' +
        'ttributes = 0) AND (gr_isZaoch = 0) AND (gr_depcode = dp_pcode) ' +
        'AND (gr_mastercode = wk_pcode)'
      '  ORDER BY gr_illegal DESC')
    Left = 24
    Top = 112
  end
  object MissingsDataSource: TDataSource
    DataSet = MissingsQuery
    OnDataChange = MissingsDataSourceDataChange
    Left = 56
    Top = 112
  end
  object StSearchDataSource: TDataSource
    DataSet = StSearchQuery
    Left = 608
    Top = 88
  end
  object StSearchQuery: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT st_pcode, gr_Name, st_FName, st_MName, st_LName,'
      'pl_FullName+'#39', '#39'+st_Address AS st_Address'
      'FROM Groups, Students, Places'
      'WHERE (st_grcode = gr_pcode) AND (st_plcode = pl_pcode)'
      'ORDER BY st_FName, st_MName, st_LName; ')
    Left = 640
    Top = 88
  end
  object WorkersSource: TDataSource
    DataSet = WorkersQuery
    Left = 696
    Top = 168
  end
  object WorkersQuery: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * From Workers ORDER BY wk_Name;')
    Left = 728
    Top = 168
  end
  object GroupsQuery: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT gr_pcode, gr_Name, gr_course, gr_depcode, gr_speccode FRO' +
        'M Groups '
      'WHERE (gr_isZaoch = 0) AND (gr_Attributes = 0)'
      'ORDER BY gr_Speccode, gr_Name')
    Left = 128
    Top = 304
  end
  object StudentsQuery: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT st_FName, st_MName, st_LName, st_pcode, st_grcode'
      'FROM Students WHERE st_Attributes = 0')
    Left = 360
    Top = 304
  end
  object ParamsQuery: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'EXEC GetGroupParams '#39'8DF502E1-8D19-47A3-83EE-9C07F0CE29CC'#39)
    Left = 272
    Top = 456
  end
  object GroupsSource: TDataSource
    DataSet = GroupsQuery
    OnDataChange = GroupsSourceDataChange
    Left = 96
    Top = 304
  end
  object StudentsSource: TDataSource
    DataSet = StudentsQuery
    Left = 328
    Top = 304
  end
  object ParamsSource: TDataSource
    DataSet = ParamsQuery
    Left = 240
    Top = 456
  end
end
