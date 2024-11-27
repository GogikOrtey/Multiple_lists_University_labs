type 
  PNode = ^Node;
  Node = record
    data:integer;
    prev:PNode;
    next:PNode;
  end;
  
  
var Head,Tail:PNode;
Procedure CreateNode (var Head,Tail:PNode);
  begin
    Head:=nil;
    Tail:=nil;
  end;
  
Procedure Print(Head:PNode);//не работает для кольцевого; работает одинаково для односвязного и двусвязного
  var temp:list;
  begin
    temp:=Head;
    while temp <> nil do
    begin
      writeln(temp^.data);
      temp:=temp^.next;
    end;
  end;
//добавление для односвязного

Procedure AddFirst (var Head,Tail:PNode;curr:integer );
  var temp:PNode;
  begin
  New(temp);
  temp^.data:=curr;
  temp^.next:=nil;
  temp^.prev:=nil;
  if Head=nil then 
    begin
      Head:=temp;
      Tail:=temp;
    end
  else 
    begin
      temp^.next:=next;
      Head^.prev:=temp;
      Head:=temp;
    end;
  end;
  
Procedure DeleteFirst(var Head,Tail:PNode);
  var temp:PNode;
  begin
    If Head <> nil then 
      if Head=Tail then dispose(Head)
    else
    begin
      temp := Head;
      Head:=Head^.next;
      Head^.prev:=nil
      dispose(temp);
    end;
  end.