unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TForm1 = class(TForm)
    pnl1: TPanel;
    pnl3: TPanel;
    btn2: TButton;
    img1: TImage;
    lbl1: TLabel;
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit3;



{$R *.dfm}

procedure TForm1.btn2Click(Sender: TObject);
begin
 Form1.Hide;
 Form3.Show;
end;

end.
