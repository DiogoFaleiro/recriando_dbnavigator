unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    Conexao: TFDConnection;
    tbUsuarios: TFDTable;
    dsUsuarios: TDataSource;
    btPrimeiro: TButton;
    btGravar: TButton;
    btDeletar: TButton;
    btInserir: TButton;
    Button5: TButton;
    btUltimo: TButton;
    btProximo: TButton;
    btAnterior: TButton;
    btCancelar: TButton;
    Button10: TButton;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    tbUsuariosid: TFDAutoIncField;
    tbUsuariosnome: TStringField;
    tbUsuarioslogin: TStringField;
    tbUsuariossenha: TStringField;
    procedure Button5Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure tbUsuariosAfterScroll(DataSet: TDataSet);
    procedure btInserirClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btDeletarClick(Sender: TObject);
    procedure btProximoClick(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
    procedure btUltimoClick(Sender: TObject);
    procedure btPrimeiroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btAnteriorClick(Sender: TObject);
begin
 tbUsuarios.Prior;
end;

procedure TForm1.btCancelarClick(Sender: TObject);
begin
  btInserir.Enabled := true;
  btDeletar.Enabled := true;

  btGravar.Enabled := false;
  btCancelar.Enabled := false;

  tbUsuarios.Cancel;
end;

procedure TForm1.btDeletarClick(Sender: TObject);
var
msgPersonalizada: PWChar;
nome: string;
begin
 nome := tbUsuariosnome.Value;
 msgPersonalizada := StringToOleStr('Deseja realmente deletar ' +nome+ '?');

 if (Application.MessageBox (msgPersonalizada, 'Aten??o!', MB_ICONQUESTION+MB_YESNO) = mrYes) then
   tbUsuarios.Delete;
end;

procedure TForm1.btGravarClick(Sender: TObject);
begin
  btInserir.Enabled := true;
  btDeletar.Enabled := true;

  btGravar.Enabled := false;
  btCancelar.Enabled := false;

  tbUsuarios.Post;
end;

procedure TForm1.btInserirClick(Sender: TObject);
begin
  btInserir.Enabled := false;
  btDeletar.Enabled := false;

  btGravar.Enabled := true;
  btCancelar.Enabled := true;

  tbUsuarios.Append;
end;

procedure TForm1.btPrimeiroClick(Sender: TObject);
begin
 tbUsuarios.First;
end;

procedure TForm1.btProximoClick(Sender: TObject);
begin
 tbUsuarios.Next
end;

procedure TForm1.btUltimoClick(Sender: TObject);
begin
 tbUsuarios.Last;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  tbUsuarios.Close;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  tbUsuarios.Open;
end;

procedure TForm1.tbUsuariosAfterScroll(DataSet: TDataSet);
begin
  if tbUsuarios.Eof = true then
    begin
      btProximo.Enabled := false;
      btUltimo.Enabled := false;
    end
  else
     begin
       btProximo.Enabled := true;
       btUltimo.Enabled := true;
     end;

   if tbUsuarios.Bof = true then
     begin
       btPrimeiro.Enabled := false;
       btAnterior.Enabled := false;
     end
   else
     begin
       btPrimeiro.Enabled := true;
       btAnterior.Enabled := true;
     end;

end;

end.
