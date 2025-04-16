unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var
    path_txt, Msgdo_Letreiro, Num_Tempo_Letreiro : String;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2, Unit3;

procedure CarregarCaminhoDoBlocoDeNotas;
var
  Lista: TStringList;
  CaminhoArquivo: string;
begin
  // Cria uma TStringList para ler o arquivo de texto
  Lista := TStringList.Create;
  try
    // Tenta carregar o arquivo de texto
    Lista.LoadFromFile('C:\Projeto NovaMalha\Dados\path.txt');  // Troque o caminho conforme necessário

    // Verifica se o arquivo não está vazio e se a primeira linha contém dados
    if Lista.Count > 0 then
    begin
      // Pega o caminho salvo na primeira linha do arquivo
      CaminhoArquivo := Lista[0];

      // Exibe o caminho no TEdit
      Form1.path_txt := CaminhoArquivo;
      Form1.Num_Tempo_Letreiro := Lista[Lista.Count - 1];
    end
    else
    begin
      MessageDlg('Atenção o arquivo que contém os dados está vazio!!!', TMsgDlgType.mtWarning,
      [mbok],0);
    end;
  except
    on E: Exception do
      MessageDlg('Erro ao carregar o arquivo: ' + E.Message, TMsgDlgType.mtError,
      [mbOK],0);
  end;
  Lista.Free;
end;

procedure CarregarMensagemDeArquivo(const NomeArquivo: string);
var
  Lista: TStringList;
  Mensagem: string;
  I: Integer;
begin
  if not FileExists(NomeArquivo) then
  begin
    ShowMessage('Arquivo não encontrado!');
    Exit;
  end;

  Lista := TStringList.Create;
  try
    Lista.LoadFromFile(NomeArquivo);

  // Ignorar a primeira e a última linha
    Mensagem := '';
    for I := 1 to Lista.Count - 2 do
      Mensagem := Mensagem + Lista[I] + sLineBreak;

    // Remove a quebra de linha extra no final
    if Mensagem.EndsWith(sLineBreak) then
      SetLength(Mensagem, Length(Mensagem) - Length(sLineBreak));

    Form1.Msgdo_Letreiro := Mensagem;
  finally
    Lista.Free;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
     CarregarCaminhoDoBlocoDeNotas;
     CarregarMensagemDeArquivo('C:\Projeto NovaMalha\Dados\path.txt');
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
   frm_painel_clientes.ShowModal;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
    frm_configuracoes.Show;
    frm_configuracoes.edit_path.Text := path_txt;
    frm_configuracoes.Msg_Letreiro.Lines.Text := Msgdo_Letreiro;
    frm_configuracoes.edit_tempo.Text := Num_Tempo_Letreiro;
end;

end.
