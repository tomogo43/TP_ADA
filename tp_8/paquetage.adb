--******************************************************************
--                      corps du paquetage
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

PACKAGE BODY paquetage IS
	
	--******************************Fonctions*****************************
	
	
	
	--******************************Procedures*****************************
	
	--procedure initialiser_jeu
    procedure initialiser_jeu(le_damier: in out DAMIER;le_n:Integer;le_joueur:in out JOUEUR) IS
		--R0[Initialise le damier d'une partie de morpion]
			

        i:Integer;
        j:Integer;

        begin --debut initialiser

		--R1:Comment R0
		
        --Toutes les cases du damier sont passées à LIBRE
        for i in 1 .. le_n loop
            for j in 1 .. le_n loop
                le_damier(i,j):=LIBRE;
            end loop;
        end loop;

        put("initialisation");
    end initialiser_jeu;
    
    --procedure qui affiche le damier de la partie en cours
    procedure afficher_jeu(le_damier:DAMIER;le_n:Integer) is
		--R0:[Comment afficher le jeu]
		
        begin --debut afficher_jeu
        
        --R1:Comment R0
		--	(1)Parcourir le damier
        
        new_line; 
        
        --R2:Comment R1
        for i in 1 .. le_n loop
            for j in 1 .. le_n loop
				--R3:Afficher l'état de la case
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
    
		--R0:Comment faire joueur deux joueurs au jeu du morpion
		
        aligneL:Integer; --permet de savoir si 3 pions sont alignés en ligne
        aligneC:Integer; --permet de savoir si 3 pions sont alignés en colonne
        aligneD1:Integer; --permet de savoir si 3 pions sont alignés à la diagonale 1
        aligneD2:Integer; --permet de savoir si 3 pions sont alignés à la diagonale 2
        nbCoup:Integer;
        k:integer;
        i:integer;
        j:integer;
        begin --debut joueur
		
		--R1:Comment R0;
		--	(1)Invite le joueur qui a la main de saisir un choix de position valide
		--	(2)Vérifie l'état de la partie (match gagné, match nul)
		
        nbCoup:=nbCoup+1; --compte le nombre de coups dans la partie

        --R2:Comment R1-1
        new_line;
        put("joueur: ");
        if le_joueur = JCROIX then
            put("X");
        else
            put("O");
        end if;

        new_line;
        
        --R3:Vérifie la validité de l'emplacement du joueur 
        
        loop --boucle tant qu'emplacement non vailide 
			
			--R4-1:Saisie d'une ligne valide
			
            loop --boucle tant que ligne invalide
                put("saisissez une ligne");
                new_line;
                get(i);
            exit when i>0 and i<=le_n;
            put("veuillez saisir une ligne valide"); --affiche message erreur
            new_line;
            end loop;
            new_line;
            
            --R4-1:Saisie d'une colonne valide
            
            loop --boucle tant que ligne invalide
                put("saisissez une colonne");
                new_line;
                get(j);
            exit when j>0 and j<=le_n;
            put("veuillez saisir une colonne valide"); --affiche message erreur
            new_line;
            end loop;
        
        --Emplacement déjà occupé
        exit when le_damier(i,j)=LIBRE;
        put("emplacement déjà pris"); --affiche message erreur
        new_line;
        end loop;
		
		--R2:Comment R1-2
		
        --Vérifier si jetons alignés ligne/colonne
        aligneL:=0;
        aligneC:=0;
        aligneD1:=0;
        aligneD2:=0;

		--R3-Vérifier si le premier joueur a gagné
		--	(1)Vérifier si alignement sur la ligne i
		--	(2)Vérifier si alignement sur la colonne j
		--	(3)Vérifier si alignement sur une des diagonales
		
        if le_joueur = JCROIX then --verifie si joueur CROIX gagne
            le_damier(i,j):=CROIX;

            for k in 1 .. le_n loop
				--R4:Comment R3-1
                if le_damier(i,k)=CROIX then
                    aligneL:=aligneL+1; --si aligné sur une ligne
                end if;
                --R4:Comment R3-2
                if le_damier(k,j)=CROIX then
                    aligneC:=aligneC+1;  --si aligné sur une colonne
                end if;
            end loop;
			
			--R4:Comment R3-3
            for k in 1 .. le_n loop
                if le_damier(K,k)=CROIX then
                    aligneD1:=aligneD1+1; --si aligné sur la diagonale 1
                end if;
                if le_damier(K,(le_n+1)-k)=CROIX then
                    aligneD2:=aligneD2+1; --si aligné sur la diagonale 2
                end if;
            end loop;
		
		--R3-Vérifier si le deuxième joueur a gagné
		--	(1)Vérifier si alignement sur la ligne i
		--	(2)Vérifier si alignement sur la colonne j
		--	(3)Vérifier si alignement sur une des diagonales
        else --vérifie si joueur ROND gagne
            le_damier(i,j):=ROND;

            for k in 1 .. le_n loop
            
				--R4:Comment R3-1
                if le_damier(i,k)=ROND then
                    aligneL:=aligneL+1;
                end if;
                
                --R4:Comment R3-2
                if le_damier(k,j)=ROND then
                    aligneC:=aligneC+1;
                end if;
            end loop;
            
             --R4:Comment R3-3
            for k in 1 .. le_n loop
                if le_damier(K,k)=ROND then
                    aligneD1:=aligneD1+1;
                end if;
                if le_damier(K,(le_n+1)-k)=ROND then
                    aligneD2:=aligneD2+1;
                end if;
            end loop;
        end if;
		
		--R2:Comment R1-2
		
        if aligneC=le_n or aligneL=le_n or aligneD1=le_n or aligneD2=le_n then
            l_etat:= GAGNE;
           
        elsif nbCoup = (le_n**le_n) then  --nombre de coups atteint
            l_etat:= NUL; --aucun joueur n'a gagné
        else
            if le_joueur = JCROIX then --récupère le dernier joueur a avoir joué
				
                le_joueur:=JROND; --alterne joueur
            else
                le_joueur:=JCROIX; --alterne joueur
            end if;
        end if;

        
    end jouer; --fin jouer
    
    --procédure qui affiche une fin de partie
    procedure afficher_fin_de_jeu(le_damier:DAMIER;le_n:Integer;le_joueur:JOUEUR;l_etat:ETAT_JEU) is
		--R0:[Afficher une fin de partie]
		
        begin --debut afficher fin de jeu
        
        --R1:Comment R0
        
        afficher_jeu(le_damier,3);
		
		--R2:Si jeu gagné par O ou X
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
		
		--R2:Si aucun des joueurs n'a gagné
        if l_etat = NUL then
            put("match nul");
        end if;

    end afficher_fin_de_jeu;
    
    
    
END paquetage;
