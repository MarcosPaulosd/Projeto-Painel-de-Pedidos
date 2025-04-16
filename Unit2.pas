unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, ShellApi;

type
  Tfrm_configuracoes = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    edit_path: TEdit;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Image1: TImage;
    Label4: TLabel;
    Msg_Letreiro: TMemo;
    edit_tempo: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Op_path: TOpenDialog;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frm_configuracoes: Tfrm_configuracoes;

implementation

{$R *.dfm}

uses Unit1;

procedure SalvarCaminhoNoBlocoDeNotas(const CaminhoArquivo: string);
var
  Lista: TStringList;
begin
  // Cria uma TStringList para armazenar o caminho
  Lista := TStringList.Create;
  try
    // Adiciona o caminho do arquivo
    Lista.Add(CaminhoArquivo);

    // Adiciona a mensagem do Memo ao final do arquivo
    Lista.Add(frm_configuracoes.Msg_Letreiro.Lines.Text);  // Adiciona o texto do Memo

   // Adiciona a mensagem do Memo ao final do arquivo
    Lista.Add(frm_configuracoes.edit_tempo.Text);  // Adiciona o tempo do Letreiro

    // Salva o caminho no arquivo de texto (notepad.txt)
    Lista.SaveToFile('C:\Projeto NovaMalha\Dados\path.txt'); // Troque o caminho conforme necessário
  finally
    Lista.Free;
  end;
end;



procedure Tfrm_configuracoes.SpeedButton1Click(Sender: TObject);
begin
   if Op_path.Execute then
   edit_path.Text := Op_path.FileName;

end;

procedure Tfrm_configuracoes.SpeedButton2Click(Sender: TObject);
begin
//   path_txt, Msgdo_Letreiro
   SalvarCaminhoNoBlocoDeNotas(edit_path.Text);
   Form1.path_txt := edit_path.Text;
   Form1.Msgdo_Letreiro := Msg_Letreiro.Text;

   MessageDlg('Configurações salvas com sucesso!', TMsgDlgType.mtConfirmation, [mbok],0);
end;

end.
