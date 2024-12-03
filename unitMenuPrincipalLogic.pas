unit unitMenuPrincipalLogic;
{Role: Menu principal du jeu qui permet de lancer une partie ou de quitter le jeu.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
  // Menu principal du jeu qui permet de lancer une partie ou de quitter le jeu
  procedure menu();
  
implementation
  uses
    unitMenuPrincipalIHM,  GestionEcran, unitCreerPartieLogic;

  // Quitter le jeux
  procedure quitter();
  begin
    quitterIHM();
  end;

  // Menu principal du jeu qui permet de lancer une partie ou de quitter le jeu
  procedure menu();
  var
    choix: integer; // Choix du joueur dans le menu

  begin
    choix := menuIHM();
    while (choix <> 2) do
    begin
      if choix = 1 then creerPartie();
      choix := menuIHM();
    end;
    quitter();
  end;
end.
