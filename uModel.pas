unit uModel;

interface

uses uValidationFramework, System.Rtti, RegularExpressions, System.TypInfo;

type
  ValidEmail = class(TValidationAttribute)
  public
    //^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$
    constructor Create; overload;
    constructor Create(errorMessage: String); overload;
    function execute(member: TRttiMember; obj: TObject; validator: TValidator): Boolean; override;
  end;

  TTelefone = class
  private
    FDDD: String;
    FNumero: String;
    procedure SetDDD(const Value: String);
    procedure SetNumero(const Value: String);
  public
    property DDD: String read FDDD write SetDDD;
    [Required('N�mero do Telefone � obrigat�rio.')]
    property Numero: String read FNumero write SetNumero;
  end;

  TCliente = class
  private
    FNome: String;
    Fidade: Integer;
    FFilhos: Integer;
    FisCasado: Boolean;
    FdataAtual: TDate;
    FEmail: String;
    FTelefone: TTelefone;
    procedure SetNome(const Value: String);
    procedure Setidade(const Value: Integer);
    procedure SetFilhos(const Value: Integer);
    procedure SetisCasado(const Value: Boolean);
    procedure SetdataAtual(const Value: TDate);
    procedure SetEmail(const Value: String);
    procedure SetTelefone(const Value: TTelefone);
  public
    [Required('Este campo � obrigat�rio e n�o pode estar vazio.')]
    [Pattern('^Robson$', 'Nome inv�lido. O nome do indiv�duo deve ser "Robson".')]
    [Size(6, 'O nome de usu�rio deve ter no m�nino 6 caracteres.')]
    property Nome: String read FNome write SetNome;
    [Min(18, 'Idade abaixo da idade m�nima exigida de 18 anos.')]
    [Max(50, 'Idade acima da idade m�xima de 50 anos.')]
    property idade: Integer read Fidade write Setidade;
    [Max(3, 'N�mero de filhos excede o limite de 3 filhos.')]
    property Filhos: Integer read FFilhos write SetFilhos;
    [AssertTrue('� obrigat�rio estar casado(a).')]
    property isCasado: Boolean read FisCasado write SetisCasado;
    //[Past('Data precisa ser no passado.')]
    property dataAtual: TDate read FdataAtual write SetdataAtual;
    [ValidEmail('E-mail inv�lido.')]
    property Email: String read FEmail write SetEmail;
    [Valid]
    property Telefone: TTelefone read FTelefone write SetTelefone;
    destructor Destroy; override;
  end;

implementation

{ TCliente }

destructor TCliente.Destroy;
begin
  if FTelefone <> nil then
  begin
    FTelefone.Free;
  end;

  inherited;
end;

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

function ValidEmail.execute(member: TRttiMember; obj: TObject; validator: TValidator): Boolean;
var
  regex: TRegEx;
  rType: TRttiType;
  value: TValue;
  rTypeName: string;
begin
  FValid := true;

  if member is TRttiField then
  begin
    rType := TRttiField(member).FieldType;
    value := TRttiField(member).GetValue(obj);
    rTypeName := TRttiField(member).FieldType.Name;
  end else if member is TRttiProperty then
  begin
    rType := TRttiProperty(member).PropertyType;
    value := TRttiProperty(member).GetValue(obj);
    rTypeName := TRttiProperty(member).PropertyType.Name;
  end;

  if rType.TypeKind in [tkString, tkWString, tkUString] then
  begin
    regex := TRegEx.Create('^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$');
    if not regex.IsMatch(value.AsString) then
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
