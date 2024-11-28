unit unitCreerPartieIHM;

{$mode objfpc}{$H+}

interface
  
  // Procedure qui affiche l'interface de création d'une nouvelle partie
  procedure creerPartieIHM(var nom:string; var taille:integer; var genre:string);
  
implementation
  uses
    GestionEcran, unitCoffreLogic;
  
  // Procedure qui affiche l'interface de création d'une nouvelle partie
  procedure creerPartieIHM(var nom:string; var taille:integer; var genre:string);
  var
    choixGenre: integer; // Choix du genre du joueur lors de la creation de la partie

  begin
    dessinerCadreXY(1, 0, 198, 39, simple, White, Black);
    dessinerCadreXY(80, 0, 120, 2, simple, White, Black);
    dessinerCadreXY(90, 1, 110, 3, simple, White, Black);
    deplacerCurseurXY(93, 2); write('Nouvelle partie');

    deplacerCurseurXY(70, 10); write('Quel est votre nom ? : '); readln(nom);
    deplacerCurseurXY(70, 12); write('Quel est votre taille ? (en cm) : '); readln(taille);
    deplacerCurseurXY(70, 14); write('Quel est votre Genre ? (1) Homme, (2) Femme, (3) Autre : '); readln(choixGenre);
    
    while (choixGenre < 1) or (3 < choixGenre) do
    begin
      // Effacer la ligne pour ne pas voir la réponse précédente
      deplacerCurseurXY(127, 14); write('                                                                       ');
      deplacerCurseurXY(127, 14); readln(choixGenre);
    end;

    case choixGenre of
      1: genre := 'Homme';
      2: genre := 'Femme';
      3: genre := 'Autre';
    end;
  end;
  
end.