--******************************************************************
--                          Question 5
--******************************************************************

--******************************************************************
--                          description
--Insertion dans une chaîne de caractère
--******************************************************************


--Déclaration des bibliothèques

with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure insertion is 
    cmax:constant Integer:=80;
    ch1:string(1..cmax);
    lch1:Integer; 
    pos:Integer;
    charToAdd:Character;
    i:Integer;

    begin --début du programme

    --Saisie d'une chaîne de caractères
    get_line(ch1,lch1);

    loop
    put("veuillez choisir une position pour inserer dans ch1");
    get(pos);
    exit when pos>0 and pos<=lch1+1;
    end loop;

    put("Quel caractère souhaitez vous ajouter");
    get(charToAdd);

    lch1:=lch1+1;
    i:=lch1+1;
    --Décalage vers la droite
    loop
    ch1(i):=ch1(i-1);
    i:=i-1;

    exit when i = pos;
    end loop;

    --le caractère a ajouter est inséré à la position indiquée
    ch1(pos):=charToAdd;

    put_line(ch1(1..lch1));


end insertion; --fin du programme

