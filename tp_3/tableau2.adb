--TP3 Les tableaux

--2)

--Spécification
--R0[Programme permettant de modifier la ième composante du tableau]
--R1:Comment R0
    --Saisir une composante valide à modifier
    --Saisir la nouvelle valeur valide de la composante

--Chargement des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;


procedure tableau2 is   
    nmax : constant INTEGER :=5; --indice maximum du tableau
    type tab_entiers is
        array(1 .. nmax) of Integer;
    un_tab:tab_entiers; --un tableau d'au maximum nmax entiers
    nb_elements:Integer; --Le nombre effectif d'éléments (<= nmax) de un_tab
    i:Integer; --Composante à modifier 
    valeur:Integer; --Nouvelle valeur
    j:Integer;

    begin --début du programme
    un_tab:=(1,2,3,4,5); --initialisation du tableau
    
    --R2:Comment R1-1
    loop
        put("Choisir une composante à modifier");
        New_line;
        Get(i);
    exit when i>=1 and i<=5;
    end loop;

    --R2:Comment R&-2
    loop
        put("remplacer la ");
        put(i);
        put("valeur du tableau");
        get(valeur);
    exit when valeur>=0;
    end loop;

    un_tab(i):=valeur;

    --Vérifie si la composante a bien été modifiée
    for i in 1 .. nmax loop
        put(un_tab(i));
        New_line;
    end loop;

end tableau2; --fin du programme