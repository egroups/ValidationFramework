object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 462
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbNome: TLabel
    Left = 20
    Top = 11
    Width = 32
    Height = 13
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbErrorMessage: TLabel
    Left = 21
    Top = 44
    Width = 54
    Height = 13
    Caption = 'Nome Error'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object Label1: TLabel
    Left = 20
    Top = 65
    Width = 33
    Height = 13
    Caption = 'Idade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbIdadeError: TLabel
    Left = 21
    Top = 102
    Width = 55
    Height = 13
    Caption = 'Idade Error'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object lbFilhos: TLabel
    Left = 149
    Top = 65
    Width = 32
    Height = 13
    Caption = 'Filhos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbFilhosError: TLabel
    Left = 149
    Top = 102
    Width = 54
    Height = 13
    Caption = 'Filhos Error'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object lbCasadoError: TLabel
    Left = 301
    Top = 102
    Width = 63
    Height = 13
    Caption = 'Casado Error'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object lbEmail: TLabel
    Left = 21
    Top = 120
    Width = 35
    Height = 13
    Caption = 'E-mail'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbEmailError: TLabel
    Left = 22
    Top = 153
    Width = 51
    Height = 13
    Caption = 'Email Error'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object Label2: TLabel
    Left = 21
    Top = 170
    Width = 49
    Height = 13
    Caption = 'Telefone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTelefoneError: TLabel
    Left = 20
    Top = 204
    Width = 69
    Height = 13
    Caption = 'Telefone Error'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object editNome: TEdit
    Left = 21
    Top = 23
    Width = 345
    Height = 21
    CustomHint = BalloonHint1
    TabOrder = 0
  end
  object btnSalvar: TButton
    Left = 291
    Top = 429
    Width = 75
    Height = 25
    Caption = 'Salvar'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnSalvarClick
  end
  object editIdade: TEdit
    Left = 21
    Top = 80
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 2
  end
  object editFilhos: TEdit
    Left = 149
    Top = 80
    Width = 137
    Height = 21
    NumbersOnly = True
    TabOrder = 3
  end
  object ckCasado: TCheckBox
    Left = 301
    Top = 77
    Width = 65
    Height = 17
    Caption = 'Casado(a)'
    TabOrder = 4
  end
  object editEmail: TEdit
    Left = 21
    Top = 133
    Width = 345
    Height = 21
    TabOrder = 5
  end
  object editTelefone: TEdit
    Left = 21
    Top = 183
    Width = 345
    Height = 21
    TabOrder = 6
  end
  object Memo1: TMemo
    Left = 21
    Top = 240
    Width = 345
    Height = 169
    TabOrder = 7
  end
  object BalloonHint1: TBalloonHint
    Left = 32
    Top = 424
  end
end
