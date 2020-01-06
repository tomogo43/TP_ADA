--******************************************************************
--                TP 11: Enregistrement avec pointeur
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

procedure ex2 is

    --****Déclarations****

    CMAX:constant Integer:=5;
    type PFLOAT is access float;

    type MATIERE is
        record
            code:string(1..CMAX);
            note:PFLOAT:=null;
        end record;
    

    matiere1: MATIERE;
    
    --****procedures****

    --procédure qui initialise une matière
    procedure initmatiere(pmatiere:in out MATIERE;code:string) is
        begin --debut init
        pmatiere.code:=code;

        --initialisation du pointeur note
        pmatiere.note := null;
    end initmatiere; --fin init

    --procédure qui affiche une matière
    procedure affmatiere(pmatiere:in MATIERE) is
        begin --debut affmatiere
        new_line;
        put(pmatiere.code);
        new_line;
        if pmatiere.note /= null then
            put(pmatiere.note.all); 
            new_line;  
        end if;
          
    end affmatiere; --fin affmatiere

    --procédure qui modifie la note d'une matiere
    procedure modifmatiere(pmatiere:in out MATIERE;note:float) is
        begin --debut moifmatiere

        --si pointeur null
        if pmatiere.note = null then
            pmatiere.note := new float;
        end if;
        pmatiere.note.all := note;
    end modifmatiere; --fin moifmatiere




    begin --debut programme

    --initialisation de la matière

    initmatiere(matiere1,"maths");
    
    --affichage de la matière

    affmatiere(matiere1);

    modifmatiere(matiere1,float(10));

    affmatiere(matiere1);

    put("test");

end ex2; --fin programme