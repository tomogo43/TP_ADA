--******************************************************************
--               Structure de données et paquetages
--******************************************************************

--******************************************************************
--                          description
-- Liste doublement chainée triée
--******************************************************************

--Déclaration des bibliothèques

with liste_double;
use liste_double;

with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure test is
    liste:T_Liste_Double;
    begin

    --créer une liste vide
    liste:=creer_liste_vide;

    --insere un element dans liste
    insere_element(2,liste);
    insere_element(3,liste);
    insere_element(4,liste);
    insere_element(5,liste);

    --affichage de la liste double
    affichage(liste);
end test;