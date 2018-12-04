-- zad1
-- zasób dzielony 

with Ada.Text_IO;
use Ada.Text_IO;

procedure zad1 is

-- obiekt chroniony 
protected typChroniony is
  procedure Pisz(S: String);
end typChroniony;

protected body typChroniony is
  procedure Pisz(S: String) is
  begin
    Put_Line("# Wypisany tekst:");
    Put_Line("$ " & S);
  end Pisz;
end typChroniony;


  
task type Zadanie(N: Integer := 1); 
-- parametr N <- wyróżnik
type Wsk_Zadanie is access Zadanie;

task body Zadanie is
begin
  typChroniony.Pisz("Jestem w zadaniu " & N'Img);
end Zadanie;

type buforWieloelementowy is array(1..10) of Wsk_Zadanie;
WZX : Wsk_Zadanie;

begin
  for i in 1..10 loop
    WZX := buforWieloelementowy(i);
  end loop;
  typChroniony.Pisz("Jestem w procedurze glownej");
end zad1;  
  