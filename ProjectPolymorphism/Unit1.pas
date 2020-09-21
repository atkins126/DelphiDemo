unit Unit1;

interface

type
  Animal = class
    // 虚拟的抽象方法
    procedure Run(); virtual; abstract;
    procedure Eat(); virtual; abstract;
  end;

  Dog = class(Animal)
    // 重写父类方法
    procedure Run(); override;
    procedure Eat(); override;
  end;

  Cat = class(Animal)
    // 重写父类方法
    procedure Run(); override;
    procedure Eat(); override;
  end;

implementation

{ ADog }

{ ADog }

procedure Dog.Eat;
begin
  Writeln('狗吃骨头');
end;

procedure Dog.Run;
begin
  Writeln('狗在跑');
end;

{ Cat }

procedure Cat.Eat;
begin
  Writeln('猫吃鱼');
end;

procedure Cat.Run;
begin
  Writeln('猫在跑');
end;

end.
