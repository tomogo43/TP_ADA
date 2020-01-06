--******************************************************************
--                          Question 4
--******************************************************************

--******************************************************************
--                          description
--Programme élimine dans une chaîne de caractère saisie par l'utilisateur
--tous les caractères qui ne sont pas des lettres
--******************************************************************

--R0[supprime les caractères d'une chaîne qui ne sont pas des lettres]
--Test: voir sujet

--Déclaration des bibliothèques

--Déclaration des bibliothèques

with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;


procedure replaceChain2 is

    --Déclaration de la première chaîne 
    cmax: constant Integer := 80;
    lch1:Integer; --longueur de la chaîne réelle
    ch1:string(1..cmax);


    i:Integer; --variable d'incrémentation
    j: Integer;

    begin --debut du programme

    --saisi de la chaîne de caractère
    get_line(ch1,lch1);

    i:=1;
    loop
        --récupère les caractères de la chaîne qui ne sont pas des lettres
        if ( CHARACTER'Pos(ch1(i)) >= 0 AND CHARACTER'Pos(ch1(i)) <65 ) or ( CHARACTER'Pos(ch1(i)) > 90 AND CHARACTER'Pos(ch1(i)) <97 ) or ( CHARACTER'Pos(ch1(i)) > 122) then
            put(i);            for j in i+1 .. lch1 loop
                ch1(j):=ch1(j-1);
            end loop;
            lch1:=lch1-1;caractère qui n est pas une lettre est remplacé par le suivant
            end loop;
            lch1:=lch1-1; --la taille réelle de la chaîne diminue
            
        end if;

        i:=i+1; --incrémentation
    exit when i=lch1; --lorsque la chaîne a entièrement été parcourue 
    end loop;

    --affichage du résultat
    new_line;
    put_line(ch1(1..lch1));
    

end replaceChain2; --fin du programme