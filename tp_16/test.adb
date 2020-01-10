--******************************************************************
--                            La pile
--******************************************************************

--******************************************************************
--                          description
-- Programme de test d'une pile chaînée
--******************************************************************

--Déclaration des bibliothèques
with pile_entier;
use pile_entier;

with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure test is
    pile:T_Pile_Entier;
    begin
    
    --jeu de test 
    pile:=creer_pile_vide;
    
    empiler(2,pile);
    --2
    empiler(3,pile);
    --3
    --2
    empiler(4,pile);
    --4
    --3
    --2
    empiler(5,pile);
    --5
    --4
    --3
    --2
    afficher(pile);

    put(depiler(pile));
    --5 -->
    --4
    --3
    --2
    new_line;
    afficher(pile);
    
    --4
    --3
    --2

end test;
