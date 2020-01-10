--******************************************************************
--                         Jeu du morpion
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

with paquetage;
use paquetage;


procedure morpion is
	
	--R0[Réaliser le jeu du morpion]
	--test voir sujet

    --****Déclaration****
    i:Integer;
    j:Integer;

    le_damier:DAMIER; --le damier
    le_n:Integer; --dimension réelle du damier entre 3 et KMAX
    le_joueur: JOUEUR; --le joueur courant
    l_etat:ETAT_JEU; --etat courant du jeu
 

    begin --debut du programme

    --****initialiser le jeu****

    le_joueur:=JROND; --initialisation du premier joueur
    
    --R1:Comment R0
    
    --R2-1:Initialiser le damier
    initialiser_jeu(le_damier,3,le_joueur);

    --R2-2:Jouer au morpion
	--	(1)Affiche le damier courant et invite le joueur avec la main à joeur
	--	(2)Détecter lorsqu'une partie se termine et l'éventuel gagnant
    loop
    
    --R3: Comment R2-2-1
    afficher_jeu(le_damier,3);

    jouer(le_damier,3,le_joueur,l_etat);

    
    exit when l_etat/=EN_COURS;
    end loop;

   --R3: Comment R2-2-2
    afficher_fin_de_jeu(le_damier,3,le_joueur,l_etat);
    

end morpion; --fin du programme
