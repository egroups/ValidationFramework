unit uModel;

interface

uses uValidationFramework, System.Rtti, RegularExpressions, System.TypInfo;

type
  ValidEmail = class(TValidationAttribute)
  public
    //^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$
    constructor Create; overload;
    constructor Create(errorMessage: String); overload;
    function execute(field: TRttiField; obj: TObject): Boolean; override;
  end;

  TTelefone = class
  private
    FDDD: String;
    FNumero: String;
    procedure SetDDD(const Value: String);
    procedure SetNumero(const Value: String);
  public
    property DDD: String read FDDD write SetDDD;
    property Numero: String read FNumero write SetNumero;
  end;

  TCliente = class
  private
    [Required('Este campo � obrigat�rio e n�o pode estar vazio.')]
    [Pattern('^Robson$', 'Nome inv�lido. O nome do indiv�duo deve ser "Robson".')]
    [Size(6, 'O nome de usu�rio deve ter no m�nino 6 caracteres.')]
    FNome: String;
    [Min(18, 'Idade abaixo da idade m�nima exigida de 18 anos.')]
    [Max(50, 'Idade acima da idade m�xima de 50 anos.')]
    Fidade: Integer;
    [Max(3, 'N�mero de filhos excede o limite de 3 filhos.')]
    FFilhos: Integer;
    [AssertTrue('� obrigat�rio estar casado(a).')]
    FisCasado: Boolean;
    [Past('Data precisa ser no passado.')]
    FdataAtual: TDate;
    [ValidEmail('E-mail inv�lido.')]
    FEmail: String;
    [NotNull('Telefone � obrit�rio.')]
    FTelefone: TTelefone;
    //FTeste: Integer;
    procedure SetNome(const Value: String);
    procedure Setidade(const Value: Integer);
    procedure SetFilhos(const Value: Integer);
    procedure SetisCasado(const Value: Boolean);
    procedure SetdataAtual(const Value: TDate);
    procedure SetEmail(const Value: String);
    procedure SetTelefone(const Value: TTelefone);
  public
    property Nome: String read FNome write SetNome;
    property idade: Integer read Fidade write Setidade;
    property Filhos: Integer read FFilhos write SetFilhos;
    property isCasado: Boolean read FisCasado write SetisCasado;
    property dataAtual: TDate read FdataAtual write SetdataAtual;
    property Email: String read FEmail write SetEmail;
    property Telefone: TTelefone read FTelefone write SetTelefone;
  end;

implementation

{ TCliente }

procedure TCliente.SetdataAtual(const Value: TDate);
begin
  FdataAtual := Value;
end;

procedure TCliente.SetEmail(const Value: String);
begin
  FEmail := Value;
end;

procedure TCliente.SetFilhos(const Value: Integer);
begin
  FFilhos := Value;
end;

procedure TCliente.Setidade(const Value: Integer);
begin
  Fidade := Value;
end;

procedure TCliente.SetisCasado(const Value: Boolean);
begin
  FisCasado := Value;
end;

procedure TCliente.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TCliente.SetTelefone(const Value: TTelefone);
begin
  FTelefone := Value;
end;

{ ValidEmail }

constructor ValidEmail.Create;
begin

end;

constructor ValidEmail.Create(errorMessage: String);
begin
  Self.Create;
  FErrorMessage := errorMessage;
end;

function ValidEmail.execute(field: TRttiField; obj: TObject): Boolean;
var
  regex: TRegEx;
begin
  FValid := true;
  if field.FieldType.TypeKind in [tkString, tkWString, tkUString] then
  begin
    regex := TRegEx.Create('^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$');
    if not regex.IsMatch(field.GetValue(obj).AsString) then
      FValid := false;
  end;
end;

{ TTelefone }

procedure TTelefone.SetDDD(const Value: String);
begin
  FDDD := Value;
end;

procedure TTelefone.SetNumero(const Value: String);
begin
  FNumero := Value;
end;

end.
