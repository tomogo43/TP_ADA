--******************************************************************
--                          Question 3
--******************************************************************

--******************************************************************
--                          description
--A partir d'une chaîne de caractères remplit une autre chaîne de
--caractère avec tous les caractères de la première chaîne qui
--ne sont pas des lettres
--******************************************************************

--R0[Remplit une chaîne qui contient tout sauf les lettres d'une chaîne]
--Test: voir sujet

--Déclaration des bibliothèques

with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;


procedure replaceChain is

    --Déclaration de la première chaîne 
    cmax: constant Integer := 80;
    lch1:Integer; --longueur de la chaîne réelle
    ch1:string(1..cmax);

    --Déclaration de la deuxième chaîne
    lch2:Integer; --longueur de la chaine2 réelle
    ch2:string(1..cmax);

    i:Integer; --variable d'incrémentation
    j:Integer;

    begin --debut du programme

    --saisi de la chaîne de caractère
    get_line(ch1,lch1);

    j:=0;
    for i in 1 .. lch1 loop
        if ( CHARACTER'Pos(ch1(i)) >= 0 AND CHARACTER'Pos(ch1(i)) <65 ) or ( CHARACTER'Pos(ch1(i)) > 90 AND CHARACTER'Pos(ch1(i)) <97 ) or ( CHARACTER'Pos(ch1(i)) > 122) then
            j:=j+1;
            ch2(j):= ch1(i);
            
        end if;
    end loop;

    new_line;
    put_line(ch2(1..j));
    

end replaceChain; --fin du programme