--******************************************************************
--                    arbre binaire de recherche
--******************************************************************

--******************************************************************
--                          description
-- 
--******************************************************************

--Déclaration des bibliothèques
with arbre;
use arbre;

with text_io;
use text_io;

with ada.integer_text_io;
use ada.integer_text_io;

with ada.float_text_io;
use ada.float_text_io;

procedure main is
    m_abr:T_AB;
    t_abr:integer:=0;
    niveau:integer:=1;
    begin
    initialiser(m_abr);

    put(taille(m_abr,t_abr));

    inserer(m_abr,3);

    put(taille(m_abr,t_abr));

    t_abr := 0;
    inserer(m_abr,2);
    inserer(m_abr,6);
    inserer(m_abr,1);

    put(taille(m_abr,t_abr));

    --afficher(m_abr,niveau);



end main;