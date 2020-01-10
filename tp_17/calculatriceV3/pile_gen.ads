--paquetage calculatriceV3

generic
	--pour notre calculatrice seulement couvrir les types rééls à virgule flottante
	type T_element is digits <>;

package pile_gen is

	type T_Pile_Entier is private;




	--********************Les fonctions**************************
	
	--*********************************************************************
    --nom: creer_pile_vide
    --sémantique: creer une pile vide de type T_Liste_Entier
    --paramètres: aucun
    --retourne T_Pile_Entier
    --pré condition: aucune
    --post condition:  La pile est vide
    --Exception: aucune
    --*********************************************************************
	function creer_pile_vide return T_Pile_Entier;
	
--*********************************************************************
    --nom: dépiler
    --sémantique: Enlève le sommet de la pile
    --paramètres: F_l: Mode(IN/OUT) T_Pile_Entier:Pile où se produit le dépilement     
    --pré condition: aucune
    --post condition: sommet de la pile enlevé   
    --Exception: F_l vide
    --*********************************************************************
    function depiler(F_p:in out T_Pile_Entier) return T_element;


    --***********************Les procédures********************************

    --*********************************************************************
    --nom: inserer
    --sémantique: insère un entier en haut de pile
    --paramètres: F_e: Mode (IN) Entier: entier à insérer
    --            F_p: Mode (IN/OUT) T_Liste_Entier: Liste où l'élément va être inséré
    --pré condition: aucune
    --post condition:  F_e est ajouté en haut de pile
    --Exception: aucune
    --*********************************************************************
    procedure empiler(F_e:in T_element;F_p:in out T_Pile_Entier);

    

    --*********************************************************************
    --nom: afficher
    --sémantique: affiche une pile
    --paramètres: F_p: Mode (IN/OUT) T_Liste_Entier: Liste à afficher     
    --pré condition: aucune
    --post condition:  F_l affiché
    --Exception: aucune
    --*********************************************************************
    
    procedure afficher(F_p:in out T_Pile_Entier);

    procedure calcul(F_p:in out T_Pile_Entier);

	private
	
   	type T_Cellule_Entier; --annoncer la référence avant

    type T_Pile_Entier is access T_Cellule_Entier; --type pointeur sur un type T_Cellule_ENtier


    type T_Cellule_Entier is
        record
            element:T_element;            --Elément rangé dans la cellule
            suivant:T_Pile_Entier;     --Accès à la cellule suivante
        end record;
    
end pile_gen;
