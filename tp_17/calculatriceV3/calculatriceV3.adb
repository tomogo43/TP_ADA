--******************************************************************
--                       Calculatrice à pile V3
--******************************************************************

--******************************************************************
--                          description
-- Créer une calculatrice en utilisant les piles génériques
--******************************************************************

--Déclaration des bibliothèques
with pile_gen; --pas de clause use puisqu'on va l'instancier

with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure calculatriceV3 is
	
	package p_pile_float is new pile_gen(float);
	use p_pile_float;
	
	package p_pile_long_float is new pile_gen(long_float);
	use p_pile_long_float;
	
	pile:p_pile_float.T_Pile_Entier; --écriture pointéesur p_pile_float
	


	
	
	begin --debut du programme
	
	pile:=creer_pile_vide; --initialisation d'une pile vide

    new_line;
    calcul(pile); --lancement de la calculatriceV3
	


end calculatriceV3; --fin du programme