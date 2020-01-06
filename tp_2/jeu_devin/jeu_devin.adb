--TP1 Programmation impérative
--1) Jeu du devin

--Spécification
--R0[Algorithme qui choisit un nombre aléatoire entre 1 et 100 et le fait deviner à l'utilisateur]
--R1:Comment R0

--Chargement des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

--procédure alea
with Alea;
use Alea;

procedure jeu_devin is   
    Nb:Integer; --Nombre aléatoire entre 1 et 100 choisi aléatoirement par la machine
    Nb_saisi:Integer; --Nombre saisi par l'utilisateur
    Nb_essai:Integer:=0; --Détermine le nombre de tentatives à l'utilisateur pour trouver le numéro

    begin
        --R1-1 Choisir un nombre aléatoire entre 1 et 100
        Nb:=Alea_1_100; --appel de la fonction fournissant un nombre aléatoire
        --R1-2 Faire deviner le nombre au joueur et afficher le nombre d'essais 
        loop 
            --R2-1 Demander à l'utilisateur de saisir un nombre
            put("Veuillez saisir un nombre entre 1 et 100");
            New_Line;
            Get(Nb_saisi);
            Nb_essai:=Nb_essai+1;
            --R2-2 Vérifier si l'utilisateur a trouvé le nombre
            if Nb_saisi=Nb then
                put("Bravo vous avez trouvez le nombre mystère ");
                put(Nb);
                put(" en ");
                put(Nb_essai);
                put(" essai(s)");
                New_Line;
            elsif Nb_Saisi>Nb then
                put("Non c'est moins !");
                New_Line;
            elsif Nb_saisi<Nb then
                put("Non c'est plus !");
                New_Line;
            end if;
        exit when Nb_saisi=Nb;
        end loop;
end jeu_devin;