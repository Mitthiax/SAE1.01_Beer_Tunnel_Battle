unit unitMineIHM;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
  uses
    unitMineLogic;
  
  {
    Fonction qui permet au joueur de choisir entre combattre un ennemie ou quitter la mine
    Sortie:
      integer; Choix du joueur dans la mine
  }
  function choixMineIHM(): integer;
  
  {
    IHM de la mine
    Parametres:
      listeEnnemies: TListeEnnemies; Liste des ennemies proposés dans la mine
  }
  procedure mineIHM(listeEnnemies: TListeEnnemies);




  
implementation
  uses
    SysUtils, Classes, GestionEcran, journalihm;

  {
    Procedure qui affiche les ennemies
    Parametres:
      listeEnnemies: TListeEnnemies; Liste des ennemies proposés dans la mine
  }
  procedure afficherEnnemies(listeEnnemies: TListeEnnemies);
  const
    X = 50; Y = 5; // Coordonnées de l'affichage
    
  var
    i: integer; // Variable de boucle
    
  begin
    for i := low(listeEnnemies) to high(listeEnnemies) do
    begin
      deplacerCurseurXY(X-3, Y+1 +7*(i-1)); write(i);
      dessinerCadreXY(X, Y +7*(i-1), X+21, Y+5 +7*(i-1), simple, White, Black);
      dessinerCadreXY(X+5, Y+1 +7*(i-1), X+16, Y+1 +7*(i-1), double, White, Black);
      deplacerCurseurXY(X+11 - length(listeEnnemies[i].nom) div 2, Y+1 +7*(i-1)); write(listeEnnemies[i].nom);
      deplacerCurseurXY(X+2, Y+3 +7*(i-1)); write('PV :     ', listeEnnemies[i].PV);
      deplacerCurseurXY(X+2, Y+4 +7*(i-1)); write('Dégats : ', listeEnnemies[i].degats);
    end;
  end;
  
  {
    Fonction qui permet au joueur de choisir entre combattre un ennemie ou quitter la mine
    Sortie:
      integer; Choix du joueur dans la mine
  }
  function choixMineIHM(): integer;
  var
    choix: integer; // Choix du joueur dans la mine
    
  begin
    repeat
      dessinerCadreXY(100, 32, 110, 34, double, Red, Black);
      deplacerCurseurXY(105, 33); readln(choix);
    until ((1 <= choix) and (choix <= 4));
    couleurTexte(White);

    // Sortie
    choixMineIHM := choix;
  end;

  {
    IHM de la mine
    Parametres:
      listeEnnemies: TListeEnnemies; Liste des ennemies proposés dans la mine
  }
  procedure mineIHM(listeEnnemies: TListeEnnemies);
  begin
    effacerEcran();
    dessinerCadreXY(1, 0, 198, 39, simple, White, Black);
    deplacerCurseurXY(20, 29); write('?/ Attaquer un ennemie');
    deplacerCurseurXY(20, 32); write('4/ Retourner au hall');

    afficherEnnemies(listeEnnemies);

    journal(); // Afficher le journal du joueur
  end;
end.