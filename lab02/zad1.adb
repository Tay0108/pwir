-- Zdefiniuj typ np. Wektor opisujący niezawężoną tablicę jednowymiarową indeksowaną liczbami całkowitymi z elementami typu rzeczywistego.

with Ada.Text_IO,Ada.Float_Text_IO, Ada.Numerics.Float_Random;
use Ada.Text_IO,Ada.Float_Text_IO, Ada.Numerics.Float_Random;

procedure zad1 is

type Wektor is array (Integer range <>) of Float;

-- Zadeklaruj i zainicjuj zmienną typu wektor dowolnymi wartościami (agregat).
Tab1 : Wektor(1..10) := (1..2=>1.0, 3=>2.0, 4=>8.0, others => 5.5);

-- Napisz i wykorzystaj procedurę wypisującą zawartość wektora na ekranie.
procedure wypisz_wektor(A : Wektor) is
begin
    for Element of A loop
        Put(Element'Img);
    end loop;

end wypisz_wektor;
-- Napisz i wykorzystaj procedurę wypełniającą wektor losowymi wartościami.

procedure wypelnij_losowo(A : in out Wektor) is 
Gen : Generator;

begin
Reset(Gen);
    for i in A'Range loop
        A(i) := Random(Gen);
    end loop;
end wypelnij_losowo;


-- Napisz i wykorzystaj funkcję z kwantyfikatorem „dla każdego” (for all …) sprawdzającą posortowanie rosnące wektora.
function czy_rosnacy(A : Wektor) return Boolean is
begin
    return (for all element in 1 .. A'Length-1 => A(element)<=A(element+1));
end czy_rosnacy;

-- Napisz i wykorzystaj procedurę sortującą dowolną metodą wektor.
procedure sort_wektor(A : in out Wektor) is
    Min_Id: Integer;
    Swap: Float;
    -- selection sort
begin
  for I in A'Range loop

    Min_Id := I;
    for J in I..A'Length loop
      if A(J) < A(Min_Id) then
        Min_Id := J;
      end if;
    end loop;

    Swap := A(I);
    A(I) := A(Min_Id);
    A(Min_Id) := Swap;
  end loop;
end sort_wektor;

-- Dopisz do programu głównego instrukcje pozwalające na pomiar czasu wykonania programu.

-- Napisz i wykorzystaj procedurę zapisującą wektor do pliku.

-- Wydziel typ i podprogramy do osobnego pakietu (przykład w kartotece menu_pakiet, pliki: menup.adb, opcje.ads, opcje.adb). Po podziale będą dostępne 3 pliki:

-- plik z procedurą główną np.lab3.adb

-- plik ze specyfikacją pakietu czyli typ + nagłówki podprogramów np. pak3.ads

-- plik z treścią pakietu czyli treści podprogramów np. pak3.adb


rosnacy : Wektor := (1=>1.0, 2=>2.0, 3=>3.0);

begin
    wypelnij_losowo(Tab1);
    wypisz_wektor(Tab1);
    Put(czy_rosnacy(Tab1)'Img);
    Put(czy_rosnacy(rosnacy)'Img);
    sort_wektor(Tab1);
    wypisz_wektor(Tab1);
    Put(czy_rosnacy(Tab1)'Img);


end zad1;