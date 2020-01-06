--******************************************************************
--                  TP 10: Récursivité sur un tableau
--******************************************************************

--******************************************************************
--                          description
--******************************************************************

--Déclaration des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure question2 is
    CMAX:constant Integer:=100;
    taille:Integer;
    i:Integer;
    type myArray is
        array(1..CMAX) of Integer;
    T:myArray;
    j:Integer:=1;

    --****procedures****

    --procedure récursive qui affiche les éléments d'un tableau de droite à gauche
    procedure afficheDG(indice1:in out Integer)  is
        begin --debut afficheDG
        new_line;
        put(T(indice1));
        if indice1 > 1 then
            indice1:=indice1-1;
            afficheDG(indice1);
        end if;
    end afficheDG; --fin afficheDG

    ---procedure recursive qui affiche les éléments d'un tableau de gauche à droite
    procedure afficheGD(indice2:in out Integer) is
        begin --debut afficheGD
        new_line;   
        put(T(indice2));
        if indice2 < CMAX then
            indice2:=indice2+1;
            afficheGD(indice2);
        end if;
    end afficheGD; --fin afficheGD

    --****fonctions****

    --fonction récursive qui retourne l'indice d'une valeur donnée parmis ces n éléments

    function retrouve(valeur:in Integer;j:in out Integer) return Integer is
        indice:Integer:=0;
        begin --debut de retrouve;
            
            if T(j) /= valeur then
                if j < CMAX then
                    j:=j+1;
                    indice:=retrouve(valeur,j);
                end if;
            else
                indice := j;
            end if;  

            return indice;
        

    end retrouve;

    begin --debut du programme

    taille:=100;

    for i in 1 .. 100 loop
        T(i):=i;
    end loop;

    
    new_line;
    afficheDG(taille);
    new_line;
    afficheGD(j); 

    j:=1;
    new_line;
    put(retrouve(20,j));





    put("test");
end question2;