--package initialisation

PACKAGE initialisation IS

    KMAX:constant Integer:=10; --taille max du damier

    type SYMBOLE is (LIBRE,ROND,CROIX); --contenu d'une case du damier

    type DAMIER is                          
        array(1..KMAX,1..KMAX) of SYMBOLE;  --un damier
    
    type JOUEUR is (JROND,JCROIX); --deux joueurs seulement

    type ETAT_JEU is (EN_COURS, GAGNE, NUL); 

    procedure initialiser_jeu(le_damier:in out DAMIER;le_n:Integer;le_joueur:in out JOUEUR);
END initialisation ;
