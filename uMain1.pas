unit uMain1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    Edt_Desc: TEdit;
    Label1: TLabel;
    lnl_outer_IP: TLabel;
    IdHTTP1: TIdHTTP;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses commonUtils;

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var
  name, ip, desc  : string;
  urllist : Tstringlist;
  //ADOQuery1: TADOQuery;
begin
//  mysql://b5bfe2cf3465a4:47b10a2b@us-cdbr-east-05.cleardb.net/heroku_b181e4bd02b7882?reconnect=true
  //ADOQuery1 := TADOQuery.Create(nil);
  {
  ADOQuery1.ConnectionString := //'Provider=MSDASQL.1;'
                                  'Password=47b10a2b;'
                                 +'Persist Security Info=True;'
                                 +'User ID=b5bfe2cf3465a4;'
                                 +'Data Source=us-cdbr-east-05.cleardb.net';
                                 }
  ADOQuery1.SQL.Text := 'select * from pc_info';
  ADOQuery1.Open;
  ADOQuery1.First;
  memo1.Lines.Clear;
  urllist := TStringList.Create;
  while not ADOQuery1.Eof do
  begin
    name := ADOQuery1.FieldByName('PC_NAME').AsString ;
    desc := ADOQuery1.FieldByName('description').AsString ;
    ip := ADOQuery1.FieldByName('IP').AsString;
    urllist.Add(name + ' ' + desc +' '+ ip);

    ADOQuery1.Next;
  end;

  Memo1.Lines := urllist;

end;


procedure TForm1.Button2Click(Sender: TObject);
var
  local_ip , desc : string;
  rc : integer;
begin
  //local_ip := GetLocalAddress;
  local_ip := lnl_outer_IP.Caption;
  desc := edt_desc.Text;
  ADOQuery1.SQL.Clear;

  ADOQuery1.SQL.Text := 'Insert into pc_info '
                        + '( pc_name, ip, description, create_date, edit_date) '
                        + 'values(''ForceRecon'', '''
                        + local_ip +''', '''+desc+''', sysdate(), sysdate())'
                        + ' ON DUPLICATE KEY UPDATE IP = '''+ local_ip
                        + ''' , DESCRIPTION = '''+desc
                        + ''';'
                        ;
  rc := ADOQuery1.ExecSQL;
  memo1.Lines.Clear;
  if rc = 0 then
    memo1.Lines.add('OK')
  else
    memo1.Lines.Add('Return ' + intToStr(rc)) ;

end;

procedure TForm1.FormShow(Sender: TObject);
var
  temp : string;
begin
  Temp:=IdHTTP1.Get('http://checkip.dyndns.com');
  Temp:=Copy(Temp, Pos('Address: ', Temp)+9, Length(Temp));
  Temp := Copy(Temp, 1, Pos('<', Temp)-1);
  lnl_outer_IP.Caption := Temp;
end;

end.
