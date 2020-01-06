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
    pile,pile2:T_Pile_Entier;
    begin
    pile:=creer_pile_vide;
    pile2:=creer_pile_vide;
    empiler(2,pile);
    empiler(3,pile);
    empiler(4,pile);
    empiler(5,pile);
    afficher(pile);

    depiler(pile);
    new_line;
    afficher(pile);

end test;