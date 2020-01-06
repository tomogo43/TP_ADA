--******************************************************************
--                          remplace A par B
--******************************************************************

--******************************************************************
--                          description
--Programme qui remplace dans une chaîne de caractère initialisée au
--clavier les A par des B
--******************************************************************

--R0[Remplacer dans une chaîne les A par des B]
--Test:
--  'salut' ==> 'sblut'
--  'SALUT' ==> 'SBLUT'

--Déclaration des bibliothèques

with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;


procedure replaceAbyB is
    cmax: constant Integer := 80;
    lchaine:Integer; --longueur de la chaîne réelle
    chaine:string(1..cmax);
    i:Integer; --variable d'incrémentation

    begin --debut du programme

    --saisi de la chaîne de caractère
    get_line(chaine,lchaine);

    --remplace les a par des b ou les A par des B
    for i in 1 .. lchaine loop
        if chaine(i) = 'a' then
            chaine(i) := 'b';
        else 
            if chaine(i)='A' then
                chaine(i) := 'B';
            end if;
        end if;
    end loop;

    new_line;
    put_line(chaine(1..lchaine));

end replaceAbyB; --fin du programme