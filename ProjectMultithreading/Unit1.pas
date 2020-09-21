unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
  CS: TRTLCriticalSection; { 声明临界 }

  // Delphi 在 SyncObjs 单元给封装了一个 TCriticalSection 类, 用法和临界差不多
procedure TForm1.FormCreate(Sender: TObject);
begin
  ListBox1.Align := alLeft;
  InitializeCriticalSection(CS); { 初始化临界 }
end;

function MyThreadFun(p: Pointer): DWORD; stdcall;
var
  i: Integer;
begin
  EnterCriticalSection(CS); { 我要用了，别人先别用 }
  for i := 0 to 99 do
    Form1.ListBox1.Items.Add(IntToStr(i));
  LeaveCriticalSection(CS); { 我用完了，别可以用了 }
  Result := 0;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  ID: DWORD;
begin
  CreateThread(nil, 0, @MyThreadFun, nil, 0, ID);
  CreateThread(nil, 0, @MyThreadFun, nil, 0, ID);
  CreateThread(nil, 0, @MyThreadFun, nil, 0, ID);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  DeleteCriticalSection(CS); { 删除临界 }
end;

{ Windows.API方法 }
function MyFun(p: Pointer): Integer; stdcall;
{ 工作线程调入函数，stdcall用于多个线程排序以及系统级别调用加此关键字 }
var
  i: Integer;
begin
  for i := 0 to 500000 do
  begin
    with Form1.Canvas do
    begin
      Lock; // 正在使用, 锁住!
      TextOut(245, 95, IntToStr(i)); { 50和10是坐标X和Y }
      Unlock; // 用完了, 解锁!
      // Application.ProcessMessages;
      { 一般用在比较费时的循环中, 它会检查并先处理消息队列中的其他消息.
        但这算不上多线程, 譬如: 运行中你拖动窗体, 循环会暂停下来... }
    end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
{ 工作线程，拖动窗口时计数不会停顿，因为和主线程分开工作了 }
var
  ID: DWORD; { 用于接收线程返回句柄，也可以用DWORD }
begin
  CreateThread(nil, 0, @MyFun, nil, 0, ID); { API创建线程 }
end;

end.
