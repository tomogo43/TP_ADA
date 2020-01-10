--******************************************************************
--                       Calculatrice à pile V2
--******************************************************************

--******************************************************************
--                          description
-- Créer une calculatrice en utilisant les piles génériques
--******************************************************************

--Déclaration des bibliothèques

with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

package body pile_gen is

	--********************Les fonctions**************************

    function creer_pile_vide return T_Pile_Entier is
        pile:T_Pile_Entier;
        begin
        pile:=null;
        return pile;

    end creer_pile_vide;


    function depiler(F_p:in out T_Pile_Entier) return T_element is 
        PILE_VIDE:exception;
        val:T_element; --valeur de la pile à dépiler
        begin

        if F_p = null then
            raise PILE_VIDE;
        else
            val:=F_p.all.element;
            F_p:=F_p.all.suivant;
            return val;  
        end if;
        
        exception
            when PILE_VIDE => put("La pile est vide");
            when others => put("il y'a une autre erreur");  
            
    end depiler;

    --********************Les procédures**************************

    procedure empiler(F_e:in T_element;F_p:in out T_Pile_Entier) is
        courant,q:T_Pile_Entier;
        
        begin
        courant:=F_p;
        if courant = null then
            F_p:= new T_Cellule_Entier'(F_e,courant);
        else
            q:= new T_Cellule_Entier'(F_e,courant);
            F_p:=q;
        end if;
    end empiler;


    procedure afficher(F_p:in out T_Pile_Entier) is 
        courant:T_Pile_Entier;
        elt:Float;
        begin
        courant:=F_p;
        
        if courant /= null then
            loop
            new_line;
            elt:=Float(courant.all.element);
            put(Float'image(elt));
            courant:=courant.all.suivant;
            exit when courant=null;
            end loop;
        end if;

    end afficher;
    

    procedure calcul(F_p:in out T_Pile_Entier) is
        ELT_EXCEPTION:exception;
        ELT1_EXCEPTION:exception;
        commande:STRING(1..10); --nombre,operation,...
        longueur: integer; 
        n:T_element; --l'entier saisi dans la commande
        o:character; --reçoit le caractère de l'opération
        nb1:T_element; --nombre 1 du calcul
        nb2:T_element; --nombre 2 du calcul
        res:T_element; --résultat du calcul entre nb1 et nb2
        begin
        loop
        exit when 0>1;

        put("  +  |  -  |  *  |  /  |  C  ");
        new_line;

        get_line(commande,longueur); --récupère la commande saisie par l'utilisateur
        o:=commande(1);
        
        new_line;
        case o is
            
            when '+' =>     nb1:=depiler(F_p); --récupère le premier nombre au sommet de la pile
                            nb2:=depiler(F_p); --récupère le deuxième nombre au sommet de la pile
                            res:=nb1+nb2;       --effectue l'addition  
                            empiler(res,F_p);  --met le resultat au sommet de la pile

            when '-' =>     nb1:=depiler(F_p); --récupère le premier nombre au sommet de la pile
                            nb2:=depiler(F_p); --récupère le deuxième nombre au sommet de la pile
                            res:=nb1-nb2;       --effectue la soustraction    
                            empiler(res,F_p);  --met le resultat au sommet de la pile

            when '*' =>     nb1:=depiler(F_p); --récupère le premier nombre au sommet de la pile
                            nb2:=depiler(F_p); --récupère le deuxième nombre au sommet de la pile
                            res:=nb1*nb2;       --effectue la multiplication   
                            empiler(res,F_p);  --met le resultat au sommet de la pile

            when '/' =>     nb1:=depiler(F_p); --récupère le premier nombre au sommet de la pile
                            nb2:=depiler(F_p); --récupère le deuxième nombre au sommet de la pile
                            res:=nb1/nb2;       --effectue la division   
                            empiler(res,F_p);  --met le resultat au sommet de la pile
            when 'C' =>     F_p:=creer_pile_vide;

            when others =>  n:=T_element'value(commande(1..longueur)); 
                            empiler(n,F_p);
                            
        end case;

        new_line;
        afficher(F_p);
        new_line;
   
        end loop;
        exception
        when CONSTRAINT_ERROR => calcul(F_p);
        when others => calcul(F_p);
        
        
    end calcul;


end pile_gen;
