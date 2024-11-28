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
  begin
    dessinerCadreXY(1, 0, 198, 39, simple, White, Black);
    dessinerCadreXY(80, 0, 120, 2, simple, White, Black);
    dessinerCadreXY(90, 1, 110, 3, simple, White, Black);
    deplacerCurseurXY(93, 2); write('Nouvelle partie');

    deplacerCurseurXY(70, 10); write('Quel est votre nom ? '); readln(nom);
    deplacerCurseurXY(70, 12); write('Quel est votre taille ? (en cm) '); readln(taille);
    deplacerCurseurXY(70, 14); write('Quel est votre Genre ? '); readln(genre);
  end;
  
end.