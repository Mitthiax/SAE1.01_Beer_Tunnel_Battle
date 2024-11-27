unit unitCreerPartieLogic;

{$mode objfpc}{$H+}

interface
  // Procedure qui lance une nouvelle partie
  procedure creerPartie();
  
implementation
  uses
    unitCreerPartieIHM, GestionPerso, unitBeersIhm;
  
  // Procedure qui lance une nouvelle partie
  procedure creerPartie();
  var
    nom: string; // Nom du joueur
    taille: integer; // Taille du joueur en centimètre
    genre: string; // Genre du joueur

  begin
    creerPartieIHM(nom, taille, genre);
    InitialisationPersonnage(nom, taille, genre);
    afficherInterface();
  end;
  
end.