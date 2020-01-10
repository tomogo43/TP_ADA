--******************************************************************
--                      Programmation modulaire
--******************************************************************

--******************************************************************
--                          description
-- Test de la généricité
--******************************************************************

--Déclaration des bibliothèques
with gen;
use gen;

with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure main is
	i:integer;
	n:integer:=4;
	m:integer:=2;
	
	subtype mesIndices is Integer range 1..10;
	type mesTableaux is array(mesIndices) of float;
	--instanciation de la procedure swap en généric
	procedure swap_integer is new generic_swap(integer);
	
	--pour faire de la surcharge
	procedure swap is new generic_swap(integer);
	procedure swap is new generic_swap(long_long_integer);
	
	procedure swapA is new generic_swapA(mesIndices,mesTableaux);
	
	T:mesTableaux := (1.2,3.3,2.1,4.0,5.2,4.3,2.1,1.9,1.5,5.1);

	
	begin --début du programme
		put("genereic");
		swap_integer(n,m);
		put(n);
		put(m);
		
		
		
		for i in 1..10 loop
			new_line;
			put(T(i));
		end loop;
		new_line;
		swapA(T,3,5);
		
		for i in 1..10 loop
			new_line;
			put(T(i));
		end loop;
		
		
		
end main; --fin du programme
