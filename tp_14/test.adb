--******************************************************************
--                       Paquetage et généricité
--******************************************************************

--******************************************************************
--                          description
-- Programme de test d'une liste chaînée
--******************************************************************

--Déclaration des bibliothèques
with P_liste;
use P_liste;

with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure test is
    liste,liste2:T_Liste_Entier;
    begin
        liste:=creer_liste_vide;
        liste2:=creer_liste_vide;
        if est_vide(liste) = true then
            put("la liste liste est vide");
        end if;

        inserer_en_tete(2,liste);
        new_line;
        if est_vide(liste) = true then
            put("la liste liste est vide");
        else
            put("la liste n'est pas vide");
        end if;

        --afficher_liste(liste);

        inserer_apres(1,2,liste);
        inserer_apres(3,1,liste);
        inserer_apres(10,2,liste);
        inserer_avant(5,2,liste);

        afficher_liste(liste);
        new_line;
        put("**");
        inserer_avant(24,2,liste);
        afficher_liste(liste);
        new_line;
        put("**");

        enlever(1,liste);
        afficher_liste(liste);
end test;
