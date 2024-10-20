object FormOrderList: TFormOrderList
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Lista de Pedido'
  ClientHeight = 442
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object GroupBoxCliente: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 782
    Height = 80
    Align = alTop
    Caption = 'Cliente'
    TabOrder = 0
    ExplicitWidth = 778
    object PanelCliente: TPanel
      AlignWithMargins = True
      Left = 2
      Top = 17
      Width = 778
      Height = 55
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 774
      object PanelCliente_1: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 100
        Height = 55
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object LabelCliente_1: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 94
          Height = 15
          Align = alTop
          Caption = 'C'#243'digo'
          ExplicitWidth = 39
        end
        object DBTextCOD_CLIENTE: TDBText
          AlignWithMargins = True
          Left = 3
          Top = 24
          Width = 94
          Height = 17
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitLeft = 6
          ExplicitTop = 32
        end
      end
      object PanelCliente_2: TPanel
        AlignWithMargins = True
        Left = 100
        Top = 0
        Width = 408
        Height = 55
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 404
        object LabelCliente_2: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 402
          Height = 15
          Align = alTop
          Caption = 'Nome'
          ExplicitWidth = 33
        end
        object DBTextNOM_CLIENTE: TDBText
          AlignWithMargins = True
          Left = 3
          Top = 24
          Width = 402
          Height = 17
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitLeft = 176
          ExplicitWidth = 65
        end
      end
      object PanelCliente_4: TPanel
        AlignWithMargins = True
        Left = 708
        Top = 0
        Width = 70
        Height = 55
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 3
        ExplicitLeft = 704
        object LabelCliente_4: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 64
          Height = 15
          Align = alTop
          Caption = 'UF'
          ExplicitWidth = 14
        end
        object DBTextCOD_UF: TDBText
          AlignWithMargins = True
          Left = 3
          Top = 24
          Width = 64
          Height = 17
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitLeft = 8
          ExplicitTop = 33
          ExplicitWidth = 62
        end
      end
      object PanelCliente_3: TPanel
        AlignWithMargins = True
        Left = 508
        Top = 0
        Width = 200
        Height = 55
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitLeft = 504
        object LabelCliente_3: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 194
          Height = 15
          Align = alTop
          Caption = 'Cidade'
          ExplicitWidth = 37
        end
        object DBTextNOM_CIDADE: TDBText
          AlignWithMargins = True
          Left = 3
          Top = 24
          Width = 194
          Height = 17
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitLeft = 8
          ExplicitTop = 33
          ExplicitWidth = 192
        end
      end
    end
  end
  object PanelBotton: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 379
    Width = 782
    Height = 60
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 378
    ExplicitWidth = 778
    object BitBtnSelectOrder: TBitBtn
      AlignWithMargins = True
      Left = 649
      Top = 3
      Width = 130
      Height = 54
      Cursor = crHandPoint
      Align = alRight
      Caption = 'Selecionar'
      Default = True
      Glyph.Data = {
        36100000424D3610000000000000360000002800000020000000200000000100
        2000000000000010000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000002000309290144145802901B7A02C8209103ED239B03FE239C03FE2191
        03ED1C7B02C9145902920A2B0146000200030000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000010200040E3F
        01661F8803DE239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF1F8A03E10F41016B01030005000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000061A012A1C7E02CE239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF1D8102D2061C012E0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000A2E014B219503F3239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF229603F50B32
        0152000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000A2E014B229903FA239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239A
        03FB0B3201520000000000000000000000000000000000000000000000000000
        0000000000000000000006190029219403F3239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF229603F5061C012F00000000000000000000000000000000000000000000
        000000000000000200031C7D02CC239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF95CF85FF8ECC7EFF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF1D8103D201030005000000000000000000000000000000000000
        0000000000000E3C0163239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF95CF85FFFFFFFFFFFFFFFFFF7CC469FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF0F41016B000000000000000000000000000000000000
        0000000100021E8603DB239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF95CF85FFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFDFF6CBD56FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF1F8A03E1000200030000000000000000000000000000
        00000926013F239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF95CF85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FCF8FF5DB6
        46FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF0A2B01470000000000000000000000000000
        00001354028A239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF95CF
        85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4FA
        F2FF50B037FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF145902920000000000000000000000000000
        00001A7602C1239C03FF239C03FF239C03FF239C03FF239C03FF95CF85FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFEDF7EAFF45AB2AFF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF1C7B02C90000000000000000000000000000
        0000208C03E5239C03FF239C03FF239C03FF239C03FF239C03FF8ECC7DFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF8ECC7DFF97D088FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE4F3E0FF3BA71EFF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF219103ED0000000000000000000000000000
        0000229703F7239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF8ECC
        7DFFFFFFFFFFFFFFFFFF8ECC7DFF239C03FF249C04FFAFDBA3FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFDAEED5FF33A315FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FE0000000000000000000000000000
        0000229603F6239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF8ECC7DFF8ECC7DFF239C03FF239C03FF239C03FF289E08FFC4E4BBFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFCEE9C7FF2CA00EFF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239B03FE0000000000000000000000000000
        0000208C03E5239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF2EA110FFD5EC
        CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1E3B7FF289E08FF239C03FF239C
        03FF239C03FF239C03FF239C03FF219103ED0000000000000000000000000000
        00001A7502C0239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF38A6
        1BFFE4F3E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2DCA6FF249D05FF239C
        03FF239C03FF239C03FF239C03FF1B7A02C80000000000000000000000000000
        000013530288239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF45AB2AFFEFF8EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1D593FF239C
        03FF239C03FF239C03FF239C03FF145802900000000000000000000000000000
        00000825013C239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF55B33DFFF7FCF6FFFFFFFFFFFFFFFFFFFFFFFFFF8ECC7DFF239C
        03FF239C03FF239C03FF239C03FF092901440000000000000000000000000000
        0000000100011E8403D7239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF69BB53FFFDFEFDFFFFFFFFFF8ECC7DFF239C03FF239C
        03FF239C03FF239C03FF1E8803DE000200030000000000000000000000000000
        0000000000000D3A015F239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF7FC56CFF8ECC7DFF239C03FF239C03FF239C
        03FF239C03FF239C03FF0E3F0166000000000000000000000000000000000000
        000000000000000100021B7A02C7239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF1C7E03CE00020004000000000000000000000000000000000000
        0000000000000000000005170025219303F0239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF219503F3061A002A00000000000000000000000000000000000000000000
        0000000000000000000000000000092A0145229803F8239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF2299
        03FA0A2E014B0000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000092A0145219303F0239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF219403F30A2E
        014B000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000051700251B7A02C7239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF239C03FF239C03FF1C7D02CC061901290000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000100020D3A
        015E1E8403D7239C03FF239C03FF239C03FF239C03FF239C03FF239C03FF239C
        03FF239C03FF239C03FF239C03FF1E8603DB0E3C016300020003000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000100010824013C135302881A7502C01F8C03E5229703F6229703F6208C
        03E51B7602C21354028A0926013E000100020000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ModalResult = 1
      TabOrder = 0
      OnClick = BitBtnSelectOrderClick
      ExplicitLeft = 645
    end
  end
  object DBGridOrder: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 89
    Width = 782
    Height = 284
    Align = alClient
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_PEDIDO_VENDA'
        Title.Caption = 'N'#250'mero'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DAT_EMISSAO'
        Title.Caption = 'Data de Emiss'#227'o'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_TOTAL'
        Title.Caption = '$ Total'
        Width = 120
        Visible = True
      end>
  end
end