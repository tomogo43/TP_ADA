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

with initialisation;
use initialisation;


procedure morpion is

    --****Déclaration****
    i:Integer;
    j:Integer;

    nbCoup:Integer; --nombre de coups

    le_damier:DAMIER; --le damier
    le_n:Integer; --dimension réelle du damier entre 3 et KMAX
    le_joueur: JOUEUR; --le joueur courant
    l_etat:ETAT_JEU; --etat courant du jeu
    
    --*****procedures****

    --procedure qui affiche le damier de la partie en cours
    procedure afficher_jeu(le_damier:DAMIER;le_n:Integer;le_joueur:JOUEUR) is
        --pre condition: n>=3 et n<=10
        --post condition: affiche le damier
        begin --debut afficher_jeu
        new_line;
        for i in 1 .. le_n loop
            for j in 1 .. le_n loop
                if le_damier(i,j)=LIBRE then
                    put("     *     ");
                end if;
                if le_damier(i,j)=ROND then
                    put("     O     ");
                end if;
                if le_damier(i,j)=CROIX then
                    put("     X     ");
                end if;
            end loop;
            new_line;
        end loop;

    end afficher_jeu; --fin afficher jeu 

    --procédure qui fait joueur les joueurs
    procedure jouer(le_damier: in out DAMIER;le_n:Integer;le_joueur:in out JOUEUR;l_etat:in out ETAT_JEU) is
        aligneL:Integer; --permet de savoir si 3 pions sont alignés en ligne
        aligneC:Integer; --permet de savoir si 3 pions sont alignés en colonne
        aligneD1:Integer; --permet de savoir si 3 pions sont alignés à la diagonale 1
        aligneD2:Integer; --permet de savoir si 3 pions sont alignés à la diagonale 2
        k:Integer;
        begin --debut joueur

        nbCoup:=nbCoup+1; --compte le nombre de coups dans la partie

        --Invite le joueur courant à jouer
        new_line;
        put("joueur: ");
        if le_joueur = JCROIX then
            put("X");
        else
            put("O");
        end if;

        new_line;
        loop --boucle tant qu'emplacement non vailide 

            loop --boucle tant que colonne invalide
                put("saisissez une colonne");
                new_line;
                get(i);
            exit when i>0 and i<=le_n;
            put("veuillez saisir une colonne valide"); --affiche message erreur
            new_line;
            end loop;
            new_line;
            loop --boucle tant que ligne invalide
                put("saisissez une ligne");
                new_line;
                get(j);
            exit when j>0 and j<=le_n;
            put("veuillez saisir une ligne valide"); --affiche message erreur
            new_line;
            end loop;
        exit when le_damier(i,j)=LIBRE;
        put("emplacement déjà pris"); --affiche message erreur
        new_line;
        end loop;

        --Vérifier si jetons alignés ligne/colonne
        aligneL:=0;
        aligneC:=0;
        aligneD1:=0;
        aligneD2:=0;

        if le_joueur = JCROIX then --verifie si joueur CROIX gagne
            le_damier(i,j):=CROIX;

            for k in 1 .. le_n loop
                if le_damier(i,k)=CROIX then
                    aligneL:=aligneL+1; --si aligné sur une ligne
                end if;
                if le_damier(k,j)=CROIX then
                    aligneC:=aligneC+1;  --si aligné sur une colonne
                end if;
            end loop;

            for k in 1 .. le_n loop
                if le_damier(K,k)=CROIX then
                    aligneD1:=aligneD1+1; --si aligné sur la diagonale 1
                end if;
                if le_damier(K,(le_n+1)-k)=CROIX then
                    aligneD2:=aligneD2+1; --si aligné sur la diagonale 2
                end if;
            end loop;

        else --vérifie si joueur ROND gagne
            le_damier(i,j):=ROND;

            for k in 1 .. le_n loop
                if le_damier(i,k)=ROND then
                    aligneL:=aligneL+1;
                end if;
                if le_damier(k,j)=ROND then
                    aligneC:=aligneC+1;
                end if;
            end loop;
            for k in 1 .. le_n loop
                if le_damier(K,k)=ROND then
                    aligneD1:=aligneD1+1;
                end if;
                if le_damier(K,(le_n+1)-k)=ROND then
                    aligneD2:=aligneD2+1;
                end if;
            end loop;
        end if;

        --vérifier si jetons alignés en diagonale
        put(aligneD1);
        if aligneC=le_n or aligneL=le_n or aligneD1=le_n or aligneD2=le_n then
            l_etat:= GAGNE;
           
        elsif nbCoup = (le_n**le_n) then  --nombre de coups atteint
            l_etat:= NUL;
        else
            if le_joueur = JCROIX then
                le_joueur:=JROND; --alterne joueur
            else
                le_joueur:=JCROIX; --alterne joueur
            end if;
        end if;

        
    end jouer; --fin jouer

    --procédure qui affiche une fin de partie
    procedure afficher_fin_de_jeu(le_damier:DAMIER;le_n:Integer;le_joueur:JOUEUR;l_etat:ETAT_JEU) is
        begin --debut afficher fin de jeu
        afficher_jeu(le_damier,3,le_joueur);

        if l_ETAT = GAGNE then
            new_line;
            put("joueur ");
            if le_joueur = JCROIX then
                put("X");
            else
                put("0");
            end if;
            put(" gagne");
            new_line;
        end if;

        if l_etat = NUL then
            put("match nul");
        end if;

    end afficher_fin_de_jeu;

    begin --debut du programme

    --****initialiser le jeu****

    le_joueur:=JROND; --initialisation du premier joueur

    initialiser_jeu(le_damier,3,le_joueur);

    --****Jouer****
    

    loop

    afficher_jeu(le_damier,3,le_joueur);

    jouer(le_damier,3,le_joueur,l_etat);

    


    exit when l_etat/=EN_COURS;
    end loop;

    --****partie terminée soit gagné soit nul****
    afficher_fin_de_jeu(le_damier,3,le_joueur,l_etat);
    

end morpion; --fin du programme
