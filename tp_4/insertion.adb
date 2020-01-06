--******************************************************************
--                  Tri par insertion
--******************************************************************

--******************************************************************
--                          description
--Tri un tableau grâce au principe du tri par insertion
--******************************************************************

--R0[Trier un tableau par insertion]
--Test:
--  voir sujet

--Chargement des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure insertion is
    --****Declarations****

    --Variables
    i:Integer;
    j:Integer;
    tmp:Integer;

    --Constantes
    nmax:constant Integer :=6;



    --Tableaux
    type myTab is 
        array(1 .. nmax) of Integer;
    
    D:myTab;

    begin

    D:=(9,2,8,5,1,7);
    --R1:Comment R0
    for i in 2 .. nmax loop
        --R2:Insérer l'élément i du taleau
        tmp:=D(i);
        j:=i;

        --R2:trier la partie temporaire
        

        while j>2 and D(j-1)>tmp loop
            D(j):=D(j-1); --décale vers la gauche
            j:=j-1;  
        end loop;
        D(j):=tmp;

    end loop;

        --R2:Afficher le tableau trié
        for i in 1 .. nmax loop
            put(D(i));
            New_line;
        end loop;

end insertion;


