--TP1 Programmation impérative
--2) Jeu du devin

--Spécification
--R0[Algorithme qui fait deviner à la machine un nombre saisi par l'utilisateur entre 1 et 100]
--R1:Comment R0

--Chargement des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;


procedure jeu_devin2 is   
    --Variables
    Nb:Integer;              --Nb mystère saisi par l'utilisateur 
    Nb_essai:Integer:=0;     --Nb d'essais de l'ordinateur
    --Utilisation du principe de dichotomie pour deviner le nombre saisi   
    borne_inf:Integer:=1;    --Borne inférieur   
    borne_sup:Integer:=100;  --Borne supérieure 
    centre:Integer;          --Centre de l'interval sup et inf
    c:Character;             --permet de dire si sup,inf ou eg
    begin
        --R1-1 Saisir un entier naturel entre 1 et 100
            --R2 Comment R1-1
            loop
                put("Saisir un nombre entre 1 et 100");
                New_Line;
                Get(Nb);
            exit when Nb>=1 and Nb<=100;
            end loop;
        --R1-1 Faire deviner à l'ordinateur le nombre mystère
            --R2 comment R2-1
            loop
                 --R3-1 Déterminer le nombre d'essais
                Nb_essai:=Nb_essai+1;
                --R3-2 Par dichotomie déterminer le nombre d'éssai
                New_Line;

                centre:=(borne_sup+borne_inf)/2; --Obtenir le centre de l'interval 

                --R3-3 déterminer si c'est supérieur ou inférieur 
                    --R4
                    put("L'ordinateur indique ");
                    put(centre);
                    put(" est ce plus (>) moins (<) ou égal (=) ?");
                    New_line;
                    Get(c);
                    New_Line;
                    case c is
                        when '<' => --Le nombre est plus grand que le nb saisi
                            put("C'est moins");
                            New_Line;
                            borne_sup:=centre;
                        when '>' =>  --Le nombre est plus petit que le nb saisi
                            borne_inf:=centre;
                            put("C est plus");
                            New_Line;
                        when '=' =>  --Le nombre est égal au nb saisi
                            put("Bien joué vous avez trouvé le nombre mystere en ");
                            put(Nb_essai);
                            put(" essai(s)");
                            New_Line;
                        when others => --saisi incorrect
                            put("Saisi incorrect");
                            New_Line;
                        end case;
            exit when Nb=centre;
            end loop;
end jeu_devin2;