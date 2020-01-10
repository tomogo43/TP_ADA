--******************************************************************
--               Paquetages et généricité
--******************************************************************

--******************************************************************
--                          description
--1) test de la généricité en ADA
--******************************************************************

--Déclaration des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

package body gen is

	--**********************Fonctions************************************
	
	--**********************Procedures************************************
	procedure generic_swap(a,b:in out T_entier) is
		c:T_entier;
		begin
		c:=a;
		a:=b;
		b:=c;
	end generic_swap;
	
	procedure generic_swapA(T:in out T_tableau;i,j:in T_indice) is
		tmp:float;
		begin
		tmp:=T(i);
		T(i):=T(j);
		T(j):=tmp;
	end generic_swapA;
end gen;
