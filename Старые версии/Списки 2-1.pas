uses crt;

Type list = ^TList;
TList = record
  data:char;            //Значение внутри ячейки списка
  next:list;  
  prev:list;
end;

var
  ln1_h, ln1_t:list;    // ln1_h - Голова списка // ln1_t - Хвост списка // ln - это сокрашщение от "List", а h - Head(голова), t - Tail(хвост)
  _f, _LisIsNill:boolean; // _LisIsNill = false, если список пуст
  _h:integer;
  
  
procedure _InicializationNewList(var inp:char);
var
  newData:list;         // data - новая ячейка памяти
begin
  if(inp <> ' ') then 
  begin
    _LisIsNill:=false;
    new (newData);
    newData^.data := inp;    // Или любое другое входящие значение
    newData^.next := nil;
    newData^.prev := nil;
  
    ln1_h := newData;
    ln1_t := newData;
  end;
end;

procedure _PrintHeadElementList(ln1_h:list);
begin
  writeln('Выводим первый элемент:');
  if(_LisIsNill <> false) then writeln('list_First = ', ln1_h^.data);  
  if(_LisIsNill = false) then writeln('[Список пуст, нет первого элемента]');
end;

procedure _PrintTailElementList(ln1_t:list);
begin
  writeln('Выводим последний элемент: ');
  if(_LisIsNill <> false) then writeln('list_End = ', ln1_t^.data);
  if(_LisIsNill = false) then writeln('[Список пуст, нет последнего элемента]');
end;



procedure _AddElementForCurrentList_afterLastElement(var ln1_h, ln1_t:list); // Вставление элемента в текущий список, после последнего.
var
  u,newData:list; // u - бегунок для прохождения списка
  inp:char;
begin
  u:=ln1_t;
  writeln('Добавление элементов в конец списка.');
  writeln('Вводите элементы списка, через Enter. Конец ввода - пробел');
  readln(inp);
  if (inp <> ' ') then
  begin
    if(ln1_h = nil) then 
    begin
      _InicializationNewList(inp);
      u:=ln1_t;
      readln(inp);
    end;
    while (inp <> ' ') do
    begin      
      _LisIsNill:=true;
      new(newData);
      newData^.data:=inp;
      newData^.next:=nil;
      newData^.prev:=u;
      
      u^.next:=newData;
      ln1_t:=newData;
      u:=ln1_t;   
    
      readln(inp);    
    end;
  end;
end;

procedure _StartProgram();
var
  i:integer;
begin
  writeln('Start Loading Program');
  i:=0;
  while (i<101) do
  begin
    writeln('Loading ', i, '%');
    i:=i+1;
    sleep(10);
  end;
  writeln('Loading complite');
  writeln(' ');
  
end;

procedure _PrintAllList(var ln1_h:list);
var
  u:list;
begin
  writeln('Выводим весь список:');
  u:=ln1_h;
  write('list = [');
  if(u<>nil) then
  begin
    write(u^.data);
    u:=u^.next
  end;
  while(u<>nil) do
  begin  
    write(', ', u^.data);
    u:=u^.next;
  end;
  writeln('];');
  if(ln1_h = nil) then writeln('[Список пуст]');
end;

procedure _AddElementForCurrentList_beforeFirstElement(var ln1_h, ln1_t:list); // Вставление элемента в текущий список, после последнего.
var
  u,newData:list; // u - бегунок для прохождения списка
  inp:char;
begin
  u:=ln1_h;
  writeln('Добавление элементов в начало списка.');
  writeln('Вводите элементы списка, через Enter. Конец ввода - пробел');
  readln(inp);
  if (inp <> ' ') then
  begin
    _LisIsNill:=true;
    if(ln1_h = nil) then 
    begin
      _InicializationNewList(inp);
      u:=ln1_h;
      readln(inp);
    end;
    while (inp <> ' ') do
    begin      
      new(newData);
      newData^.data:=inp;
      newData^.next:=u;
      newData^.prev:=nil;
      
      u^.prev:=newData;
      ln1_h:=newData;
      u:=ln1_h;   
    
      readln(inp);    
    end;
  end;
end;

procedure _DelFirstElement (var ln1_h, ln1_t:list);
var
  u,f:list;
begin
  writeln('Операция удаления первого элемента.');
  if(ln1_h <> nil) then
  begin
    if(ln1_h <> ln1_t) then
    begin
      u:=ln1_h;
      f:=ln1_h;
      u:=u^.next;
      ln1_h:=u;
      u^.prev:=nil;
      f^.next:=nil;
      writeln('Мы удаляем элемент со значением "', f^.data,'"');
      dispose(f);
    end
    else begin
      _LisIsNill:=false;
      u:=ln1_h;
      ln1_h:=nil;
      ln1_t:=nil;
      writeln('Мы удаляем элемент со значением "', u^.data,'"');
      dispose(u);
    end;
  end
  else begin
    writeln('Список пуст, а значит удаление элемента весьма затруднительно, и скорее даже невозможно(');
  end;
end;


procedure _DelEndElement (var ln1_h, ln1_t:list);
var
  u,f:list;
begin
  writeln('Операция удаления последнего элемента.');
  if(ln1_t <> nil) then
  begin
    if(ln1_h <> ln1_t) then
    begin
      u:=ln1_t;
      f:=ln1_t;
      u:=u^.prev;
      ln1_t:=u;
      u^.next:=nil;
      f^.prev:=nil;
      writeln('Мы удаляем элемент со значением "', f^.data,'"');
      dispose(f);
    end
    else begin
      _LisIsNill:=false;
      u:=ln1_h;
      ln1_h:=nil;
      ln1_t:=nil;
      writeln('Мы удаляем элемент со значением "', u^.data,'"');
      dispose(u);
    end;
  end
  else begin
    writeln('Список пуст, а значит удаление элемента весьма затруднительно, и скорее даже невозможно(');
  end;
end;

procedure _DelAllList (var ln1_h, ln1_t:list);
var
  u:list;
  y:char;
begin
  writeln('Удаление всего списка.');
  writeln('Вы действительно хотите удалить весь список? Подтвердите это, введя букву "y" Y/N');
  readln(y);
  if(y = 'y') then
  begin
    ln1_h:=nil;
    ln1_t:=nil;
    _LisIsNill:=false;
  end
  else begin
    writeln('Введена не та буква. Операция отменена, но вы можете вызвать её повторно');  
  end;
end;


procedure _PrintVolumeElement (ln1_h, ln1_t:list);
var
  i:integer;
  u:list;
begin
  u:=ln1_h;
  i:=0;
  while (u<>nil) do
  begin
    i:=i+1;
    u:=u^.next;
  end;
  writeln('В списке ',i,' элементов');
  //_PrintVolumeElement:=i; // Это не работает(((
end;

procedure _DelRandElement (var ln1_h, ln1_t:list); // Научиться использовать функции // Не научился((
var                                                // Самая длинная процедура, в основном, составленная из кусков предыдущих процедур
  i,j,r, rand, SelNmb:integer;
  u,f,d:list;
begin
  u:=ln1_h;
  i:=0;
  while (u<>nil) do
  begin
    i:=i+1;
    u:=u^.next;
  end;

  if(_LisIsNill = true) then
  begin
    if(i<>0) then
    begin
      //writeln('Введите любой номер от 0 до ',i-1);
      rand:=random(i);
      SelNmb:=rand;
      writeln('RandomNumber от 0, до ', i, ' = ',rand);
      //readln(SelNmb);
      if(SelNmb<0) or (SelNmb>i) then
      begin
        writeln('Введён неверный номер. Операция будет прервана.');
      end
      else begin
        u:=ln1_h;
        j:=0;
        while(j <> SelNmb) do
        begin
          j:=j+1;
          u:=u^.next;
        end;
        //writeln('j = ', j, ' SelNmb = ', SelNmb);
        if(SelNmb>0) and (SelNmb<i-1) then // Если удаляемый элемент находится в середине //*
        begin
          f:=u^.prev;
          d:=u;
          u:=u^.next;
      
          d^.next:=nil;
          d^.prev:=nil;
          writeln('Мы удаляем элемент со значением "', d^.data,'"');
          dispose(d);
      
          f^.next:=u;
          u^.prev:=f;
        end
        else if (SelNmb=0) then // В начале
        begin
          if(ln1_h <> ln1_t) then
          begin
            u:=ln1_h;
            f:=ln1_h;
            u:=u^.next;
            ln1_h:=u;
            u^.prev:=nil;
            f^.next:=nil;
            writeln('Мы удаляем элемент со значением "', f^.data,'"');
            dispose(f);
          end
          else begin
            _LisIsNill:=false;
            u:=ln1_h;
            ln1_h:=nil;
            ln1_t:=nil;
            writeln('Мы удаляем элемент со значением "', u^.data,'"');
            dispose(u);
          end;
        end
        else if (SelNmb=i-1) then // В конце
        begin
          if(ln1_h <> ln1_t) then
          begin
            u:=ln1_t;
            f:=ln1_t;
            u:=u^.prev;
            ln1_t:=u;
            u^.next:=nil;
            f^.prev:=nil;
            writeln('Мы удаляем элемент со значением "', f^.data,'"');
            dispose(f);
          end
          else begin
            _LisIsNill:=false;
            u:=ln1_h;
            ln1_h:=nil;
            ln1_t:=nil;
            writeln('Мы удаляем элемент со значением "', u^.data,'"');
            dispose(u);
          end;
        end;
      end;
    end
    else begin
      writeln('Список пуст, и из него нельзя удалить ни одного элемента.');
    end;
  end
  else begin
    writeln('Список пуст, и из него нельзя удалить ни одного элемента.');
  end;
end;


procedure _DelSelectedElement (var ln1_h, ln1_t:list); // Самая длинная процедура, в основном, составленная из кусков предыдущих процедур
var
  i,j,r, SelNmb:integer;
  u,f,d:list;
begin
  writeln(' ');

  u:=ln1_h;
  i:=0;
  while (u<>nil) do
  begin
    i:=i+1;
    u:=u^.next;
  end;
  
  if(i<>0) then
  begin
    writeln('Введите любой номер от 0 до ',i-1);
    r:=-1;
    readln(SelNmb);
    if(SelNmb<0) or (SelNmb>i) then
    begin
      writeln('Введён неверный номер. Операция будет прервана.');
    end
    else begin
      u:=ln1_h;
      j:=0;
      while(j <> SelNmb) do
      begin
        j:=j+1;
        u:=u^.next;
      end;
      writeln('j = ', j, ' SelNmb = ', SelNmb);
      if(SelNmb>0) and (SelNmb<i-1) then // Если удаляемый элемент находится в середине //*
      begin
        f:=u^.prev;
        d:=u;
        u:=u^.next;
      
        d^.next:=nil;
        d^.prev:=nil;
        writeln('Мы удаляем элемент со значением "', d^.data,'"');
        dispose(d);
      
        f^.next:=u;
        u^.prev:=f;
      end
      else if (SelNmb=0) then // В начале
      begin
        if(ln1_h <> ln1_t) then
        begin
          u:=ln1_h;
          f:=ln1_h;
          u:=u^.next;
          ln1_h:=u;
          u^.prev:=nil;
          f^.next:=nil;
          writeln('Мы удаляем элемент со значением "', f^.data,'"');
          dispose(f);
        end
        else begin
          _LisIsNill:=false;
          u:=ln1_h;
          ln1_h:=nil;
          ln1_t:=nil;
          writeln('Мы удаляем элемент со значением "', u^.data,'"');
          dispose(u);
        end;
      end
      else if (SelNmb=i-1) then // В конце
      begin
        if(ln1_h <> ln1_t) then
        begin
          u:=ln1_t;
          f:=ln1_t;
          u:=u^.prev;
          ln1_t:=u;
          u^.next:=nil;
          f^.prev:=nil;
          writeln('Мы удаляем элемент со значением "', f^.data,'"');
          dispose(f);
        end
        else begin
         _LisIsNill:=false;
          u:=ln1_h;
          ln1_h:=nil;
          ln1_t:=nil;
          writeln('Мы удаляем элемент со значением "', u^.data,'"');
          dispose(u);
        end;
      end;
    end;
  end
  else begin
    writeln('Список пуст, и из него нельзя удалить ни одного элемента.');
  end;
end;


procedure _SearchSelectednElement (var ln1_h, ln1_t:list); 
var
  i,inp, l:integer;
  u:list;
begin
  u:=ln1_h;
  i:=0;
  while (u<>nil) do
  begin
    i:=i+1;
    u:=u^.next;
  end;
  writeln('Ищем элемент по заданному номеру:');
  writeln('Всего в списке ', i, ' элементов.');
  if(i = 0) then 
  begin
    writeln('Поиск элементов невозможен, в пустом списке(');
  end
  else 
  begin
    write('Введите номер элемента: ');
    readln(inp);
    if(inp<1)or (inp>i) then
    begin
      writeln('Введено неправльное число. Операция будет прервана.');
    end
    else begin
      l:=1;
      u:=ln1_h;
      while(l<>inp) do 
      begin
        l:=l+1;
        u:=u^.next;
      end;
      writeln('Ура! Нашли тот самый элемент. Вот он: ', u^.data);
    end;
  end;
end;

procedure _SearchMinAndMaxElement (var ln1_h, ln1_t:list); 
var
  i:integer;
  min,max,f:char;
  u:list;
begin
  writeln('Выводим минимальный и максимальный элементы списка:');
  u:=ln1_h;
  min := '0';
  max:='0';
  while(u<>nil) do
  begin    
    if(u^.data < min) then min:=u^.data;
    if(u^.data > max) then max:=u^.data;
    u:=u^.next;
  end;
  
  u:=ln1_h;
  f:=max;
  max:=min;
  min:=f;
  
  while(u<>nil) do
  begin    
    if(u^.data < min) then min:=u^.data;
    if(u^.data > max) then max:=u^.data;
    u:=u^.next;
  end;
  if(_LisIsNill = false) then
  begin
    writeln('В пустом списке нет наиманьших и наибольших элементов');
  end
  else
  begin
    writeln('min = ', min);
    writeln('max = ', max);
  end;
end;

procedure _SearchSelectedElement (var ln1_h, ln1_t:list); 
var
  count:integer;
  s:char;
  u:list;
begin
  writeln('Вас приветствует подпрограмма поиска!) ');
  write('Введите элемент, который нужно найти: ');
  readln(s);
  if(_LisIsNill = false) then
  begin
    writeln('Этот список пуст. Я думаю, в нём не получится найти ни одного элемента(');
  end
  else begin
    count:=0;
    u:=ln1_h;
    while(u<> nil) do
    begin
      if(u^.data = s) then count:=count+1;
      u:=u^.next;
    end;
    if(count = 0) then
    begin
      writeln('Ой, кажется не получилось найти ни одного такого элемента(');
    end
    else begin
      writeln('Получилось найти ', count, 'шт. таких элементов');
    end;
  end;
end;


procedure _AddElementBeforeEachEven (var ln1_h, ln1_t:list); 
var
  u,f,n:list;
  i:integer;
  a:char;
begin
  writeln('Добавление элементов перед каждым чётным');
  u:=ln1_h;
  i:=1;
  while(u<>nil)do
  begin
    if((i mod 2) = 0) then
    begin
      write('Введите добавляемый элемент: ');
      readln(a);
      writeln('Добавляем элемент ', a, ' на место под номером ', i);
      new(n);
      n^.data:=a;
      f:=u^.prev;
      n^.prev:=f;
      n^.next:=u;
      f^.next:=n;
      u^.prev:=n;
    end;   
    i:=i+1;
    u:=u^.next;
  end;
end;

procedure _DelElementBeforeEachEven (var ln1_h, ln1_t:list); 
var
  u,f,g:list;
  i:integer;
  a:char;
begin
  writeln('Удаление элементов перед каждым чётным');
  u:=ln1_h;
  i:=1;
  while(u<>nil)do
  begin
    if((i mod 2) = 0) then
    begin
      if(i = 2) then
      begin
        ln1_h:=u;
        f:=u^.prev;
        f^.next:=nil;
        u^.prev:=nil;
        writeln('Мы удаляем элемент №',i-1,' со значением ', f^.data);
        dispose(f);
      end
      else begin
        f:=u^.prev;
        g:=f;
        f:=f^.prev;
        writeln('Мы удаляем элемент №',i-1,' со значением ', g^.data);
        dispose(g);
        f^.next:=u;
        u^.prev:=f;        
      end;
    end;   
    i:=i+1;
    u:=u^.next;
  end;
end;

procedure _FillElement (var ln1_h, ln1_t:list); 
var
  u,t:list;
  i,j:integer;
  a:char;
begin
  writeln('В результате этой операции создатстя пустой новый список.');
  write('Введите элемент, которым мы будем заполнять: '); readln(a);
  write('Сколько раз нужно заполнить этим элементом? ');readln(i);
  if(i>1) then
  begin
    _LisIsNill:=true;
    new(t);
    t^.data:=a;
    t^.prev:=nil;
    t^.next:=nil;
    ln1_h:=t;
    ln1_t:=t;
    j:=1;
    u:=ln1_h;
    while(j<i) do
    begin
      new(t);
      t^.data:=a;
      t^.prev:=u;
      u^.next:=t;
      t^.next:=nil;
      ln1_t:=t;
      j:=j+1;
      u:=t;
    end;    
  end;
end;


procedure MainP();
var
  i:integer;
begin
  if(_f = false) then
  begin
    _f:=true;
    writeln('Вас приветствует программа "Обработки многомерных списков"!');
    writeln('Созданная великим, и черезвычайно талантливым программистом с ником Gogik Ortey');
    writeln('Конкретно эта программа работает только с двухсторонними некольцевыми списками.');
    writeln('Также программа поддерживает все цифры, буквы и символы, вводимые с клавиатуры)');
  end;
    writeln(' ');
    writeln('Для того, что бы совершить какую-то операцию, введи нужное число:');
    writeln('0 - Вывести весь список');
    writeln('1 - Добавить элемент в конец списка');
    writeln('2 - Добавить элемент в начало списка');
    writeln('3 - Вывесли начальный элемент списка');
    writeln('4 - Вывести последний элемент списка');
    writeln('5 - Удалить первый элемент списка');
    writeln('6 - Удалить последний элемент списка');
    writeln('7 - Удалить весь список');
    writeln('8 - Удалить случайный по номеру элемент списка (и вывести его)');
    writeln('9 - Удаление заданного по номеру элемента списка');
    writeln('10 - Найти элемент по заданному номеру в списке');
    writeln('11 - Вывести минимальный и максимальный элементы списка');
    writeln('12 - Вывести элементы, которые равны введёному элементу (выведется их колличество в списке)');
    writeln('13 - Добавление элемента, перед каждым чётным по номеру');
    writeln('14 - Удаление элемента, перед каждым чётным по номеру');
    writeln('15 - Заполнить новый список указанным элементом указанное колличество раз');
    writeln('16 - Вывести количество элементов в списке');
    writeln('17 - Завершить программу');
  while(true) do
  begin
    readln(i);
    if((i<0) or (i>20)) then
    begin
      writeln('Введено неправильное число. Пожалуйста, будь немного аккуратнее. Попробуй ещё раз, у тебя точно всё получится!)');
      MainP();
    end;
    if(i = 0) then _PrintAllList(ln1_h);
    if(i = 1) then _AddElementForCurrentList_afterLastElement(ln1_h, ln1_t); 
    if(i = 2) then _AddElementForCurrentList_beforeFirstElement(ln1_h, ln1_t);
    if(i = 3) then _PrintHeadElementList(ln1_h);
    if(i = 4) then _PrintTailElementList(ln1_t);
    if(i = 5) then _DelFirstElement (ln1_h, ln1_t);
    if(i = 6) then _DelEndElement (ln1_h, ln1_t);
    if(i = 7) then _DelAllList (ln1_h, ln1_t);
    if(i = 8) then _DelRandElement (ln1_h, ln1_t);
    if(i = 9) then _DelSelectedElement (ln1_h, ln1_t);
    if(i = 10) then _SearchSelectednElement (ln1_h, ln1_t);
    if(i = 11) then _SearchMinAndMaxElement (ln1_h, ln1_t);
    if(i = 12) then _SearchSelectedElement (ln1_h, ln1_t);
    if(i = 13) then _AddElementBeforeEachEven (ln1_h, ln1_t);
    if(i = 14) then _DelElementBeforeEachEven (ln1_h, ln1_t);
    if(i = 15) then _FillElement (ln1_h, ln1_t);
    if(i = 16) then _PrintVolumeElement (ln1_h, ln1_t);
    if(i = 17) then break; // Сделать потом тут красивую процедуру
    
    writeln('Операция завершена');
    writeln('------------------');
  end;
end;

begin    
  _h:=0;
  _StartProgram();
  MainP();
end.