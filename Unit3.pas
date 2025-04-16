unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.Grids, Vcl.Buttons, StrUtils, MaskUtils;

type
  Tfrm_painel_clientes = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Timer_Letreiro: TTimer;
    Timer_data_hora: TTimer;
    panel_letreiro: TPanel;
    lb_letreiro: TLabel;
    Panel_Data_hora: TPanel;
    GroupBox6: TGroupBox;
    Timer_funcoes: TTimer;
    GroupBox5: TGroupBox;
    GroupBox2: TGroupBox;
    Grid_PedCaixa: TStringGrid;
    GroupBox3: TGroupBox;
    Grid_PedComposicao: TStringGrid;
    painel_comp: TPanel;
    GroupBox4: TGroupBox;
    Grid_PedAndamento: TStringGrid;
    Panel_Andamento: TPanel;
    GroupBox7: TGroupBox;
    Grid_PedParcFat: TStringGrid;
    Panel_Parc_Faturado: TPanel;
    GroupBox8: TGroupBox;
    Grid_PedAnalise: TStringGrid;
    Panel_Analise: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    Panel_Caixa: TPanel;
    Panel_Atendidos: TPanel;
    Grid_PedAtendidos: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure Grid_PedComposicaoDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer_LetreiroTimer(Sender: TObject);
    procedure Timer_data_horaTimer(Sender: TObject);
    procedure Grid_PedCaixaDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure Grid_PedAndamentoDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure Grid_PedAtendidosDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure Timer_funcoesTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Grid_PedParcFatDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure Grid_PedAnaliseDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_painel_clientes: Tfrm_painel_clientes;

implementation

{$R *.dfm}

uses Unit1;

Procedure saudacao;
begin
 if (time >= strtotime('00:00:00'))and (time < strtotime('11:59:59')) then
    frm_painel_clientes.Panel_Data_hora.Caption := 'Bom dia! ';
  if (time >= strtotime('12:00:00'))and (time < strtotime('17:59:59')) then
    frm_painel_clientes.Panel_Data_hora.Caption :=  'Boa tarde! ';
  if (time >= strtotime('18:00:00'))and (time < strtotime('23:59:59')) then
    frm_painel_clientes.Panel_Data_hora.Caption := 'Boa noite! ';
    frm_painel_clientes.Panel_Data_hora.Caption := formatdatetime('dddd", "dd " de "mmmm" de " yyyy' ,date) + '     Hora: ' + TimeToStr(now);

end;


Procedure Limpar_Grids;
var
  I, J: integer;
begin
  with frm_painel_clientes.Grid_PedAndamento do
       for I := 0 to ColCount -1 do
      for J := 0 to RowCount -1 do
        Cells[I,J] := '';

 Begin
     with frm_painel_clientes.Grid_PedComposicao do
        for I := 0 to ColCount -1 do
      for J := 0 to RowCount -1 do
        Cells[I,J] := '';

  end;
     Begin
       with frm_painel_clientes.Grid_PedCaixa do
         for I := 0 to ColCount -1 do
        for J := 0 to RowCount -1 do
       Cells[I,J] := '';
      end;
        Begin
          with frm_painel_clientes.Grid_PedAtendidos do
            for I := 0 to ColCount -1 do
           for J := 0 to RowCount -1 do
         Cells[I,J] := '';
        end;

           Begin
             with frm_painel_clientes.Grid_PedAnalise do
               for I := 0 to ColCount -1 do
              for J := 0 to RowCount -1 do
            Cells[I,J] := '';
           end;

             Begin
                with frm_painel_clientes.Grid_PedParcFat do
                  for I := 0 to ColCount -1 do
                 for J := 0 to RowCount -1 do
               Cells[I,J] := '';
             end;

end;



procedure LoadCSVFile(FileName: string);
var
 temp, fId, fFile, fDate, fsituacao: string;
 sgItem: TStringList;
 f: textfile;

begin
   assignfile(f, FileName);
       reset(f);
           sgItem := TStringList.Create;
    // Inserindo os Grids na função
   frm_painel_clientes.Grid_PedComposicao.RowCount := 2;
   frm_painel_clientes.Grid_PedAndamento.RowCount := 2;
   frm_painel_clientes.Grid_PedCaixa.RowCount := 2;
   frm_painel_clientes.Grid_PedAtendidos.RowCount := 2;
   frm_painel_clientes.Grid_PedAnalise.RowCount := 2;
   frm_painel_clientes.Grid_PedParcFat.RowCount := 2;


  while not eof(f) do
     begin
         readln(f, temp);

         fId := copy(temp, 1, pos(';', temp) - 1);
         delete(temp, 1, pos(';', temp));

         fFile := copy(temp, 1, pos(';', temp) - 1);
         delete(temp, 1, pos(';', temp));

         fsituacao := copy(temp, 1, pos(';', temp) - 1);
         delete(temp, 1, pos(';', temp));

         fDate := temp;


         // Verificando o filtro para Composição
         if fDate = 'EM COMPOSICAO' then
           begin
              sgItem.Clear;
//              sgItem.Add(FormatMaskText('00/00/00', fId));
              sgItem.Add(fFile);
              sgItem.Add(fsituacao);
              frm_painel_clientes.Grid_PedComposicao.Rows[frm_painel_clientes.Grid_PedComposicao.RowCount - 1].AddStrings(sgItem);
              frm_painel_clientes.Grid_PedComposicao.RowCount := frm_painel_clientes.Grid_PedComposicao.RowCount + 1;
           end;

         // Verificando o filtro Separacao
         if (fDate = 'EM SEPARACAO') then
           begin
              sgItem.Clear;
//              sgItem.Add(FormatMaskText('00/00/00', fId));
              sgItem.Add(fFile);
              sgItem.Add(fsituacao);
              frm_painel_clientes.Grid_PedAndamento.Rows[frm_painel_clientes.Grid_PedAndamento.RowCount - 1].AddStrings(sgItem);
              frm_painel_clientes.Grid_PedAndamento.RowCount := frm_painel_clientes.Grid_PedAndamento.RowCount + 1;
           end;

         // Verificando o filtro para Caixa
         if (fDate = 'DIRIJA-SE AO CAIXA') then
           begin
              sgItem.Clear;
//              sgItem.Add(FormatMaskText('00/00/00', fId));
              sgItem.Add(fFile);
              sgItem.Add(fsituacao);
              frm_painel_clientes.Grid_PedCaixa.Rows[frm_painel_clientes.Grid_PedCaixa.RowCount - 1].AddStrings(sgItem);
              frm_painel_clientes.Grid_PedCaixa.RowCount := frm_painel_clientes.Grid_PedCaixa.RowCount + 1;
           end;

         // Verificando o filtro para Atendidos
         if  (fDate = 'FATURADO') then
           begin
              sgItem.Clear;
//              sgItem.Add(FormatMaskText('00/00/00', fId));
              sgItem.Add(fFile);
              sgItem.Add(fsituacao);
              frm_painel_clientes.Grid_PedAtendidos.Rows[frm_painel_clientes.Grid_PedAtendidos.RowCount - 1].AddStrings(sgItem);
              frm_painel_clientes.Grid_PedAtendidos.RowCount := frm_painel_clientes.Grid_PedAtendidos.RowCount + 1;
           end;

         // Verificando o filtro para Faturados Parcialmente
         if  fDate = 'FATURADO PARCIALMENTE' then
           begin
              sgItem.Clear;
//              sgItem.Add(FormatMaskText('00/00/00', fId));
              sgItem.Add(fFile);
              sgItem.Add(fsituacao);
              frm_painel_clientes.Grid_PedParcFat.Rows[frm_painel_clientes.Grid_PedParcFat.RowCount - 1].AddStrings(sgItem);
              frm_painel_clientes.Grid_PedParcFat.RowCount := frm_painel_clientes.Grid_PedParcFat.RowCount + 1;
           end;

         // Verificando o filtro para Em Analise
         if  fDate = 'EM ANALISE' then
           begin
              sgItem.Clear;
//              sgItem.Add(FormatMaskText('00/00/00', fId));
              sgItem.Add(fFile);
              sgItem.Add(fsituacao);
              frm_painel_clientes.Grid_PedAnalise.Rows[frm_painel_clientes.Grid_PedAnalise.RowCount - 1].AddStrings(sgItem);
              frm_painel_clientes.Grid_PedAnalise.RowCount := frm_painel_clientes.Grid_PedAnalise.RowCount + 1;
           end;




     end;
   sgItem.Free;
   closefile(f);
 // colocando  quantidade de reistro inseridos  no Grid
  frm_painel_clientes.painel_comp.Caption := 'Pedidos Em Composição: ' +  IntToStr(frm_painel_clientes.Grid_PedComposicao.RowCount - 2);
  frm_painel_clientes.Panel_Andamento.Caption := 'Pedidos Em Separação: ' +  IntToStr(frm_painel_clientes.Grid_PedAndamento.RowCount - 2);
  frm_painel_clientes.Panel_Caixa.Caption := 'Aguardando Pagamento (Caixa): ' +  IntToStr(frm_painel_clientes.Grid_PedCaixa.RowCount - 2);
  frm_painel_clientes.Panel_Atendidos.Caption := 'Pedidos Faturados: ' +  IntToStr(frm_painel_clientes.Grid_PedAtendidos.RowCount - 2);
  frm_painel_clientes.Panel_Analise.Caption := 'Pedidos Em Análise: ' +  IntToStr(frm_painel_clientes.Grid_PedAnalise.RowCount - 2);
  frm_painel_clientes.Panel_Parc_Faturado.Caption := 'Pedidos Parcialmente Faturados: ' +  IntToStr(frm_painel_clientes.Grid_PedParcFat.RowCount - 2);


end;

procedure OrdenarColunaDecrescente(StringGrid: TStringGrid; Coluna: Integer);
var
  i, j, k: Integer;
  Temp: string;
  TempNum, TempNum2: Double;
begin
  // Realizando uma ordenação bolha (Bubble Sort) para ordem decrescente
  for i := 0 to StringGrid.RowCount - 2 do
    for j := i + 1 to StringGrid.RowCount - 1 do
    begin
      // Tenta converter os valores para número, se possível
      if TryStrToFloat(StringGrid.Cells[Coluna, i], TempNum) and TryStrToFloat(StringGrid.Cells[Coluna, j], TempNum2) then
      begin
        // Se o número da linha j for maior que o da linha i, realiza a troca
        if TempNum2 > TempNum then
        begin
          // Trocar os valores das células para manter a consistência em todas as colunas
          for k := 0 to StringGrid.ColCount - 1 do
          begin
            Temp := StringGrid.Cells[k, i];
            StringGrid.Cells[k, i] := StringGrid.Cells[k, j];
            StringGrid.Cells[k, j] := Temp;
          end;
        end;
      end;
    end;
end;



procedure Tfrm_painel_clientes.Button1Click(Sender: TObject);
begin
   close
end;

procedure Tfrm_painel_clientes.FormCreate(Sender: TObject);
begin

// carregando as colunas da tabela composição
//     Grid_PedComposicao.Cells[0,0] := 'DATA';
        Grid_PedComposicao.Cells[1,0] := 'PEDIDO';
     Grid_PedComposicao.Cells[2,0] := 'CLIENTE';

 // carregando as colunas da tabela Caixa
//     Grid_PedCaixa.Cells[0,0] := 'DATA';
        Grid_PedCaixa.Cells[1,0] := 'PEDIDO';
     Grid_PedCaixa.Cells[2,0] := 'CLIENTE';

 // carregando as colunas da tabela Andamento
//     Grid_PedAndamento.Cells[0,0] := 'DATA';
        Grid_PedAndamento.Cells[1,0] := 'PEDIDO';
     Grid_PedAndamento.Cells[2,0] := 'CLIENTE';

 // carregando as colunas da tabela Atendimento
//     Grid_PedAtendidos.Cells[0,0] := 'DATA';
        Grid_PedAtendidos.Cells[1,0] := 'PEDIDO';
     Grid_PedAtendidos.Cells[2,0] := 'CLIENTE';

 // carregando as colunas da tabela Analise
//     Grid_PedAtendidos.Cells[0,0] := 'DATA';
        Grid_PedAnalise.Cells[1,0] := 'PEDIDO';
        Grid_PedAnalise.Cells[2,0] := 'CLIENTE';

 // carregando as colunas da tabela Parcialmente Faturado
//     Grid_PedAtendidos.Cells[0,0] := 'DATA';
        Grid_PedParcFat.Cells[1,0] := 'PEDIDO';
     Grid_PedParcFat.Cells[2,0] := 'CLIENTE';

    panel_letreiro.DoubleBuffered := true;
    Panel_Data_hora.DoubleBuffered := true;
    end;

procedure Tfrm_painel_clientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_ESCAPE) then
   begin
     if MessageDlg('Deseja fechar o Painel de Acompanhamento de Pedidos?',TMsgDlgType.mtConfirmation, [mbYes,MbNo],0) = Mryes then
     close
   end;
  begin
    if (key = VK_F11) then
     begin
       frm_painel_clientes.WindowState :=  wsNormal;
       frm_painel_clientes.BorderStyle :=  bsDialog;
     end;
  end;
 begin
    if (key = VK_F12) then
     begin
        Align := AlNone;
         AutoSize := False;
        WindowState := wsNormal;
       Top := 0;
        Left := 0;
           Width := Screen.Width;
            Height := Screen.Height;
          panel_letreiro.Left:=-(panel_letreiro.Width);
         frm_painel_clientes.WindowState := TWindowState.wsMaximized;
       frm_painel_clientes.BorderStyle :=   bsNone;
     end;
 end;
end;

procedure Tfrm_painel_clientes.FormShow(Sender: TObject);
begin
   Limpar_Grids;

// carregando as colunas da tabela composição
//     Grid_PedComposicao.Cells[0,0] := 'DATA';
     Grid_PedComposicao.Cells[0,0] := 'PEDIDO';
     Grid_PedComposicao.Cells[1,0] := 'CLIENTE';
     Grid_PedComposicao.ColWidths[0] := 75;
     Grid_PedComposicao.ColWidths[1] := 300;

 // carregando as colunas da tabela Caixa
//     Grid_PedCaixa.Cells[0,0] := 'DATA';
      Grid_PedCaixa.Cells[0,0] := 'PEDIDO';
      Grid_PedCaixa.Cells[1,0] := 'CLIENTE';
      Grid_PedCaixa.ColWidths[0] := 75;
      Grid_PedCaixa.ColWidths[1] := 300;


 // carregando as colunas da tabela Andamento
//     Grid_PedAndamento.Cells[0,0] := 'DATA';
      Grid_PedAndamento.Cells[0,0] := 'PEDIDO';
      Grid_PedAndamento.Cells[1,0] := 'CLIENTE';
      Grid_PedAndamento.ColWidths[0] := 75;
      Grid_PedAndamento.ColWidths[1] := 300;

 // carregando as colunas da tabela Atendimento
//     Grid_PedAtendidos.Cells[0,0] := 'DATA';
      Grid_PedAtendidos.Cells[0,0] := 'PEDIDO';
      Grid_PedAtendidos.Cells[1,0] := 'CLIENTE';
      Grid_PedAtendidos.ColWidths[0] := 75;
      Grid_PedAtendidos.ColWidths[1] := 300;


 // carregando as colunas da tabela Analise
//     Grid_PedAtendidos.Cells[0,0] := 'DATA';
      Grid_PedAnalise.Cells[0,0] := 'PEDIDO';
      Grid_PedAnalise.Cells[1,0] := 'CLIENTE';
      Grid_PedAnalise.ColWidths[0] := 75;
      Grid_PedAnalise.ColWidths[1] := 300;


 // carregando as colunas da tabela Parcialmente Faturado
//    Grid_PedAtendidos.Cells[0,0] := 'DATA';
      Grid_PedParcFat.Cells[0,0] := 'PEDIDO';
      Grid_PedParcFat.Cells[1,0] := 'CLIENTE';
      Grid_PedParcFat.ColWidths[0] := 75;
      Grid_PedParcFat.ColWidths[1] := 300;


  LoadCSVFile(Form1.path_txt);
end;

procedure Tfrm_painel_clientes.Grid_PedAndamentoDrawCell(Sender: TObject; ACol,
  ARow: LongInt; Rect: TRect; State: TGridDrawState);
begin
    // carregando os tamanhos das celulas
//       Grid_PedAndamento.ColWidths[0] := 70;
          Grid_PedAndamento.ColWidths[0] := 75;
       Grid_PedAndamento.ColWidths[1] := 300;
end;

procedure Tfrm_painel_clientes.Grid_PedAtendidosDrawCell(Sender: TObject; ACol,
  ARow: LongInt; Rect: TRect; State: TGridDrawState);
begin
    // carregando os tamanhos das celulas
//       Grid_PedAtendidos.ColWidths[0] := 70;
          Grid_PedAtendidos.ColWidths[0] := 75;
       Grid_PedAtendidos.ColWidths[1] := 300;
end;

procedure Tfrm_painel_clientes.Grid_PedCaixaDrawCell(Sender: TObject; ACol,
  ARow: LongInt; Rect: TRect; State: TGridDrawState);
begin
    // carregando os tamanhos das celulas
//       Grid_PedCaixa.ColWidths[0] := 70;
          Grid_PedCaixa.ColWidths[0] := 75;
       Grid_PedCaixa.ColWidths[1] := 300;

end;

procedure Tfrm_painel_clientes.Grid_PedComposicaoDrawCell(Sender: TObject; ACol,
      ARow: LongInt; Rect: TRect; State: TGridDrawState);
begin
      // carregando os tamanhos das celulas
//       Grid_PedComposicao.ColWidths[0] := 70;
          Grid_PedComposicao.ColWidths[0] := 75;
       Grid_PedComposicao.ColWidths[1] := 300;

end;

procedure Tfrm_painel_clientes.Grid_PedParcFatDrawCell(Sender: TObject; ACol,
  ARow: LongInt; Rect: TRect; State: TGridDrawState);
begin
        // carregando os tamanhos das celulas
//       Grid_PedComposicao.ColWidths[0] := 70;
         Grid_PedAnalise.ColWidths[0] := 75;
         Grid_PedAnalise.ColWidths[1] := 300;
end;

procedure Tfrm_painel_clientes.Grid_PedAnaliseDrawCell(Sender: TObject; ACol,
  ARow: LongInt; Rect: TRect; State: TGridDrawState);
begin
         // carregando os tamanhos das celulas
//       Grid_PedComposicao.ColWidths[0] := 70;
          Grid_PedParcFat.ColWidths[0] := 60;
       Grid_PedParcFat.ColWidths[1] := 200;
end;

procedure Tfrm_painel_clientes.Timer_data_horaTimer(Sender: TObject);
begin
   saudacao;

end;

procedure Tfrm_painel_clientes.Timer_funcoesTimer(Sender: TObject);
begin
  Limpar_Grids;
  LoadCSVFile(Form1.path_txt);

// carregando as colunas da tabela composição
//     Grid_PedComposicao.Cells[0,0] := 'DATA';
     Grid_PedComposicao.Cells[0,0] := 'PEDIDO';
     Grid_PedComposicao.Cells[1,0] := 'CLIENTE';
     Grid_PedComposicao.ColWidths[0] := 75;
     Grid_PedComposicao.ColWidths[1] := 300;

 // carregando as colunas da tabela Caixa
//     Grid_PedCaixa.Cells[0,0] := 'DATA';
      Grid_PedCaixa.Cells[0,0] := 'PEDIDO';
      Grid_PedCaixa.Cells[1,0] := 'CLIENTE';
      Grid_PedCaixa.ColWidths[0] := 75;
      Grid_PedCaixa.ColWidths[1] := 300;


 // carregando as colunas da tabela Andamento
//     Grid_PedAndamento.Cells[0,0] := 'DATA';
      Grid_PedAndamento.Cells[0,0] := 'PEDIDO';
      Grid_PedAndamento.Cells[1,0] := 'CLIENTE';
      Grid_PedAndamento.ColWidths[0] := 75;
      Grid_PedAndamento.ColWidths[1] := 300;

 // carregando as colunas da tabela Atendimento
//     Grid_PedAtendidos.Cells[0,0] := 'DATA';
      Grid_PedAtendidos.Cells[0,0] := 'PEDIDO';
      Grid_PedAtendidos.Cells[1,0] := 'CLIENTE';
      Grid_PedAtendidos.ColWidths[0] := 75;
      Grid_PedAtendidos.ColWidths[1] := 300;


 // carregando as colunas da tabela Faturado
//     Grid_PedAtendidos.Cells[0,0] := 'DATA';
      Grid_PedAnalise.Cells[0,0] := 'PEDIDO';
      Grid_PedAnalise.Cells[1,0] := 'CLIENTE';
      Grid_PedAnalise.ColWidths[0] := 75;
      Grid_PedAnalise.ColWidths[1] := 300;


 // carregando as colunas da tabela Parcialmente Faturado
//    Grid_PedAtendidos.Cells[0,0] := 'DATA';
      Grid_PedParcFat.Cells[0,0] := 'PEDIDO';
      Grid_PedParcFat.Cells[1,0] := 'CLIENTE';
      Grid_PedParcFat.ColWidths[0] := 75;
      Grid_PedParcFat.ColWidths[1] := 300;


  //ordenando Grids em ordem descresente
  OrdenarColunaDecrescente(Grid_PedComposicao, 0);
  OrdenarColunaDecrescente(Grid_PedAndamento, 0);
  OrdenarColunaDecrescente(Grid_PedCaixa, 0);
  OrdenarColunaDecrescente(Grid_PedAtendidos, 0);
  OrdenarColunaDecrescente(Grid_PedAnalise, 0);
  OrdenarColunaDecrescente(Grid_PedParcFat, 0);

end;

procedure Tfrm_painel_clientes.Timer_LetreiroTimer(Sender: TObject);
begin
 //  colocar aqui o caminho capturado pela a variavel letreiro
   lb_letreiro.Caption := Form1.Msgdo_Letreiro;

   if lb_letreiro.left >= -(lb_letreiro.Width) then
        lb_letreiro.left:=lb_letreiro.left-1
        else
      lb_letreiro.left := panel_letreiro.width;
end;

end.
