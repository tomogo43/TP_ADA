--******************************************************************
--                   arbre binaire et recherche
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

PACKAGE BODY arbre is

    --******************fonctions***************************
    function est_vide(abr:in T_AB) return boolean is 
        begin
        if abr = null then
            return true;
        else
            return false;
        end if;
    end est_vide;

    -----------------------------------------------------------------------------------

    function taille(abr:in T_AB;t_abr:in out integer) return integer is
        courant:T_AB;
        gauche:T_AB;
        droite:T_AB;
        begin

        courant := abr;

        if courant /= null then
            t_abr := t_abr + 1;
            t_abr:=taille(courant.all.sous_arbre_gauche,t_abr);
            t_abr:=taille(courant.all.sous_arbre_droit,t_abr);
        end if;
        
        return t_abr;
    
        
    end taille;

    function recherche(abr:in T_AB;donnee:in integer) return boolean is
        courant:T_AB;
        begin --début de recherche

        courant := abr;

        if courant /= null then

            if courant.all.donnee = donnee then
                return true;
            else
                --appel recursive pour check les deux fils du noeud
                return recherche(courant.all.sous_arbre_droit,donnee);
                return recherche(courant.all.sous_arbre_gauche,donnee);
            end if;
        end if;
    end recherche; --fin de recherche 

    --*******************procedures*************************

    procedure initialiser(abr:out T_AB) is
        begin
        abr:=null;
    end initialiser;

    -----------------------------------------------------------------------------------

    procedure inserer(abr:in out T_AB; donnee: in integer) is
        --R0:[Comment insérer dans l'arbre binaire]
        --tests: voir sujet
        courant:T_AB;
        begin

        courant := abr;
        --R1:Comment R0;

        --R2:Si l'arbre est vide créé un noeuf à la racine
        if abr = null then
            abr:= new T_noeud'(donnee,abr,abr);

        else

        --R2:Sinon dispose l'élément en respectant la relation d'ordre

            --R3:La donnée est supérieur au noeud courant

            if donnee > courant.all.donnee then

                --R4:Placer l'élément sur le sous arbre droit

                if courant.all.sous_arbre_droit =null then
                
   
                    courant.all.sous_arbre_droit := new T_noeud'(donnee,null,null);

                --R4:Trouver une autre disposition dans le sous arbre droit

                else

                    inserer(courant.all.sous_arbre_droit,donnee);
                end if;

            --R3:La donnée est inférieur au noeud courant
            else

                --R4:Placer l'élément sur le sous arbre gauche

                if courant.all.sous_arbre_gauche =null then
                

                    courant.all.sous_arbre_gauche := new T_noeud'(donnee,null,null);

                --R4:Trouver une autre disposition dans le sous arbre gauche
                
                else

                    inserer(courant.all.sous_arbre_gauche,donnee);
                end if;
            end if;

        end if;
    end inserer;

    -----------------------------------------------------------------------------------

    procedure afficher(abr:in T_AB;niveau:in out integer) is
        --R0:[Comment afficher l'arbre binaire à l'écran]"
        --tests voir sujet

        courant:T_AB;
        niveauS:integer; --sauvegarde le niveau courant de l'arbre (1 est le sommet)
        begin --début afficher
        courant := abr;

        --R1:Comment R0

        --R2:Afficher le niveau de l'arbre
        new_line;
        put("niveau ");
        put(niveau);
        new_line;
        put("---------------------------");
        new_line;
        
        new_line;
        niveauS:=niveau;

        --R2:Afficher la valeur du noeud
        put(courant.all.donnee);
        
        --R2:Vérifier si le noeud courant possède des sous noeuds
        if courant.all.sous_arbre_droit /= null then
            niveauS:= niveau+1;
            --R3:Affiche les sous noeuds du sous arbre droit
            afficher(courant.all.sous_arbre_droit,niveauS);
        end if;

        if courant.all.sous_arbre_gauche /= null then
            niveauS:= niveau+1;
            --R3:Affiche les sous noeuds du sous arbre gauche
            afficher(courant.all.sous_arbre_gauche,niveauS);
        end if;

        --descend d'un niveau
        niveau:=niveau+1;

    end afficher; --fin afficher

    procedure supprimer(abr:in out T_AB;donnee:in integer) is

        --R0:[Comment supprimer une donnée de l'arbre]
        courant:T_AB;

        begin --debut de supprimer

        courant:=abr;

        --R1:Comment R0

        --R2:Verifie que donnee est dans l'arbre
        if recherche(abr,donnee) then
            put("ok");
        else 
            put("non");
        end if;
        
    end supprimer; --fin supprimer

end arbre;
