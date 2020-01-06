package liste_double is

--*******************Définition des types**************************
Type T_Cellule_Double;

Type T_Liste_Double is access T_Cellule_Double;

type T_Cellule_Double is
    record
        precedent:T_Liste_Double;
        element:Integer;
        suivant:T_Liste_Double;
    end record;

--******************Fonctions**************************

--*********************************************************************
--nom: creer_liste_vide
--sémantique: creer une liste vide de type T_Liste_Double
--paramètres: aucun
--pré condition: aucune
--post condition:  La liste est vide
 --Exception: aucune
--*********************************************************************
function creer_liste_vide return T_Liste_Double;

--******************Procédures**************************

--*********************************************************************
--nom: insere_element
--sémantique: insére un élément dans une liste 
--paramètres: aucun
--pré condition: aucune
--post condition:  F_e est inséré dans la liste 
--Exception: aucune
--*********************************************************************
procedure insere_element(F_e:in Integer;F_l: in out T_Liste_Double);

--*********************************************************************
--nom: affichage
--sémantique: affiche une liste double
--paramètres: aucun
--pré condition: aucune
--post condition:  F_l est affiché jusqu'à suivant = null
--Exception: aucune
--*********************************************************************
procedure affichage(F_l:in out T_Liste_Double);

end liste_double;