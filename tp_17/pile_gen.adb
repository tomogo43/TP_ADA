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
        elt:Integer;
        begin
        courant:=F_p;
        
        if courant /= null then
            loop
            new_line;
            elt:=Integer(courant.all.element);
            put(Integer'image(elt));
            courant:=courant.all.suivant;
            exit when courant=null;
            end loop;
        end if;

    end afficher;

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
end pile_gen;
