--TP3 Les tableaux

--1)

--Spécification
--R0[Programme affichant un tableau préalablement initialisé]
--R1:Comment R0

--Chargement des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;


procedure tableau1 is   
    nmax : constant INTEGER :=5; --indice maximum du tableau
    type tab_entiers is
        array(1 .. nmax) of Integer;
    un_tab:tab_entiers; --un tableau d'au maximum nmax entiers
    nb_elements:Integer; --Le nombre effectif d'éléments (<= nmax) de un_tab
    i:Integer;

    begin --début du programme
    un_tab:=(1,2,3,4,5); --initialisation du tableau
    for i in 1 .. nmax loop
        put(un_tab(i));
        New_line;
    end loop;

end tableau1; --fin du programme