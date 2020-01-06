--******************************************************************
--                      corps du paquetage
--******************************************************************

--******************************************************************
--                  initialisation du jeu
--******************************************************************

--Déclaration des bibliothèques

with text_io;
use text_io;

WITH Ada.Text_IO ;
USE Ada.Text_IO ;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

PACKAGE BODY initialisation IS
    procedure initialiser_jeu(le_damier: in out DAMIER;le_n:Integer;le_joueur:in out JOUEUR) IS
        --pre condition: n>=3 et n<=10
        --post condition: initialise le damier et le joueur

        i:Integer;
        j:Integer;

        begin --debut initialiser

        --Toutes les cases du damier sont passées à LIBRE
        for i in 1 .. le_n loop
            for j in 1 .. le_n loop
                le_damier(i,j):=LIBRE;
            end loop;
        end loop;

        put("initialisation");
    end initialiser_jeu;
END initialisation;
