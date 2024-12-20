unit unitCreerPartieLogic;
{Role: Permet de lancer une partie et de rentrer les informations demander.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
  // Procédure qui lance une nouvelle partie
  procedure creerPartie();
  
implementation
  uses
    unitCreerPartieIHM, GestionPerso, unitHallIhm;
  
  // Procédure qui lance une nouvelle partie
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
