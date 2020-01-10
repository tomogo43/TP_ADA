--******************************************************************
--                     Paquetage du jeu du morpion
--******************************************************************

package paquetage is 
    KMAX:constant Integer:=10; --taille max du damier

    type SYMBOLE is (LIBRE,ROND,CROIX); --contenu d'une case du damier

    type DAMIER is                          
        array(1..KMAX,1..KMAX) of SYMBOLE;  --un damier
    
    type JOUEUR is (JROND,JCROIX); --deux joueurs seulement

    type ETAT_JEU is (EN_COURS, GAGNE, NUL); 
	
	--*************************Fonctions***********************************
	
	--*************************Procedures***********************************
	
	--*********************************************************************
    --nom: initialiser_jeu
    --sémantique: initialise le jeu du morpion
    --paramètres:
    --      le_damier: Mode(IN/OUT) DAMIER; support du jeu initialisé à vide
    --      le_n: Mode(IN) Integer; dimension du damier
    --      le_joueur: Mode(IN/OUT) JOUEUR; détermine le joueur qui commence  
    --pré condition: aucune
    --post condition: le_damier est vide est prêt à être joué
    --*********************************************************************  
    procedure initialiser_jeu(le_damier:in out DAMIER;le_n:Integer;le_joueur:in out JOUEUR);
    
    --*********************************************************************
    --nom: afficher_jeu
    --sémantique: Affiche le damier à l'écran
    --paramètres:
    --      le_damier: Mode(IN) DAMIER; damier à afficher à l'écran
    --      le_n: Mode(IN) Integer; dimension du damier
    --pré condition: n>=3 n<=10
    --post condition: affiche le damier
    --*********************************************************************  
    procedure afficher_jeu(le_damier:in DAMIER;le_n:in Integer);
    
    --*********************************************************************
    --nom: jouer
    --sémantique: Invite les deux joueurs à jouer et modifie le demaier
    --paramètres:
    --      le_damier: Mode(IN/OUT) DAMIER; 
    --      le_n: Mode(IN) Integer; dimension du damier
    --		le_joueur: Mode(IN/OUT) JOUEUR; En fonction du joueur qui a la main
    --		l_etat: Mode(IN/OUT) ETAT_JEU; Détermine si le jeu est gagné 
    --pré condition: l_etat = EN_COURS
    --post condition: fait évoluer le jeu et le damier
    --*********************************************************************  
    procedure jouer(le_damier: in out DAMIER;le_n:Integer;le_joueur:in out JOUEUR;l_etat:in out ETAT_JEU);
   
    --*********************************************************************
    --nom: afficher_fin_de_jeu
    --sémantique: Lors d'une fin de partie affiche le damier final et le nom du gagnat si partie gagnée
    --paramètres:
    --      le_damier: Mode(IN) DAMIER; affiche le damier final 
    --      le_n: Mode(IN) Integer; dimension du damier
    --		le_joueur: Mode(IN/OUT) JOUEUR; Joueur qui a réalisé le dernier coup
    --		l_etat: Mode(IN/OUT) ETAT_JEU; Détermine si le jeu est gagné ou match nul
    --pré condition: l_etat /= EN_COURS
    --post condition: affiche la fin de partie
    --*********************************************************************   
    procedure afficher_fin_de_jeu(le_damier:in DAMIER;le_n:in Integer;le_joueur:in JOUEUR;l_etat:in ETAT_JEU);

end paquetage;
