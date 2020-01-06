--******************************************************************
--                TP 11: Manipulation simple de pointeurs
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

procedure ex1 is
    --Déclarer le type PINT comme pointeur sur un entier
    type PINT is access Integer;

    --déclarer une variable p de type PINT
    p:PINT;

    saisie:Integer;

    

    begin --debut programme

    --initialise la zone pointée par p à la valeur 99
    p := new Integer;
    p.all := 90;

    --afficher la valeur de la zone pointée par p
    put(p.all);

    --donner à la zone pointée par p une valeur par lecture au clavier
    get(saisie);
    p.all:= saisie;

    --Afficher la valeur de la zone pointée par p
    new_line;
    put(p.all);

end ex1; --fin programme