unit Extends;

interface

type
  // 动物类
  Animal = class
  private
    Age: Integer;
  public
    // 构造方法
    constructor CreateClass(Age: Integer);
    // 定义读写属性
    property AAge: Integer read Age write Age;
    // 虚拟方法
    procedure getName(); virtual;
  end;

  // 狗类
  Dog = class(Animal)
  public
    // 构造方法
    constructor CreateClass();
    // 重写
    procedure getName(); override;
  end;

implementation

{ Animal }
constructor Animal.CreateClass(Age: Integer);
begin
  Self.Age := Age;
  Writeln(Age);
  Writeln('动物');
end;

procedure Animal.getName;
begin
  Writeln('父类是动物');
end;

{ Dog }
constructor Dog.CreateClass;
begin
  Writeln('狗');
  inherited CreateClass(15);
end;

procedure Dog.getName;
begin
  inherited getName; // 引用父类方法
  Writeln('子类是狗');
end;

end.
