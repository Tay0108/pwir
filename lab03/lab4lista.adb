with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Lab4Lista is

type Element is -- tworzymy structa
  record 
    Data : Integer := 0;
    Next : access Element := Null;
  end record; 

type Elem_Ptr is access all Element; -- robimy wskaznik na structa

procedure Print(List : access Element) is 
  L : access Element := List;
begin
  if List = Null then
    Put_Line("List EMPTY!");
  else
    Put_Line("List:"); 
  end if; 
  while L /= Null loop
    Put(L.Data, 4); -- z pakietu Ada.Integer_Text_IO
    New_Line;
    L := L.Next;
  end loop; 
end Print;

procedure Insert(List : in out Elem_Ptr; D : in Integer) is
  E : Elem_Ptr := new Element; 
begin
  E.Data := D;
  E.Next := List;
  -- lub E.all := (D, List);
  List := E;
end Insert;

-- wstawianie jako funkcja - wersja krótka
function Insert(List : access Element; D : in Integer) return access Element is 
  ( new Element'(D,List) ); 

-- do napisania !! 

procedure sortList(List : in out Elem_Ptr) is  
L : access Element := List;
G : access Element := List;
Min_Ptr: access Element;
tmp : access Element;
    -- selection sort
begin
  loop

    Min_Ptr := List;
    while L /= Null loop
      if L.Data < Min_Ptr.Data then
        Min_Ptr := L;
      end if;
      L := L.Next;
    end loop;

   tmp := List;
   List := Min_Ptr;
  List.Next := tmp;
  end loop;

end sortList;


procedure Insert_Sort(List : in out Elem_Ptr; D : in Integer) is 
begin
-- napisz procedurę wstawiającą element zachowując posortowanie (rosnące) listy
-- 1. dojdz do danej pozycji (dwa wskazniki, jeden na poprzedni)
-- 2. wstaw element
-- 3. ???
-- 4. profit

null;
end Insert_Sort;

Lista : Elem_Ptr := Null;

begin
  Print(Lista);
  Lista := Insert(Lista, 21);
  Print(Lista);
  Insert(Lista, 20); 
  Print(Lista);
  
  for I in 1..12 loop
  Insert(Lista, I);
  end loop;
  sortList(Lista);
  Print(Lista);
end Lab4Lista;
