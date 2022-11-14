unit hsoftpdv.view.main;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TMyPanel = class(TPanel)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TMyButton = class(TPanel)
  private
    FButton        : TSpeedButton;
    FButtonCaption : string;
    FButtonName    : string;
    FButtonOnClick : TNotifyEvent;
    FShape         : TShape;
    FShapeColor    : TColor;
    procedure SetButtonCaption(const Value: string);
    procedure SetButtonName(const Value: string);
    procedure SetButtonOnClick(const Value: TNotifyEvent);
    procedure SetShapeColor(const Value: TColor);
  public
    constructor Create(AOwner: TComponent); override;
    property ButtonCaption: string read FButtonCaption write SetButtonCaption;
    property ButtonName: string read FButtonName write SetButtonName;
    property ButtonOnClick: TNotifyEvent read FButtonOnClick write SetButtonOnClick;
    property ShapeColor: TColor read FShapeColor write SetShapeColor;
  end;

  TMyLabel = class(TPanel)
  private
    FDescription        : TLabel;
    FValue              : TLabel;
    FShape              : TShape;
    FShapeColor         : TColor;
    FDescriptionCaption : TCaption;
    FValueCaption       : TCaption;
    procedure SetShapeColor(const Value: TColor);
    procedure SetDescriptionCaption(const Value: TCaption);
    procedure SetValueCaption(const Value: TCaption);
  public
    constructor Create(AOwner: TComponent); override;
    property BackgroundColor: TColor read FShapeColor write SetShapeColor;
    property Caption: TCaption read FDescriptionCaption write SetDescriptionCaption;
    property Value: TCaption read FValueCaption write SetValueCaption;
  end;

  TMain = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PanelClick(Sender: TObject);

  private
    { Private declarations }
    FBtnCustomer    : TMyButton;
    FBtnDevolution  : TMyButton;
    FBtnItemCancel  : TMyButton;
    FBtnOrderCancel : TMyButton;
    FBtnOthers      : TMyButton;
    FBtnPayment     : TMyButton;
    FBtnProduct     : TMyButton;
    FButtonsPadding : TPadding;
    FButtons        : TPanel;
    FClient         : TPanel;
    FContainer      : TPanel;
    FGrid           : TPanel;
    FH1             : TFont;
    FTitle          : TPanel;
    FValues         : TPanel;
    FVlTotal        : TMyLabel;

    procedure CustomerSelect;
    procedure ProductFind;
    procedure ItemCancel;
    procedure OrderCancel;
    procedure Payment;
    procedure Devolution;
    procedure Others;
  public
    { Public declarations }
    PanelsCreated: integer;
    ButtonsCreated: integer;
    LabelsCreated: integer;
  end;

var
  Main: TMain;

implementation

uses
  System.UITypes;

{$R *.dfm}

procedure TMain.PanelClick(Sender: TObject);
var
vName: string;
begin
  if Sender is TPanel then
    vName := TPanel(Sender).Name;
  if Sender is TSpeedButton then
    vName := TSpeedButton(Sender).Name;

  ShowMessage(Format('%s - %s', [vName, TPanel(Sender).Caption]));
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  with Self do
  begin
    Caption := 'HSoft PDV';
    ClientHeight := 730;
    ClientWidth := 1124;
    Position := poDesktopCenter;
    try
      FContainer := TMyPanel.Create(Main);
      FH1 := TFont.Create();
      with FH1 do
      begin
        Name := 'Roboto';
        Size := 20;
        Color := clWhite;
      end;
      FTitle := TMyPanel.Create(FContainer);
      with FTitle do
      begin
        Name := 'pnlTitle';
        Caption := 'Caixa Aberto';
        Align := alTop;
        Color := clHighlight;
        Height := 60;
        Parent := FContainer;
        Font := FH1;
      end;
      FButtonsPadding := TPadding.Create(FButtons);
      with FButtonsPadding do
      begin
        Bottom := 10;
        Left := 5;
        Right := 5;
        Top := 10;
      end;
      {$region 'buttons'}
      FButtons := TMyPanel.Create(FContainer);
      with FButtons do
      begin
        Align := alBottom;
        Caption := '';
        Color := clGradientInactiveCaption;
        Height := 100;
        Name := 'pnlButtons';
        Padding := FButtonsPadding;
        Parent := FContainer;
      end;

      FBtnCustomer := TMyButton.Create(FButtons);
      with FBtnCustomer do
      begin
        ButtonCaption := 'Selecionar Cliente [F1]';
        ButtonName := 'btnCustomer';
        ButtonOnClick := Main.PanelClick;
        Parent := FButtons;
      end;
      FBtnProduct := TMyButton.Create(FButtons);
      with FBtnProduct do
      begin
        ButtonCaption := 'Consultar Produtos [F2]';
        ButtonName := 'btnProduct';
        ButtonOnClick := Main.PanelClick;
        Parent := FButtons;
      end;
      FBtnPayment := TMyButton.Create(FButtons);
      with FBtnPayment do
      begin
        ButtonCaption := 'Pagamento [F4]';
        ButtonName := 'btnPayment';
        ButtonOnClick := Main.PanelClick;
        Parent := FButtons;
      end;
      FBtnItemCancel := TMyButton.Create(FButtons);
      with FBtnItemCancel do
      begin
        ButtonCaption := 'Cancelar Item [F6]';
        ButtonName := 'btnItemCancel';
        ButtonOnClick := Main.PanelClick;
        Parent := FButtons;
      end;
      FBtnOrderCancel := TMyButton.Create(FButtons);
      with FBtnOrderCancel do
      begin
        ButtonCaption := 'Cancelar Ordem [F7]';
        ButtonName := 'btnOrderCancel';
        ButtonOnClick := Main.PanelClick;
        Parent := FButtons;
      end;
      FBtnDevolution := TMyButton.Create(FButtons);
      with FBtnDevolution do
      begin
        ButtonCaption := 'Devolução [F8]';
        ButtonName := 'btnDevolution';
        ButtonOnClick := Main.PanelClick;
        Parent := FButtons;
      end;
      FBtnOthers := TMyButton.Create(FButtons);
      with FBtnOthers do
      begin
        ButtonCaption := 'Outros [F12]';
        ButtonName := 'btnOthers';
        ButtonOnClick := Main.PanelClick;
        Parent := FButtons;
      end;
      {$endregion}
      FClient := TMyPanel.Create(FContainer);
      with FClient do
      begin
        Name := 'pnlClient';
        Parent := FContainer;
      end;
      {$region 'values'}
      FValues := TMyPanel.Create(FClient);
      with FValues do
      begin
        Align   := alRight;
        Width   := 400;
        Caption := 'Valor';
        Color   := clGradientInactiveCaption;
        Name    := 'pnlValor';
        Parent  := FClient;
      end;
      FVlTotal := TMyLabel.Create(FValues);
      with FVlTotal do
      begin
        Name            := 'pnlTotal';
        Caption         := 'Total';
        Value           := '61,90';
        { TODO -oHads -cMelhorar: Nome e comportamento das propriedades de cores }
        Color           := clGradientInactiveCaption;
        BackgroundColor := clHighlight;
        Height          := 100;
        Parent          := FValues;
      end;
      {$endregion}
      {$region 'grid'}
      FGrid := TMyPanel.Create(FClient);
      with FGrid do
      begin
        Caption := 'Grid';
        Color := clWindow;
        Name := 'pnlGrid';
        Parent := FClient;
      end;
      {$endregion}

    except
      on E: Exception do
        ShowMessage(Format('Erro: %s - %s', [e.Message, e.StackTrace]));
    end;
  end;
end;

procedure TMain.FormDestroy(Sender: TObject);
//var i: Integer;
begin
  { TODO -oHads -cNao_Esquecer: Melhorar laço para liberar todos componentes criados }
//  for i := 0 to Self.ComponentCount - 1 do
//    if Assigned(Self.Components[i]) then
//      FreeAndNil(Self.Components[i]);

  if Assigned(FH1) then
    FreeAndNil(FH1);
end;

{$region 'Atalhos'}
procedure TMain.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    vkEscape : Application.Terminate;
    vkF1     : CustomerSelect;
    vkF2     : ProductFind;
    vkF4     : Payment;
    vkF6     : ItemCancel;
    vkF7     : OrderCancel;
    vkF8     : Devolution;
    vkF12    : Others;
  end;

end;

procedure TMain.CustomerSelect;
begin
  ShowMessage(Format('%s - %s', [Self.ClassName, 'CustomerSelect']));
end;

procedure TMain.ProductFind;
begin
  //
end;

procedure TMain.Payment;
begin
  //
end;

procedure TMain.ItemCancel;
begin
  //
end;

procedure TMain.OrderCancel;
begin
  //
end;

procedure TMain.Devolution;
begin
  //
end;

procedure TMain.Others;
begin
  //
end;
{$endregion}

{$region 'TMyPanel'}
constructor TMyPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  inc(Main.PanelsCreated);
  with Self do
  begin
    Align            := TAlign.alClient;
    BevelOuter       := TBevelCut.bvNone;
    Color            := clDefault;
    Height           := 6;
    Name             := Format('MyPanel_%d', [Main.PanelsCreated]);
    OnClick          := Main.PanelClick;
    Parent           := Main;
    ParentBackground := false;
  end;
end;
{$endregion}

{$region 'TMyButton'}
constructor TMyButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  with Self do
  begin
    Align            := alLeft;
    AlignWithMargins := true;
    BevelOuter       := TBevelCut.bvNone;
    ParentColor      := true;
    Margins.Right    := 5;
    Parent           := Main;
    ParentBackground := false;
    Width := 151;

    FShape := TShape.Create(Self);
    with FShape do
    begin
      Align       := alClient;
      Brush.Color := clBtnFace;
      Shape       := stRoundRect;
      Pen.Style   := psClear;
      Parent      := Self;
    end;

    FButton := TSpeedButton.Create(Self);
    with FButton do
    begin
      inc(Main.ButtonsCreated);
      Align := alClient;
      Flat := true;
      Name := Format('MyButton_%d', [Main.ButtonsCreated]);
      Parent := Self;
    end;
  end;
end;

procedure TMyButton.SetButtonCaption(const Value: string);
begin
  FButton.Caption := Value;
end;

procedure TMyButton.SetButtonName(const Value: string);
begin
  FButton.Name := Value;
end;

procedure TMyButton.SetButtonOnClick(const Value: TNotifyEvent);
begin
  FButton.OnClick := Value;
end;

procedure TMyButton.SetShapeColor(const Value: TColor);
begin
  FShape.Brush.Color := Value;
end;
{$endregion}

{$region 'TMyLabel'}
constructor TMyLabel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  inc(Main.LabelsCreated);
  with Self do
  begin
    Align            := TAlign.alBottom;
    BevelOuter       := TBevelCut.bvNone;
    Caption          := '';
    Color            := clDefault;
    with Padding do
    begin
      Left   := 10;
      Right  := 10;
      Bottom := 5;
      Top    := 5;
    end;
    Parent           := Main;
    ParentBackground := false;

    FDescription := TLabel.Create(Self);
    with FDescription do
    begin
      Align       := alTop;
      AutoSize    := false;
      Color       := clCream;
      with Font do
      begin
        Name := 'Roboto';
        Size := 12;
      end;
      Height      := 30;
      Layout      := TTextLayout.tlCenter;
      Name        := Format('MyLblDescription_%d', [Main.LabelsCreated]);
      Parent      := Self;
    end;

    FShape := TShape.Create(Self);
    with FShape do
    begin
      Align       := alClient;
      Brush.Color := FShapeColor;
      Shape       := stRoundRect;
      Pen.Style   := psClear;
      Parent      := Self;
    end;

    FValue := TLabel.Create(Self);
    with FValue do
    begin
      Align            := alClient;
      Alignment        := TAlignment.taCenter;
      AlignWithMargins := true;
      AutoSize         := false;
      with Font do
      begin
        Name  := 'Roboto';
        Size  := 20;
        Color := clWhite;
      end;
      Layout      := TTextLayout.tlCenter;
      Name        := Format('MyLblValue_%d', [Main.LabelsCreated]);
      with Margins do
      begin
        Left   := 5;
        Right  := 5;
        Bottom := 3;
        Top    := 3;
      end;
      Parent := Self;
    end;
  end;

end;

procedure TMyLabel.SetDescriptionCaption(const Value: TCaption);
begin
  FDescriptionCaption := Value;
  FDescription.Caption := Value;
end;

procedure TMyLabel.SetValueCaption(const Value: TCaption);
begin
  FValueCaption := Value;
  FValue.Caption := Value;
end;

procedure TMyLabel.SetShapeColor(const Value: TColor);
begin
  FShape.Brush.Color := Value;
end;

{$endregion}

end.
