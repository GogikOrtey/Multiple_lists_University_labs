Program abc;
const n=20; 
  
Type
  Ukazatel = ^S;     // Объявили указатель, как тип
  S = Record         // 
  Data : integer;    // У нас будут целые значения в динамическом списке
  Next : Ukazatel;   // Для обозначения следующего значения мы будем использовать тип указатель
  end;
  
var
  Head, P :Ukazatel; // Head - Указатель на начало списка, а P - это имя нашего списка
  
procedure Init(Var P : Ukazatel);
var
  x, y : Ukazatel;
  Digit : integer;
begin
  P := Nil;
  writeln ('Введите элементы списка, конец ввода - 0');
  read (Digit);
  while Digit<>0 do
  begin
    new(y);
    y^.Next := Nil;
    y^.Data := Digit;
    if (P = Nil) then begin
        P := y;
        Head:=y;
      end
      else begin
        x^.Next := y;
      end;
    x := y;
    Read(Digit);
  end;
  writeln;
end;

procedure writeln_list_one(); // Вывод первого значения списка
begin
  P := Head;
  writeln('');
  write('Первый элемент списка: '); writeln(P^.Data, ' ');
end;

procedure writeln_list_all(P,Head:Ukazatel); // Вывод значений списка в режиме таблицы
var
  i:integer;
begin
  i:=1;
  writeln('');
  P := Head;
  while (P<>Nil) do begin
    writeln(i, ': ', P^.Data);
    P := P^.Next;
    i:=i+1;
  end
end;

  
begin
  Init(P);
  writeln_list_one();
  writeln_list_all(P,Head);
end.