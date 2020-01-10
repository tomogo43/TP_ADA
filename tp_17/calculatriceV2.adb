--******************************************************************
--                       Calculatrice à pile V2
--******************************************************************

--******************************************************************
--                          description
-- Créer une calculatrice en utilisant les piles génériques
--******************************************************************

--Déclaration des bibliothèques
with pile_gen;
--use pile_gen; pas de clause use

with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure calculatriceV2 is
	
	package p_pile_float is new pile_gen(float);
	use p_pile_float;
	
	package p_pile_long_float is new pile_gen(long_float);
	use p_pile_long_float;
	
	pile:p_pile_float.T_Pile_Entier; --écriture pointéesur p_pile_float
	
	ELT_EXCEPTION:exception;
    ELT1_EXCEPTION:exception;
    commande:STRING(1..10); --nombre,operation,...
    longueur: integer; 
    n:float; --l'entier saisi dans la commande
    o:character; --reçoit le caractère de l'opération
	
	procedure calcul is
        nb1:float; --nombre 1 du calcul
        nb2:float; --nombre 2 du calcul
        res:float; --résultat du calcul entre nb1 et nb2
        begin
        loop
        exit when 0>1;
        get_line(commande,longueur);
        o:=commande(1);
        case o is
            when '+' =>     nb1:=depiler(pile); --récupère le premier nombre au sommet de la pile
                            nb2:=depiler(pile); --récupère le deuxième nombre au sommet de la pile
                            res:=nb1+nb2;       --effectue l'addition    
                            empiler(res,pile);  --met le resultat au sommet de la pile

            when '-' =>     nb1:=depiler(pile); --récupère le premier nombre au sommet de la pile
                            nb2:=depiler(pile); --récupère le deuxième nombre au sommet de la pile
                            res:=nb1-nb2;       --effectue la soustraction    
                            empiler(res,pile);  --met le resultat au sommet de la pile

            when '*' =>     nb1:=depiler(pile); --récupère le premier nombre au sommet de la pile
                            nb2:=depiler(pile); --récupère le deuxième nombre au sommet de la pile
                            res:=nb1*nb2;       --effectue la multiplication   
                            empiler(res,pile);  --met le resultat au sommet de la pile

            when '/' =>     nb1:=depiler(pile); --récupère le premier nombre au sommet de la pile
                            nb2:=depiler(pile); --récupère le deuxième nombre au sommet de la pile
                            res:=nb1/nb2;       --effectue la division   
                            empiler(res,pile);  --met le resultat au sommet de la pile

            when others =>  n:=Float'value(commande(1..longueur)); 
                            empiler(n,pile);
                            
        end case;

        new_line;
        afficher(pile);
        new_line;
   
        end loop;
        exception
        when CONSTRAINT_ERROR => calcul;
        when others => calcul;
        
        
    end calcul;
	
	
	begin --debut du programme
	
	pile:=creer_pile_vide;
	empiler(3.0,pile);
	empiler(4.0,pile);
	empiler(5.0,pile);
	empiler(6.0,pile);
	afficher(pile);
	
	calcul;


end calculatriceV2; --fin du programme
