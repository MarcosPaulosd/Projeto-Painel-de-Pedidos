program Painel;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {frm_configuracoes},
  Unit3 in 'Unit3.pas' {frm_painel_clientes},
  Unit4 in 'Unit4.pas' {DataModule4: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tfrm_configuracoes, frm_configuracoes);
  Application.CreateForm(Tfrm_painel_clientes, frm_painel_clientes);
  Application.CreateForm(TDataModule4, DataModule4);
  Application.Run;
end.
