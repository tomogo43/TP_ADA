--TP2 Programmation impérative
--1) Drone commandé par un menu en ADA

--Spécification
--R0[Création d'un menu textuel permettant de contrôler le drone]
--R1:Comment R0

--Chargement des bibliothèques
with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure drone is
    c:Character; --Choix de l'utilisateur 
    d:Boolean:=false; --option de démarrage
    m:Boolean:=false; --option de montée
    s:Boolean:=false; --option de descente
    q:Boolean:=false; --option pour quitter le menu textuel initialisé à 1 par défaut car interface éteinte
    altitude:Integer:=0; --altitude du drone
    begin
    --R1-1 Saisir un choix pour démarrer le drone
    put("Appuyer sur d pour démarrer le drone");
    Get(c);
    loop
        case c is
            when 'd' =>
                put("Appuyer sur m pour monter");
                New_Line;
                put("Appuyer sur q pour quitter");
                New_Line;
                Get(c);
            when 'm' =>
                altitude:=altitude+1;
                if altitude<5 then
                    put("Appuyer sur m pour monter");
                    New_Line;
                    put("Appuyer sur s pour descendre");
                    New_Line;
                    put("Appuyer sur q pour quitter");
                    New_Line;
                    Get(c);
                elsif altitude>5 then
                    put("Deconnexion drone hors de portée");
                    q:=true;
                end if;
            when 's' =>
                altitude:=altitude-1;
                if altitude =0 then
                    put("Appuyer sur m pour monter");
                    New_Line;
                    put("Appuyer sur q pour quitter");
                    New_Line;
                    Get(c);
                elsif altitude>0 then
                    put("Appuyer sur m pour monter");
                    New_Line;
                    put("Appuyer sur s pour descendre");
                    New_Line;
                    put("Appuyer sur q pour quitter");
                    New_Line;
                    Get(c);
                elsif altitude<0 then
                    put("Arrêt");
                    New_Line;
                    q:=true;
                end if;
            when 'q' =>
                put("Arrêt");
                New_Line;
                q:=true;
            when others =>
                if d=false then
                    put("Appuyer sur d pour démarrer le drone");
                    Get(c);
                elsif d=true then 
                    put("Arrêt");
                    New_Line;
                    q:=true;
                end if;
        end case;
    exit when q=true and d=false;
    end loop;
end drone;