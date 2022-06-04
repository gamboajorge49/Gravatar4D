object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Gravatar for Delphi'
  ClientHeight = 309
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 309
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlMain'
    ShowCaption = False
    TabOrder = 0
    ExplicitLeft = 288
    ExplicitTop = 208
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Image1: TImage
      AlignWithMargins = True
      Left = 295
      Top = 3
      Width = 326
      Height = 303
      Align = alClient
      ExplicitLeft = 392
      ExplicitTop = 56
      ExplicitWidth = 105
      ExplicitHeight = 105
    end
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 286
      Height = 303
      Align = alLeft
      TabOrder = 0
      object Label1: TLabel
        Left = 9
        Top = 151
        Width = 44
        Height = 15
        Caption = 'Size (Px)'
      end
      object Label2: TLabel
        Left = 9
        Top = 53
        Width = 38
        Height = 15
        Caption = 'Default'
      end
      object Label3: TLabel
        Left = 147
        Top = 53
        Width = 34
        Height = 15
        Caption = 'Rating'
      end
      object lbEmail: TLabeledEdit
        Left = 9
        Top = 24
        Width = 268
        Height = 23
        EditLabel.Width = 29
        EditLabel.Height = 15
        EditLabel.Caption = 'Email'
        TabOrder = 0
        Text = ''
      end
      object btnGererate: TButton
        Left = 104
        Top = 264
        Width = 75
        Height = 25
        Caption = 'Generate'
        TabOrder = 1
        OnClick = btnGererateClick
      end
      object CheckBox1: TCheckBox
        Left = 9
        Top = 202
        Width = 97
        Height = 17
        Caption = 'Center'
        TabOrder = 2
        OnClick = CheckBox1Click
      end
      object chStretch: TCheckBox
        Left = 9
        Top = 225
        Width = 97
        Height = 17
        Caption = 'Stretch'
        TabOrder = 3
        OnClick = chStretchClick
      end
      object SpinEdit1: TSpinEdit
        Left = 9
        Top = 169
        Width = 121
        Height = 24
        MaxValue = 99999
        MinValue = 80
        TabOrder = 4
        Value = 80
      end
      object cbDefault: TComboBox
        Left = 9
        Top = 72
        Width = 130
        Height = 25
        Style = csOwnerDrawFixed
        ItemHeight = 19
        TabOrder = 5
        OnChange = cbDefaultChange
      end
      object cbRating: TComboBox
        Left = 147
        Top = 72
        Width = 130
        Height = 25
        Style = csOwnerDrawFixed
        ItemHeight = 19
        TabOrder = 6
      end
      object leDefault: TLabeledEdit
        Left = 9
        Top = 118
        Width = 268
        Height = 23
        EditLabel.Width = 56
        EditLabel.Height = 15
        EditLabel.Caption = 'Url Default'
        Enabled = False
        TabOrder = 7
        Text = ''
      end
    end
  end
end
