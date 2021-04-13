unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, SMDBGrid, StdCtrls, jpeg, ExtCtrls, Buttons,
  TeEngine, Series, TeeProcs, Chart, Math;

type
  TForm5 = class(TForm)
    img1: TImage;
    grp2: TGroupBox;
    grp3: TGroupBox;
    grp4: TGroupBox;
    grp5: TGroupBox;
    grp6: TGroupBox;
    grp7: TGroupBox;
    btn3: TBitBtn;
    edt_HasilAkhir: TEdit;
    lbl1: TLabel;
    btn4: TBitBtn;
    cht_perkons: TChart;
    lnsrsSeries1: TLineSeries;
    lnsrsSeries2: TLineSeries;
    cht_hasilpanen: TChart;
    lnsrsSeries3: TLineSeries;
    lnsrsSeries4: TLineSeries;
    cht_harpen: TChart;
    lnsrsSeries5: TLineSeries;
    lnsrsSeries6: TLineSeries;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edt_utambah: TEdit;
    edt_ukurang: TEdit;
    edt_ubanyak: TEdit;
    edt_usedikit: TEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    edt_OFR1: TEdit;
    edt_OFR2: TEdit;
    edt_OFR3: TEdit;
    edt_OFR4: TEdit;
    edt_IMPR1: TEdit;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    edt_IMPR2: TEdit;
    edt_IMPR3: TEdit;
    edt_IMPR4: TEdit;
    lbl16: TLabel;
    lbl17: TLabel;
    edt_KaNaik: TEdit;
    edt_KaTurun: TEdit;
    lbl2: TLabel;
    lbl18: TLabel;
    edt_FDN2: TEdit;
    edt_FDN3: TEdit;
    edt_FDN4: TEdit;
    edt_FDN5: TEdit;
    edt_FDT1: TEdit;
    edt_FDT2: TEdit;
    edt_FDT3: TEdit;
    edt_FDT4: TEdit;
    edt_FDT5: TEdit;
    btn1: TBitBtn;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    btn2: TBitBtn;
    edt_FDN1: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;


implementation

uses Unit3;


{$R *.dfm}

procedure TForm5.btn1Click(Sender: TObject);
begin
Form5.Hide;
Form3.show;
end;

procedure TForm5.btn3Click(Sender: TObject);

var
  random1,random2,random3,random4,random5,random6,random7,random8,random9,random10,naik,turun: Integer;
begin
 naik:= StrToInt(Form3.edt_naik.Text);
 turun:= StrToInt(Form3.edt_turun.Text);
 random1:= RandomRange(naik,turun);
 random2:= RandomRange(naik,turun);
 random3:= RandomRange(naik,turun);
 random4:= RandomRange(naik,turun);
 random5:= RandomRange(naik,turun);
 random6:= RandomRange(naik,turun);
 random7:= RandomRange(naik,turun);
 random8:= RandomRange(naik,turun);
 random9:= RandomRange(naik,turun);
 random10:= RandomRange(naik,turun);

 edt_FDN1.Text := IntToStr(random1);
 edt_FDN2.Text := IntToStr(random2);
 edt_FDN3.Text := IntToStr(random3);
 edt_FDN4.Text := IntToStr(random4);
 edt_FDN5.Text := IntToStr(random5);
 edt_FDT1.Text := IntToStr(random6);
 edt_FDT2.Text := IntToStr(random7);
 edt_FDT3.Text := IntToStr(random8);
 edt_FDT4.Text := IntToStr(random9);
 edt_FDT5.Text := IntToStr(random10);


end;

procedure TForm5.btn4Click(Sender: TObject);
var
  Centroid1, Centroid2, Centroid3, Centroid4, Centroid5,
  Centroid6, Centroid7, Centroid8, Centroid9, Centroid10 : Integer ;
  KaNaik, KaTurun, HasilAkhir : Single;
begin
  Centroid1 := StrToInt(edt_FDN1.Text);
  Centroid2 := StrToInt(edt_FDN2.Text);
  Centroid3 := StrToInt(edt_FDN3.Text);
  Centroid4 := StrToInt(edt_FDN4.Text);
  Centroid5 := StrToInt(edt_FDN5.Text);
  Centroid6 := StrToInt(edt_FDT1.Text);
  Centroid7 := StrToInt(edt_FDT2.Text);
  Centroid8 := StrToInt(edt_FDT3.Text);
  Centroid9 := StrToInt(edt_FDT4.Text);
  Centroid10 := StrToInt(edt_FDT5.Text);
  KaNaik := StrToFloat(edt_KaNaik.Text);
  KaTurun := StrToFloat(edt_KaTurun.Text);

  HasilAkhir := Round ((((Centroid1+centroid2+centroid3+centroid4+centroid5)*KaNaik+(Centroid6+centroid7+centroid8+centroid9+centroid10)*
  KaTurun)/((KaNaik*5)+(KaTurun*5))));
  edt_HasilAkhir.Text := FloatToStr(HasilAkhir) ;
  


end;

end.
