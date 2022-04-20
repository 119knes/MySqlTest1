object Form1: TForm1
  Left = 301
  Top = 271
  Width = 767
  Height = 540
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 59
    Height = 13
    Caption = 'My Outter IP'
  end
  object lnl_outer_IP: TLabel
    Left = 104
    Top = 8
    Width = 56
    Height = 13
    Caption = 'lnl_outer_IP'
  end
  object Memo1: TMemo
    Left = 32
    Top = 208
    Width = 705
    Height = 273
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 272
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Get IPs'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 544
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Upload My IP'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edt_Desc: TEdit
    Left = 504
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'X1XXX'
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 40
    Top = 368
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=47b10a2b;Persist Security Info=True;' +
      'User ID=b5bfe2cf3465a4;Data Source=MySQL_ClearDB'
    DefaultDatabase = 'heroku_b181e4bd02b7882'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 8
    Top = 368
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 8
    Top = 416
  end
end
