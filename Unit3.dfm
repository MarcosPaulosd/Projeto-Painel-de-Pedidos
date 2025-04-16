object frm_painel_clientes: Tfrm_painel_clientes
  Left = 0
  Top = 0
  Align = alClient
  AutoSize = True
  BiDiMode = bdRightToLeftNoAlign
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Painel'
  ClientHeight = 1920
  ClientWidth = 2510
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  ParentBiDiMode = False
  Position = poDesigned
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 2510
    Height = 1920
    Align = alClient
    Color = clDarkorange
    ParentBackground = False
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 2508
      Height = 128
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 2
        Top = 132
        Width = 2504
        Height = 39
        Align = alTop
        Alignment = taCenter
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -35
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 10
      end
      object Label2: TLabel
        Left = 2
        Top = 17
        Width = 2504
        Height = 115
        Align = alTop
        Alignment = taCenter
        Caption = 'NOVAMALHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -96
        Font.Name = 'Roboto Cn'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 505
      end
    end
    object panel_letreiro: TPanel
      Left = 1
      Top = 129
      Width = 2508
      Height = 41
      Align = alTop
      BevelKind = bkFlat
      Color = clDarkblue
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -24
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object lb_letreiro: TLabel
        Left = 0
        Top = 0
        Width = 7
        Height = 29
        Alignment = taCenter
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object Panel_Data_hora: TPanel
      Left = 1
      Top = 1879
      Width = 2508
      Height = 40
      Align = alBottom
      BevelKind = bkFlat
      Color = clOrange
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
    object GroupBox6: TGroupBox
      Left = 1
      Top = 217
      Width = 2508
      Height = 1662
      Align = alClient
      TabOrder = 3
      object GroupBox5: TGroupBox
        Left = 1045
        Top = 17
        Width = 263
        Height = 1643
        TabOrder = 0
        object Panel_Atendidos: TPanel
          Left = 2
          Top = 17
          Width = 259
          Height = 34
          Align = alTop
          BevelKind = bkFlat
          BiDiMode = bdLeftToRight
          Caption = 'Pedidos: Atendidos'
          Color = clDarkblue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
        end
        object Grid_PedAtendidos: TStringGrid
          Left = 2
          Top = 51
          Width = 259
          Height = 1590
          Align = alClient
          ColCount = 2
          DefaultColWidth = 200
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          GridLineWidth = 10
          ParentFont = False
          ScrollBars = ssNone
          TabOrder = 1
          OnDrawCell = Grid_PedAtendidosDrawCell
          RowHeights = (
            24
            20
            15
            25
            23)
        end
      end
      object GroupBox2: TGroupBox
        Left = 761
        Top = 17
        Width = 286
        Height = 1643
        TabOrder = 1
        object Grid_PedCaixa: TStringGrid
          Left = 2
          Top = 51
          Width = 282
          Height = 1590
          Align = alClient
          ColCount = 2
          DefaultColWidth = 200
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          GridLineWidth = 10
          ParentFont = False
          ScrollBars = ssNone
          TabOrder = 0
          OnDrawCell = Grid_PedCaixaDrawCell
          RowHeights = (
            24
            24
            24
            24
            23)
        end
        object Panel_Caixa: TPanel
          Left = 2
          Top = 17
          Width = 282
          Height = 34
          Align = alTop
          BevelKind = bkFlat
          BiDiMode = bdLeftToRight
          Caption = 'Aguardando Pagamento (Dirija se ao Caixa)'
          Color = clDarkblue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = -2
        Top = 17
        Width = 254
        Height = 1643
        TabOrder = 2
        object Grid_PedComposicao: TStringGrid
          Left = 2
          Top = 51
          Width = 250
          Height = 1590
          Align = alClient
          ColCount = 2
          DefaultColWidth = 200
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          GridLineWidth = 10
          ParentFont = False
          ScrollBars = ssNone
          TabOrder = 0
          OnDrawCell = Grid_PedComposicaoDrawCell
          RowHeights = (
            24
            24
            24
            24
            24)
        end
        object painel_comp: TPanel
          Left = 2
          Top = 17
          Width = 250
          Height = 34
          Align = alTop
          BevelKind = bkFlat
          BiDiMode = bdLeftToRight
          Caption = 'Pedidos:  Em Composi'#231#227'o'
          Color = clDarkblue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
      end
      object GroupBox4: TGroupBox
        Left = 497
        Top = 17
        Width = 269
        Height = 1643
        TabOrder = 3
        object Grid_PedAndamento: TStringGrid
          Left = 2
          Top = 51
          Width = 265
          Height = 1590
          Align = alClient
          ColCount = 2
          DefaultColWidth = 200
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          GridLineWidth = 10
          ParentFont = False
          ScrollBars = ssNone
          TabOrder = 0
          OnDrawCell = Grid_PedAndamentoDrawCell
          ColWidths = (
            200
            200)
          RowHeights = (
            24
            24
            24
            24
            23)
        end
        object Panel_Andamento: TPanel
          Left = 2
          Top = 17
          Width = 265
          Height = 34
          Align = alTop
          BevelKind = bkFlat
          BiDiMode = bdLeftToRight
          Caption = 'Pedidos: Em Andamento'
          Color = clDarkblue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
      end
      object GroupBox7: TGroupBox
        Left = 1305
        Top = 17
        Width = 295
        Height = 1643
        TabOrder = 4
        object Grid_PedParcFat: TStringGrid
          Left = 2
          Top = 51
          Width = 291
          Height = 1590
          Align = alClient
          ColCount = 2
          DefaultColWidth = 200
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          GridLineWidth = 10
          ParentFont = False
          ScrollBars = ssNone
          TabOrder = 0
          OnDrawCell = Grid_PedParcFatDrawCell
          RowHeights = (
            24
            24
            24
            24
            23)
        end
        object Panel_Parc_Faturado: TPanel
          Left = 2
          Top = 17
          Width = 291
          Height = 34
          Align = alTop
          BevelKind = bkFlat
          BiDiMode = bdLeftToRight
          Caption = 'Parc Faturado'
          Color = clDarkblue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
      end
      object GroupBox8: TGroupBox
        Left = 249
        Top = 17
        Width = 254
        Height = 1643
        TabOrder = 5
        object Grid_PedAnalise: TStringGrid
          Left = 2
          Top = 51
          Width = 250
          Height = 1590
          Align = alClient
          Anchors = [akLeft, akTop, akBottom]
          ColCount = 2
          DefaultColWidth = 200
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          GridLineWidth = 10
          ParentFont = False
          ScrollBars = ssNone
          TabOrder = 0
          OnDrawCell = Grid_PedAnaliseDrawCell
          ExplicitLeft = 5
          ExplicitTop = 54
          ExplicitWidth = 324
          ExplicitHeight = 1584
          RowHeights = (
            24
            24
            24
            24
            23)
        end
        object Panel_Analise: TPanel
          Left = 2
          Top = 17
          Width = 250
          Height = 34
          Align = alTop
          BevelKind = bkFlat
          BiDiMode = bdLeftToRight
          Caption = 'Pedido em an'#225'lise'
          Color = clDarkblue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          ExplicitWidth = 330
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 170
      Width = 2508
      Height = 47
      Align = alTop
      Color = clDarkorange
      ParentBackground = False
      TabOrder = 4
      object Label3: TLabel
        Left = 1
        Top = 1
        Width = 2506
        Height = 44
        Align = alTop
        Alignment = taCenter
        Caption = 'ACOMPANHE O SEU PEDIDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -37
        Font.Name = 'Roboto Cn'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 415
      end
    end
  end
  object Timer_Letreiro: TTimer
    Interval = 1
    OnTimer = Timer_LetreiroTimer
    Left = 209
    Top = 41
  end
  object Timer_data_hora: TTimer
    Interval = 1
    OnTimer = Timer_data_horaTimer
    Left = 305
    Top = 41
  end
  object Timer_funcoes: TTimer
    Interval = 30000
    OnTimer = Timer_funcoesTimer
    Left = 425
    Top = 41
  end
end
