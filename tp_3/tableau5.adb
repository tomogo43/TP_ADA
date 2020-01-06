--TP3 Les tableaux

--4)

--Spécification
--R0[Programme permettant d'insérer une nouvelle valeur valeur dans la première case du tableau]
--R1:Comment R0
    --Saisir une valeur supérieur à 0
    --Chercher une occurence dans le tableau
    

--Chargement des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;


procedure tableau4 is   
    nmax : constant INTEGER :=5; --indice maximum du tableau
    type tab_entiers is
        array(1 .. nmax) of Integer;
    un_tab:tab_entiers; --un tableau d'au maximum nmax entiers
    nb_elements:Integer; --Le nombre effectif d'éléments (<= nmax) de un_tab
    i:Integer; --Composante à modifier 
    valeur:Integer; --Nouvelle valeur
    indice:Integer;

    begin --début du programme
    indice:=0;
    un_tab:=(10,2,33,14,45); --initialisation du tableau
    
    --R2:Comment R1-1
    loop
    put("saisir une valeur");
    Get(valeur); --out
    exit when valeur>=0;
    end loop;

    --R2:Comment R1-2
        --(1) parcourir le tableau jusqu'à la première occurence
        --(2)Afficher l'indice du tableau correspondant à la première occurence si existe
    
    --R3:Comment R2-1
    for i in 1 .. nmax loop
        if un_tab(i) = valeur then
            indice:=i;
            exit;
        end if;
    end loop;

    --R3:Comment R2-2
    if indice>0 then --occurence trouvée
        put(indice);
    else --occurence non trouvée
        put("aucune occurence trouvée");
    end if;

end tableau4; --fin du programme