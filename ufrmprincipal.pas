unit ufrmprincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, REST.Types,
  FMX.Memo.Types, FMX.StdCtrls, FMX.ScrollBox, FMX.Memo,
  FMX.Controls.Presentation, FMX.Edit, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, System.Rtti, FMX.Grid.Style, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.Grid, REST.Response.Adapter, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient, IdHTTP, System.JSON, WinInet,
  FMX.Objects, FMX.Ani, Web.HTTPApp, Vcl.IdAntiFreeze, FMX.BitmapHelper,
  FMX.Effects, FMX.Filter.Effects, System.Net.HttpClient, FMX.EditBox,
  FMX.NumberBox;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    name: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    id: TLabel;
    Label5: TLabel;
    weight: TLabel;
    Panel1: TPanel;
    BitmapAnimation1: TBitmapAnimation;
    CircleTransitionEffect1: TCircleTransitionEffect;
    Circle1: TCircle;
    Memo2: TMemo;
    Label7: TLabel;
    Rectangle1: TRectangle;
    label8: TLabel;
    Label9: TLabel;
    types: TLabel;
    Rectangle2: TRectangle;
    Label11: TLabel;
    exp: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;
  ResultadoAPI: string;
  PokeIMG: string;
  Resultado: Double;
  JSONValue: TJSONValue;
  JSONimg: TJSONValue;
  HTTP: TIdHTTP;
  Peso: Double;

implementation

{$R *.fmx}
{$R *.iPhone55in.fmx IOS}
{$R *.iPad.fmx IOS}
{$R *.iPhone4in.fmx IOS}

procedure TForm1.Button1Click(Sender: TObject);


begin
  RESTClient1.BaseURL := 'https://pokeapi.co/api/v2/pokemon/' + Edit1.Text;
  RESTRequest1.Execute;
  Memo1.Lines.Clear;
  Memo1.Lines.Add(RESTRequest1.Response.JSONText);
  ResultadoAPI := Memo1.Lines.Text;
  JSONValue := TJSONObject.ParseJSONValue(ResultadoAPI);
  PokeIMG := Memo1.Lines.Text;
  JSONimg := TJSONObject.ParseJSONValue(PokeIMG);

begin
  Memo2.Lines.Add(PokeIMG);
  id.Text := JSONValue.GetValue<string>('id');
  name.Text := JSONValue.GetValue<string>('name');
  weight.Text := JSONValue.GetValue<string>('weight');
  Resultado := StrToFloat(weight.text);
  Peso := Resultado / 10;  // O peso retornado pela Api deve ser sempre dividido por 10 para que seja o peso real do Pokemon.
  weight.Text := FloatToStr(Peso) + ' Kg';
  exp.Text := JSONValue.GetValue<string>('base_experience');
  label7.text := JSONValue.GetValue<string>('sprites.front_default');
  types.text := JSONValue.GetValue<string>('types[0].type.name');
  Circle1.Fill.Bitmap.Bitmap.LoadFromUrl(Label7.Text);

begin
  Circle1.Visible := True;
  label2.Visible := True;
  label3.Visible := True;
  label5.Visible := True;
  label9.Visible := True;
  label11.Visible := True;
end;

end;

end;

procedure TForm1.FormCreate(Sender: TObject);

begin
  Circle1.Visible := False;
  label2.Visible := False;
  label3.Visible := False;
  label5.Visible := False;
  label9.Visible := False;
  label11.Visible := False;
  Rectangle1.Fill.Bitmap.Bitmap.LoadFromUrl('https://raw.githubusercontent.com/RenanTomicki/Picture/main/logo.png');
end;

end.

