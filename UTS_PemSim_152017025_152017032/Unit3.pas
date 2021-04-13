unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, SMDBGrid, DB, DBCtrls, Mask,
  ExtCtrls, jpeg, Chart, Math;

type
  TForm3 = class(TForm)
    pnl1: TPanel;
    ds1: TDataSource;
    btn1: TBitBtn;
    btn4: TBitBtn;
    grp1: TGroupBox;
    lbl2: TLabel;
    lbl3: TLabel;
    grp2: TGroupBox;
    lbl4: TLabel;
    lbl5: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edt_hasilpanen: TEdit;
    edt_perkons: TEdit;
    edt_bertambah: TEdit;
    edt_berkurang: TEdit;
    edt_banyak: TEdit;
    edt_sedikit: TEdit;
    edt_naik: TEdit;
    edt_turun: TEdit;
    img1: TImage;
    lbl1: TLabel;
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  hasilpanen, permintaankonsumen, pkbertambah, pkberkurang, hpbanyak, hpsedikit, hpnaik, hpturun:Real;
  Form3: TForm3;

implementation

uses Unit5;

{$R *.dfm}

procedure TForm3.btn4Click(Sender: TObject);
var
  ubertambah, uberkurang, ubanyak, usedikit :Single;
  OF_R1, OF_R2, OF_R3, OF_R4 : single;
  ImpNaik, ImpTurun: Single;
begin
 Form3.Hide;
 Form5.Show;

 // input data manual
 hasilpanen := strtofloat(edt_hasilpanen.Text);
 permintaankonsumen := strtofloat(edt_perkons.Text);
 pkbertambah := strtofloat(edt_bertambah.Text);
 pkberkurang := strtofloat(edt_berkurang.Text);
 hpbanyak := strtofloat(edt_banyak.Text);
 hpsedikit := strtofloat(edt_sedikit.Text);
 hpnaik := strtofloat(edt_naik.Text);
 hpturun := strtofloat(edt_turun.Text);

 //tahap 1 fuzzifikasi
 Form5.edt_utambah.Text := FloatToStr((-(hasilpanen-pkbertambah))/(pkbertambah-pkberkurang));
 Form5.edt_ukurang.Text := FloatToStr(((hasilpanen-pkberkurang))/(pkbertambah-pkberkurang));
 Form5.edt_ubanyak.Text := FloatToStr((-(permintaankonsumen-hpbanyak))/(hpbanyak-hpsedikit));
 Form5.edt_usedikit.Text := FloatToStr(((permintaankonsumen-hpsedikit))/(hpbanyak-hpsedikit));

 // grafik tahap 1
 Form5.cht_perkons.Series[0].Clear;
 Form5.cht_perkons.Series[0].AddXY(StrToFloat(edt_bertambah.Text), 1);
 Form5.cht_perkons.Series[0].AddXY(StrToFloat(edt_berkurang.Text), 0);
 Form5.cht_perkons.Series[1].Clear;
 Form5.cht_perkons.Series[1].AddXY(StrToFloat(edt_bertambah.Text), 0);
 Form5.cht_perkons.Series[1].AddXY(StrToFloat(edt_berkurang.Text), 1);

 Form5.cht_hasilpanen.Series[0].Clear;
 Form5.cht_hasilpanen.Series[0].AddXY(StrToFloat(edt_banyak.Text), 1);
 Form5.cht_hasilpanen.Series[0].AddXY(StrToFloat(edt_sedikit.Text), 0);
 Form5.cht_hasilpanen.Series[1].Clear;
 Form5.cht_hasilpanen.Series[1].AddXY(StrToFloat(edt_banyak.Text), 0);
 Form5.cht_hasilpanen.Series[1].AddXY(StrToFloat(edt_sedikit.Text), 1);

 Form5.cht_harpen.Series[0].Clear;
 Form5.cht_harpen.Series[0].AddXY(StrToFloat(edt_naik.Text), 1);
 Form5.cht_harpen.Series[0].AddXY(StrToFloat(edt_turun.Text), 0);
 Form5.cht_harpen.Series[1].Clear;
 Form5.cht_harpen.Series[1].AddXY(StrToFloat(edt_naik.Text), 0);
 Form5.cht_harpen.Series[1].AddXY(StrToFloat(edt_turun.Text), 1);

 //mengambbil data dari fuzzifikasi tahap 1
 ubertambah := StrToFloat(Form5.edt_utambah.Text);
 uberkurang := StrToFloat(Form5.edt_ukurang.Text);
 ubanyak := StrToFloat(Form5.edt_ubanyak.Text);
 usedikit := StrToFloat(Form5.edt_usedikit.Text);

 //tahap 2 Operasi fuzzy
 OF_R1 := Min(ubertambah,ubanyak);
 OF_R2 := Min(ubertambah,usedikit);
 OF_R3 := Min(uberkurang,ubanyak);
 OF_R4 := Min(uberkurang,usedikit);

 Form5.edt_OFR1.Text := FloatToStr(OF_R1);
 Form5.edt_OFR1.Text := FormatFloat('0.##',OF_R1);
 Form5.edt_OFR2.Text := FloatToStr(OF_R2);
 Form5.edt_OFR2.Text := FormatFloat('0.##',OF_R2);
 Form5.edt_OFR3.Text := FloatToStr(OF_R3);
 Form5.edt_OFR3.Text := FormatFloat('0.##',OF_R3);
 Form5.edt_OFR4.Text := FloatToStr(OF_R4);
 Form5.edt_OFR4.Text := FormatFloat('0.##',OF_R4);

 //TAHAP 3 NILAI IMPLIKASI
 Form5.edt_IMPR1.Text := FloatToStr(OF_R1);
 Form5.edt_IMPR1.Text := FormatFloat('0.##',OF_R1);
 Form5.edt_IMPR2.Text := FloatToStr(OF_R2);
 Form5.edt_IMPR2.Text := FormatFloat('0.##',OF_R2);
 Form5.edt_IMPR3.Text := FloatToStr(OF_R3);
 Form5.edt_IMPR3.Text := FormatFloat('0.##',OF_R3);
 Form5.edt_IMPR4.Text := FloatToStr(OF_R4);
 Form5.edt_IMPR4.Text := FormatFloat('0.##',OF_R4);

 //Komposisi Aturan
 ImpNaik := Max(OF_R1, OF_R3);
 ImpTurun := Max(OF_R2, OF_R4);
 Form5.edt_KaTurun.Text := FloatToStr(ImpTurun);
 Form5.edt_KaTurun.Text := FormatFloat('0.##',ImpTurun);
 Form5.edt_KaNaik.Text := FloatToStr(ImpNaik);
 Form5.edt_KaNaik.Text := FormatFloat('0.##',ImpNaik);


end;

end.
