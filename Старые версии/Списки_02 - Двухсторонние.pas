Program abc;
const n=20; 

{
  Двусвязный список
  С добавлением в начало (Перезаписываем указатель на голову, и добавляем связь на следующий элемент)
  Удаление из конца (Удаляем элемент из хвоста, и перезаписываем связь к хвосту на предпоследний элемент)
  Поиск Максимального элемента (проходим все элементы от головы до хвоста, и )
}

  
Type
  Ukazatel = ^S;     // Объявили указатель, как тип
  S = Record         // 
  Data : char;    // У нас будут целые значения в динамическом списке
  Next : Ukazatel; 
  Prev : Ukazatel;// Для обозначения следующего значения мы будем использовать тип указатель
  end;
  
var
  Head, Tail, P :Ukazatel; // Head - Указатель на начало списка, а P - это имя нашего списка
  
procedure Init(Var P : Ukazatel); // Ввод элементов списка, если он пуст.
var
  x, y : Ukazatel;
  Digit : char;
  //GoNext : Boolean;
  //i:integer;
begin
  P := Nil;
  writeln ('Введите элементы списка, через enter конец ввода - 0');
  read (Digit);

  
  while Digit <> '0' do
  begin
      new(y);
      y^.Next := Nil;
      y^.Data := Digit;

      
      
      if (P = Nil) then begin
        P := y;
        Head := y;
        Tail := y;
      end
      else begin
        //Tail := y;
        
        //P:=P^.Next;
        x^.Next := y;
        Tail := y;
      end;

      x := y;
      
      Read(Digit);
  end;
  //Tail := P^.Prev;
  writeln(' ');
  P := Head;
  P := P^.Next;
  write('Последний элемент списка: '); writeln(P^.Data, ';');
end;


{
procedure writeln_list_one(); // Вывод первого значения списка
begin
  P := Head;
  writeln('');
  write('Первый элемент списка: '); writeln(P^.Data, ' ');
end;
}

procedure writeln_list_all(P,Head:Ukazatel); // Вывод значений списка в режиме таблицы
var
  i,f:integer;
begin
  i:=1;
  f:=0;
  writeln('');
  P := Head;
  while (P<>Nil) do begin
    if(f = 0) then 
    begin
      f:=3;
      writeln(i, ': ', P^.Data);
      i:=i+1;
    end
    else if(f>0) then
    begin
      f:=f-1;
      P := P^.Next;
    end;
  end
end;

procedure Writeln_Last_Element(P, Tail:Ukazatel);
begin
  P := Tail;
  writeln('');
  //write('Последний элемент списка: '); writeln(P^.Data, ' +?');
end;


  
begin
  Init(P);
  //writeln_list_one();
  writeln_list_all(P,Head);
  Writeln_Last_Element(P, Tail);
end.