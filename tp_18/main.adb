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
    begin
    initialiser(m_abr);

    put(taille(m_abr));
    inserer(m_abr,2);
    inserer(m_abr,11);
    inserer(m_abr,5);
    inserer(m_abr,10);
    new_line;
    put(taille(m_abr));
end main;