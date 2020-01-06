--******************************************************************
--                  Utilisation du type STRING 
--******************************************************************

with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure test_string is
    --Déclaration du type string

    --première chaîne
    cmax: constant Integer :=80; --taille maximum de la chaîne
    nom:string(1..cmax);
    lnom:Integer; --taille réelle de la chaîne lnom

    --deuxième chaîne
    cmax2: constant Integer :=20; --taille maximum de la chaîne
    nom2:string(1..cmax);
    lnom2:Integer; --taille réelle de la chaîne lnom2

    n: Integer;

    --le type CHARACTER
    c:Character; --déclaration d'une variable c comme character

    c2:Character;
    
    i:Integer;
    begin
    --affecttion et consultation du contenu d'une chaîne
    for i in 1 .. 20 loop
        nom(i):='a';
    end loop;

    --affichage des 10 premiers caractères
    for i in 1 .. 20 loop
        put(nom(i));
    end loop;

    new_line;

    --même chose mais avec retour à la ligne
    put_line(nom(1..10));
    
    new_line;


    --affichage de toute la chaine nom
    for i in 1 .. cmax loop
        put(nom(i));
    end loop;

    new_line;

    --utilisation de get_line 

    --saisir une chaîne et renvoit sa longueur
    --get_line invite l'utilisateur à saisir une chaîne de caractère et
    --met dans nom la longueur de la chaîne
    get_line(nom,lnom);

    --on peut par la suite comparer lnom qui est la longueur de la chaîne saisie par l'utilisateur
    --à la taille de nom 
    put(lnom);
    put(nom'length);

    --affectation d'une chaîne par une autre chaîne

    --pas possible de mettre nom dans nom2 car nom a une longueur de 80 contre 20 pour nom 2
    --nom:="info"; erreur car les deux chaînes ont une longueur différente
    nom(1..4) := "info";
    c:='a';
    --Récupère la position décimale du caractère definit dans c dans la variable n
    n:=Character'Pos(c);
    --Récupère la valeur du caractère à la position 97 dans c2
    c2:=Character'Val(97);
    put(n);
    put(c2);

end test_string;