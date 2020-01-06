--******************************************************************
--                       Calculatrice à pile V2
--******************************************************************

--******************************************************************
--                          description
-- Créer une calculatrice en utilisant les piles V2 avec un paquetage
--générique p_pile
--******************************************************************

--Déclaration des bibliothèques
with p_pile_gen;

with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure calculatriceV2 is
    ELT_EXCEPTION:exception;
    ELT1_EXCEPTION:exception;
    commande:STRING(1..10); --nombre,operation,...
    longueur: integer; 
    n:integer; --l'entier saisi dans la commande
    o:character; --reçoit le caractère de l'opération

    procedure calcul is

        package p_pile_netier is new p_pile_gen(integer);
        use p_pile_netier;
        pile:T_Pile_Entier;

        nb1:Integer; --nombre 1 du calcul
        nb2:Integer; --nombre 2 du calcul
        res:Integer; --résultat du calcul entre nb1 et nb2
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

            when others =>  n:=integer'value(commande(1..longueur)); 
                            empiler(n,pile);
                            
        end case;

        new_line;
        afficher(pile);
        new_line;
   
        end loop;
        exception
        when CONSTRAINT_ERROR => calcul;
        when others => put("une autre erreur est survenu dans le programme");
    end calcul;

    begin

    calcul;
    
    

    
end calculatriceV2;